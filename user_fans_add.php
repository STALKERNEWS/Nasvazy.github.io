<?
$page = "user_fans_add";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }


// ENSURE CONECTIONS ARE ALLOWED FOR THIS USER
$fanship_allowed = 1;
switch($setting[setting_connection_allow]) {
  case "3":
    // ANYONE CAN INVITE EACH OTHER TO BE fanS
    break;
  case "2":
    // CHECK IF IN SAME SUBNETWORK
    if($user->user_info[user_subnet_id] != $owner->user_info[user_subnet_id]) { $fanship_allowed = 0; }
    break;
  case "1":
    // CHECK IF fan OF fan
    if($user->user_fan_of_fan($owner->user_info[user_id]) == FALSE) { $fanship_allowed = 0; }
    break;
  case "0":
    // NO ONE CAN INVITE EACH OTHER TO BE fanS
    $fanship_allowed = 0;
    break;
}


// DISPLAY ERROR PAGE IF NO OWNER
if($owner->user_exists == 0) {
  $page = "error";
  $smarty->assign('error_header', $user_fans_add[1]);
  $smarty->assign('error_message', $user_fans_add[2]);
  $smarty->assign('error_submit', $user_fans_add[22]);
  include "footer.php";
}


// INITIALIZE VARS
$confirm = 1;
$result = "";
$is_error = 0;


// GET fan TYPES IF AVAILABLE
$connection_types = explode("<!>", trim($setting[setting_connection_types]));
if(count($connection_types) == 0 | str_replace(" ", "", $setting[setting_connection_types]) == "") { $fan_types = ""; } else { $fan_types = $connection_types; }

// DECIDE ON TASK
if($task != "cancel" & $task != "add") {
  if((count($connection_types) == 0 | str_replace(" ", "", $setting[setting_connection_types]) == "") & $setting[setting_connection_other] == 0 & $setting[setting_connection_explain] == 0) {
    $task = "add";
  }
}



// CANCEL
if($task == "cancel") {
  header("Location: ".$url->url_create("profile", $owner->user_info[user_username]));
  exit();

// fanSHIP NOT ALLOWED
} elseif($fanship_allowed == 0) {
  $result = $user_fans_add[21];
  $confirm = 0;
  $is_error = 1;


// CHECK IF USER IS ON BLOCKLIST
} elseif($owner->user_blocked($user->user_info[user_id])) {
  $result = $user_fans_add[3];
  $confirm = 0;
  $is_error = 1;


// CHECK IF USER IS TRYING TO fan THEMSELVES
} elseif($owner->user_info[user_id] == $user->user_info[user_id]) {
  $result = $user_fans_add[4];
  $confirm = 0;
  $is_error = 1;


// CHECK IF USER IS ALREADY fanED
} elseif($user->user_faned($owner->user_info[user_id])) {
  $result = $user_fans_add[5];
  $confirm = 0;
  $is_error = 1;


// CHECK IF USER IS ALREADY fanED, WAITING FOR CONFIRMATION
} elseif($user->user_faned($owner->user_info[user_id], 0)) {
  $result = $user_fans_add[20];
  $confirm = 0;
  $is_error = 1;

// CHECK IF USER fanED YOU ALREADY
} elseif($owner->user_faned($user->user_info[user_id], 0)) {
  $result = $user_fans_add[6];
  $confirm = 0;
  $is_error = 1;



// fan USER
} elseif($task == "add") {
  
  $fan_type = $_POST['fan_type'];
  $fan_type_other = censor($_POST['fan_type_other']);
  $fan_explain = censor($_POST['fan_explain']);
  
  if(count($connection_types) == 0) { $fan_type = ""; }
  if($setting[setting_connection_other] == 0) { $fan_type_other = ""; }
  if($setting[setting_connection_explain] == 0) { $fan_explain = ""; }

  if($fan_type == "other_fantype") { $fan_type = ""; }
  if(str_replace(" ", "", $fan_type_other) != "") { $fan_type = $fan_type_other; }

  switch($setting[setting_connection_framework]) {
    case "0":
      // SET RESULT, DIRECTION, STATUS
      $direction = 2;
      $fan_status = 0;
      $result = $user_fans_add[7];
      break;
    case "1":
      // SET RESULT, DIRECTION, STATUS
      $direction = 1;
      $fan_status = 0;
      $result = $user_fans_add[7];
      break;
    case "2": 
      // SET RESULT, DIRECTION, STATUS
      $direction = 2;
      $fan_status = 1;
      $result = $user_fans_add[8];
      break;
    case "3":
      // SET RESULT, DIRECTION, STATUS
      $direction = 1;
      $fan_status = 1;
      $result = $user_fans_add[8];
      break;      
  }

  // CREATE fanSHIP
  $user->user_fan_add($owner->user_info[user_id], $fan_status, $fan_type, $fan_explain);

  // IF TWO-WAY CONNECTION AND NON-CONFIRMED, INSERT OTHER DIRECTION
  if($direction == 2 & $fan_status == 1) { $owner->user_fan_add($user->user_info[user_id], $fan_status, '', ''); }

  // SEND fanSHIP EMAIL
  send_fanrequest($owner, $user->user_info[user_username]);

  // UPDATE STATS
  update_stats("fans");

  $confirm = 0;



// SHOW CONFIRMATION PAGE
} else {
  $confirm = 1;
}
  




// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('result', $result);
$smarty->assign('is_error', $is_error);
$smarty->assign('confirm', $confirm);
$smarty->assign('fan_types', $fan_types);
$smarty->assign('fan_other', $setting[setting_connection_other]);
$smarty->assign('fan_explain', $setting[setting_connection_explain]);
include "footer.php";
?>