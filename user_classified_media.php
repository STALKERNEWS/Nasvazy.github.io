<?php

/* $Id: user_classified_media.php 16 2009-01-13 04:01:31Z john $ */

$page = "user_classified_media";
include "header.php";

if(isset($_GET['task'])) { $task = $_GET['task']; } elseif(isset($_POST['task'])) { $task = $_POST['task']; } else { $task = ""; }
if(isset($_GET['classified_id'])) { $classified_id = $_GET['classified_id']; } elseif(isset($_POST['classified_id'])) { $classified_id = $_POST['classified_id']; } else { $classified_id = 0; }
if(isset($_GET['classifiedmedia_id'])) { $classifiedmedia_id = $_GET['classifiedmedia_id']; } elseif(isset($_POST['classifiedmedia_id'])) { $classifiedmedia_id = $_POST['classifiedmedia_id']; } else { $classifiedmedia_id = 0; }
if(isset($_POST['spot'])) { $spot = $_POST['spot']; } else { $spot = "1"; }
if(isset($_GET['justadded'])) { $justadded = $_GET['justadded']; } elseif(isset($_POST['justadded'])) { $justadded = $_POST['justadded']; } else { $justadded = 0; }

// ENSURE CLASSIFIED ARE ENABLED FOR THIS USER
if( !$user->level_info['level_classified_allow'] )
{
  header("Location: user_home.php");
  exit();
}

// MAKE SURE THIS CLASSIFIED BELONGS TO THIS USER AND IS NUMERIC
$classified = $database->database_query("SELECT * FROM se_classifieds WHERE classified_id='{$classified_id}' AND classified_user_id='{$user->user_info['user_id']}' LIMIT 1");
if( !$database->database_num_rows($classified) )
{
  header("Location: user_classified.php");
  exit();
}
$classified_info = $database->database_fetch_assoc($classified);

// INITIALIZE CLASSIFIED OBJECT
$classified = new se_classified($user->user_info['user_id'], $classified_id);

// SHOW BLANK PAGE FOR AJAX
if($task == "blank") {
  exit;
}




// DELETE SMALL PHOTO WITH IFRAME AJAX
if($task == "deletemedia") {

  $classified->classified_media_delete(0, 1, "se_classifiedmedia.classifiedmedia_id DESC", "se_classifiedmedia.classifiedmedia_id='{$classifiedmedia_id}'");
  exit;
}




// UPLOAD LARGE PHOTO WITH IFRAME AJAX
if($task == "uploadmedia") {

  // GET ALBUM INFO
  $classifiedalbum_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_classifiedalbums WHERE classifiedalbum_classified_id='{$classified_id}' LIMIT 1"));

  // GET TOTAL SPACE USED
  $space_used = $classified->classified_media_space();
  $space_left = ( !empty($classified->classifiedowner_level_info['level_classified_album_storage']) ? ($classified->classifiedowner_level_info['level_classified_album_storage'] - $space_used) : FALSE );

  $fileid = "file";
  if($_FILES[$fileid]['name'] != "") {
    $file_result[$fileid] = $classified->classified_media_upload($fileid, $classifiedalbum_info['classifiedalbum_id'], $space_left);
    if($file_result[$fileid]['is_error'] == 0) {
      $file_result[$fileid]['message'] = $classified->classified_dir($classified_id).$file_result[$fileid]['classifiedmedia_id'].".".$file_result[$fileid]['classifiedmedia_ext'];
      $classifiedmedia_id_new = $file_result[$fileid]['classifiedmedia_id'];
    } else {
      $file_result[$fileid]['message'] = addslashes($file_result[$fileid]['error_message']);
    }
  } else {
      $file_result[$fileid]['is_error'] = 1;
      $file_result[$fileid]['message'] = $user_classified_edit_media[16];
  }

  $result = $file_result[$fileid]['message'];
  $result_code = $file_result[$fileid]['is_error'];

  echo "<html><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'></head><body onLoad=\"parent.uploadComplete('$result_code', '$result', '$spot', '$classifiedmedia_id_new');\"></body></html>";
  exit;
}




// UPLOAD SMALL PHOTO
if($task == "upload") {
  $classified->classified_photo_upload("photo");
  $is_error = $classified->is_error;
  $error_message = $classified->error_message;
  if($is_error == 0) { $classified->classified_lastupdate(); }
}




// GET CLASSIFIED ALBUM INFO
$classifiedalbum_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_classifiedalbums WHERE classifiedalbum_classified_id='{$classified->classified_info['classified_id']}' LIMIT 1"));

// GET TOTAL FILES IN CLASSIFIED ALBUM
$total_files = $classified->classified_media_total($classifiedalbum_info[classifiedalbum_id]);

// MAKE MEDIA PAGES
$files_per_page = 16;
$p = 1;
$page_vars = make_page($total_files, $files_per_page, $p);

// GET MEDIA ARRAY
$file_array = $classified->classified_media_list($page_vars[0], $files_per_page, "classifiedmedia_id ASC", "(classifiedmedia_classifiedalbum_id='{$classifiedalbum_info['classifiedalbum_id']}')");

$smarty->assign('files', $file_array);
$smarty->assign('total_files', $total_files);
$smarty->assign('error_message', $error_message);
$smarty->assign('classified', $classified);
$smarty->assign('classified_id', $classified_id);
$smarty->assign('justadded', $justadded);
include "footer.php";
?>