<?
$page = "user_friends_confirm";
include "header.php";


if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// RETURN USER TO FRIEND REQUEST PAGE IF INCORRECT USER IS SELECTED
if($task == "remove" | $task == "edit" | $task == "editdo") {
  $friend = $database->database_query("SELECT friend_id FROM se_friends WHERE friend_user_id1='".$user->user_info[user_id]."' AND friend_user_id2='".$owner->user_info[user_id]."' AND friend_status='1'");
  if($database->database_num_rows($friend) != 1) { header("Location: user_friends.php"); exit(); }
} elseif($task == "cancelrequest") {
  $friend = $database->database_query("SELECT friend_id FROM se_friends WHERE friend_user_id1='".$user->user_info[user_id]."' AND friend_user_id2='".$owner->user_info[user_id]."' AND friend_status='0'");
  if($database->database_num_rows($friend) != 1) { header("Location: user_friends_requests_outgoing.php"); exit(); }
} else {
  $friend = $database->database_query("SELECT friend_id FROM se_friends WHERE friend_user_id1='".$owner->user_info[user_id]."' AND friend_user_id2='".$user->user_info[user_id]."' AND friend_status='0'");
  if($database->database_num_rows($friend) != 1) { header("Location: user_friends_requests.php"); exit(); }
}


// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('friend_type', $friend_type);
$smarty->assign('friend_type_other', $friend_type_other);
$smarty->assign('friend_explain', $friend_explain);
$smarty->assign('friend_types', $friend_types);
include "footer.php";
?>