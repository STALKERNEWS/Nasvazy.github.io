<?
$page = "user_fans_confirm";
include "header.php";


if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// CHECK FOR REDIRECTION URL
if(isset($_POST['return_url'])) { $return_url = $_POST['return_url']; } elseif(isset($_GET['return_url'])) { $return_url = $_GET['return_url']; } else { $return_url = ""; }
$return_url = urldecode($return_url);
$return_url = str_replace("&amp;", "&", $return_url);

// ENSURE CONECTIONS ARE ALLOWED FOR THIS USER
if($setting[setting_connection_allow] == 0) { header("Location: user_home.php"); exit(); }

// DISPLAY ERROR PAGE IF NO OWNER
if($owner->user_exists == 0) {
  $page = "error";
  $smarty->assign('error_header', $user_fans_confirm[1]);
  $smarty->assign('error_message', $user_fans_confirm[2]);
  $smarty->assign('error_submit', $user_fans_confirm[15]);
  include "footer.php";
}

// GET fan TYPES IF AVAILABLE
$connection_types = explode("<!>", trim($setting[setting_connection_types]));
if(count($connection_types) == 0 | str_replace(" ", "", $setting[setting_connection_types]) == "") { $fan_types = ""; } else { $fan_types = $connection_types; }

// CONFIRM fanSHIP REQUEST
if($task == "confirm") {

  $fan1 = $database->database_query("SELECT fan_id FROM se_fans WHERE fan_user_id1='".$owner->user_info[user_id]."' AND fan_user_id2='".$user->user_info[user_id]."' AND fan_status='0'");
  $fan2 = $database->database_query("SELECT fan_id FROM se_fans WHERE fan_user_id2='".$owner->user_info[user_id]."' AND fan_user_id1='".$user->user_info[user_id]."'");

  // CONFIRM fan REQUEST  
  if($database->database_num_rows($fan1) == 1) {
    $fanship = $database->database_fetch_assoc($fan1);
    $database->database_query("UPDATE se_fans SET fan_status='1' WHERE fan_id='$fanship[fan_id]'");

    // INSERT ACTION
    $actions->actions_add($user, "addfan", Array('[username1]', '[username2]'), Array($user->user_info[user_username], $owner->user_info[user_username]));

    // INSERT ACTION
    $actions->actions_add($owner, "addfan", Array('[username1]', '[username2]'), Array($owner->user_info[user_username], $user->user_info[user_username]));

  }

  // INSERT ADDITIONAL ROW IF TWO-DIRECTIONAL CONFIRMED
  if($database->database_num_rows($fan2) == 0 & $setting[setting_connection_framework] == 0) {
    $user->user_fan_add($owner->user_info[user_id], 1, '', '');

  // UPDATE ROW IF TWO-DIRECTIONAL BUT ROW ALREADY EXISTS
  } elseif($database->database_num_rows($fan2) != 0 & $setting[setting_connection_framework] == 0) {
    $fanship = $database->database_fetch_assoc($fan2);
    $database->database_query("UPDATE se_fans SET fan_status='1' WHERE fan_id='$fanship[fan_id]'");
  }

  // UPDATE STATS
  update_stats("fans");

  // DECIDE WHETHER TO EDIT DETAILS
  if($setting[setting_connection_framework] != 0) {
    // DECIDE WHERE TO SEND USER IF ADDITIONAL fan REQUESTS
    if($user->user_fan_total(1, 0) == 0) { header("Location: user_home.php"); exit(); } else { header("Location: user_home.php"); exit(); }
  } else {
    if((count($connection_types) == 0 | str_replace(" ", "", $setting[setting_connection_types]) == "") & $setting[setting_connection_other] == 0 & $setting[setting_connection_explain] == 0) {
      if($user->user_fan_total(1, 0) == 0) { header("Location: user_home.php"); exit(); } else { header("Location: user_home.php"); exit(); }
    } else {
      $task = "edit";
    }
  }
}

// REJECT fanSHIP REQUEST AND SEND USER BACK
if($task == "reject") {
  $owner->user_fan_remove($user->user_info[user_id]);
  if($user->user_fan_total(1, 0) == 0) { header("Location: user_home.php"); exit(); } else { header("Location: user_home.php"); exit(); }
}

include "footer.php";
?>
