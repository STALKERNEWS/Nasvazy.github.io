<?php

/* $Id: user_album_edit.php 2 2009-01-10 20:53:09Z john $ */

$page = "user_album_edit";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_GET['album_id'])) { $album_id = $_GET['album_id']; } elseif(isset($_POST['album_id'])) { $album_id = $_POST['album_id']; } else { exit(); }

// ENSURE ALBUMS ARE ENABLED FOR THIS USER
if($user->level_info[level_album_allow] == 0) { header("Location: user_home.php"); exit(); }

// BE SURE ALBUM BELONGS TO THIS USER
$album = $database->database_query("SELECT * FROM se_albums WHERE album_id='$album_id' AND album_user_id='".$user->user_info[user_id]."'");
if($database->database_num_rows($album) != 1) { header("Location: user_album.php"); exit(); }
$album_info = $database->database_fetch_assoc($album);

// SET VARIABLES
$result = 0;
$is_error = 0;


// GET PRIVACY SETTINGS
$level_album_privacy = unserialize($user->level_info[level_album_privacy]);
rsort($level_album_privacy);
$level_album_comments = unserialize($user->level_info[level_album_comments]);
rsort($level_album_comments);
$level_album_tag = unserialize($user->level_info[level_album_tag]);
rsort($level_album_tag);


// SAVE NEW INFO
if($task == "dosave") {
  $album_info[album_title] = censor($_POST['album_title']);
  $album_info[album_desc] = censor(str_replace("\r\n", "<br>", $_POST['album_desc']));
  $album_info[album_search] = $_POST['album_search'];
  $album_info[album_privacy] = $_POST['album_privacy'];
  $album_info[album_comments] = $_POST['album_comments'];
  $album_info[album_tag] = $_POST['album_tag'];
  $album_info[album_dateupdated] = time();


  // MAKE SURE SUBMITTED PRIVACY OPTIONS ARE ALLOWED, IF NOT, SET TO EVERYONE
  if(!in_array($album_info[album_privacy], $level_album_privacy)) { $album_info[album_privacy] = $level_album_privacy[0]; }
  if(!in_array($album_info[album_comments], $level_album_comments)) { $album_info[album_comments] = $level_album_comments[0]; }
  if(!in_array($album_info[album_tag], $level_album_tag)) { $album_info[album_tag] = $level_album_tag[0]; }

  // CHECK THAT TITLE IS NOT BLANK
  if(trim($album_info[album_title]) == "") { $is_error = 1000073; }

  // IF NO ERROR, CONTINUE
  if($is_error == 0) {

    // EDIT ALBUM IN DATABASE
    $database->database_query("UPDATE se_albums SET album_title='$album_info[album_title]',
				    album_desc='$album_info[album_desc]',
				    album_search='$album_info[album_search]',
				    album_privacy='$album_info[album_privacy]',
				    album_comments='$album_info[album_comments]',
				    album_tag='$album_info[album_tag]',
				    album_dateupdated='$album_info[album_dateupdated]' WHERE album_id='$album_info[album_id]'");

    // UPDATE LAST UPDATE DATE (SAY THAT 10 TIMES FAST)
    $user->user_lastupdate();

    $result = 1;
  }
}




// GET PREVIOUS PRIVACY SETTINGS
for($c=0;$c<count($level_album_privacy);$c++) {
  if(user_privacy_levels($level_album_privacy[$c]) != "") {
    SE_Language::_preload(user_privacy_levels($level_album_privacy[$c]));
    $privacy_options[$level_album_privacy[$c]] = user_privacy_levels($level_album_privacy[$c]);
  }
}

for($c=0;$c<count($level_album_comments);$c++) {
  if(user_privacy_levels($level_album_comments[$c]) != "") {
    SE_Language::_preload(user_privacy_levels($level_album_comments[$c]));
    $comment_options[$level_album_comments[$c]] = user_privacy_levels($level_album_comments[$c]);
  }
}

for($c=0;$c<count($level_album_tag);$c++) {
  if(user_privacy_levels($level_album_tag[$c]) != "") {
    SE_Language::_preload(user_privacy_levels($level_album_tag[$c]));
    $tag_options[$level_album_tag[$c]] = user_privacy_levels($level_album_tag[$c]);
  }
}

// RESTORE LINE BREAKS
$album_info[album_desc] = str_replace("<br>", "\r\n", $album_info[album_desc]);

// ASSIGN VARIABLES AND SHOW EDIT ALBUMS PAGE
$smarty->assign('result', $result);
$smarty->assign('is_error', $is_error);
$smarty->assign('album_info', $album_info);
$smarty->assign('privacy_options', $privacy_options);
$smarty->assign('comment_options', $comment_options);
$smarty->assign('tag_options', $tag_options);
include "footer.php";
?>