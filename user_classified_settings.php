<?php

/* $Id: user_classified_settings.php 7 2009-01-11 06:01:49Z john $ */

$page = "user_classified_settings";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// ENSURE classifiedS ARE ENABLED FOR THIS USER
if( !$user->level_info['level_classified_allow'] )
{
  header("Location: user_home.php");
  exit();
}

// SET VARS
$result = FALSE;

// SAVE NEW CSS
if($task == "dosave")
{
  $style_classified = addslashes(str_replace("-moz-binding", "", strip_tags(htmlspecialchars_decode($_POST['style_classified'], ENT_QUOTES))));
  $usersetting_notify_classifiedcomment = $_POST['usersetting_notify_classifiedcomment'];
  
  // STYLES
  $sql = "UPDATE se_classifiedstyles SET classifiedstyle_css='{$style_classified}' WHERE classifiedstyle_user_id='{$user->user_info[user_id]}'";
  $resource = $database->database_query($sql) or die($database->database_error()." <b>SQL was: </b>$sql");
  
  // USERSETTINGS
  $sql = "
    UPDATE
      se_usersettings
    SET
      usersetting_notify_classifiedcomment='{$usersetting_notify_classifiedcomment}'
    WHERE
      usersetting_user_id='{$user->user_info['user_id']}'
    LIMIT
      1
  ";
  $resource = $database->database_query($sql) or die($database->database_error()." <b>SQL was: </b>$sql");
  
  
  $user->user_lastupdate();
  $user = new se_user(Array($user->user_info['user_id'])); // HUH?
  $result = TRUE;
}


// GET THIS USER'S CLASSIFIED CSS
$sql = "SELECT classifiedstyle_css FROM se_classifiedstyles WHERE classifiedstyle_user_id='{$user->user_info['user_id']}' LIMIT 1";
$resource = $database->database_query($sql) or die($database->database_error()." <b>SQL was: </b>$sql");

if( $database->database_num_rows($resource) )
{ 
  $style_info = $database->database_fetch_assoc($resource); 
}
else
{
  $sql = "INSERT INTO se_classifiedstyles (classifiedstyle_user_id, classifiedstyle_css) VALUES ('{$user->user_info['user_id']}', '')";
  $resource = $database->database_query($sql) or die($database->database_error()." <b>SQL was: </b>$sql");
  
  $style_info = array
  (
    'classifiedstyle_id'      => $database->database_insert_id(),
    'classifiedstyle_user_id' => $user->user_info['user_id'],
    'classifiedstyle_css'     => ''
  );
}


// ASSIGN USER SETTINGS
$user->user_settings();


// ASSIGN SMARTY VARIABLES AND DISPLAY classified STYLE PAGE
$smarty->assign('style_classified', htmlspecialchars($style_info['classifiedstyle_css'], ENT_QUOTES, 'UTF-8'));
$smarty->assign('result', $result);
include "footer.php";
?>