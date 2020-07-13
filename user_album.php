<?php

/* $Id: user_album.php 16 2009-01-13 04:01:31Z john $ */

$page = "user_album";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// ENSURE ALBUMS ARE ENABLED FOR THIS USER
if($user->level_info[level_album_allow] == 0) { header("Location: user_home.php"); exit(); }



$output = 5;// Кол-во выводимых фотографий
$t_uid = $owner -> user_info[user_id];
$t_uname = $owner -> user_info[user_username];
$result = $database -> database_query("SELECT `album_id` FROM `se_albums` WHERE `album_user_id` = '$t_uid'");
$t_albums = array();
$t_media_ids = array();
$last_photos_array = array();

while( list($t_albums[]) = $database -> database_fetch_array($result) )
{
}

foreach($t_albums as $t_album)
{
		$result = $database -> database_query("SELECT `media_id`, `media_date` FROM `se_media` WHERE `media_album_id` = '$t_album'");

		while( list($t_media_id, $t_media_date) = $database -> database_fetch_array($result) )
		{
				$t_media_ids[$t_media_date] = $t_media_id;
		}
}
arsort($t_media_ids);
reset($t_media_ids);
$t_amount = count($t_media_ids);
$output = ($t_amount < $output) ? $t_amount : $output;

for($i = 0; $i < $output; $i++)
{
		$t_arr = array();
		$t_id = current($t_media_ids);
		$result = $database -> database_query("SELECT * FROM `se_media` WHERE `media_id` = '$t_id'");
		$t_arr = $database -> database_fetch_assoc($result);
		$t_arr['user_id'] = $t_uid;
		$t_arr['user_username'] = $t_uname;
		$t_arr['media_path'] = $url->url_userdir( $t_uid ).	$t_arr['media_id'].'.'.	$t_arr['media_ext'];
    $last_photos_array[] = $t_arr;
		@next($t_media_ids);
}
$smarty->assign('last_photos', $last_photos_array);




// CREATE ALBUM OBJECT
$album = new se_album($owner->user_info[user_id]);


// BE SURE ALBUM BELONGS TO THIS USER, DELETE ALBUM
if($task == "delete") {
  $album_id = $_GET['album_id'];
  if($database->database_num_rows($database->database_query("SELECT album_id FROM se_albums WHERE album_id='$album_id' AND album_user_id='".$user->user_info[user_id]."'")) == 1) { 
    $album->album_delete($album_id);    
  }



// MOVE ALBUM UP
} elseif($task == "moveup") {
  $album_id = $_GET['album_id'];

  $album_query = $database->database_query("SELECT album_id, album_order FROM se_albums WHERE album_id='$album_id' AND album_user_id='".$user->user_info[user_id]."'");
  if($database->database_num_rows($album_query) == 1) { 

    $album_info = $database->database_fetch_assoc($album_query);

    $prev_query = $database->database_query("SELECT album_id, album_order FROM se_albums WHERE album_user_id='".$user->user_info[user_id]."' AND album_order<'".$album_info[album_order]."' ORDER BY album_order DESC LIMIT 1");
    if($database->database_num_rows($prev_query) == 1) {

      $prev_info = $database->database_fetch_assoc($prev_query);

      // SWITCH ORDER
      $database->database_query("UPDATE se_albums SET album_order='" . $prev_info[album_order] . "' WHERE album_id='" . $album_info[album_id] . "'" );
      $database->database_query("UPDATE se_albums SET album_order='" . $album_info[album_order] . "' WHERE album_id='" . $prev_info[album_id]. "'");

      // SEND AJAX CONFIRMATION
      echo "<html><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'><script type='text/javascript'>";
      echo "window.parent.reorderAlbum('$album_info[album_id]', '$prev_info[album_id]');";
      echo "</script></head><body></body></html>";
      exit();

    } 
  }
}


// GET ALBUMS
$total_albums = $album->album_total();
$album_array = $album->album_list(0, $total_albums, "album_order ASC");

$space_used = $album->album_space();
$total_files = $album->album_files();

// CALCULATE SPACE FREE, CONVERT TO MEGABYTES
if($user->level_info[level_album_storage]) {
  $space_free = $user->level_info[level_album_storage] - $space_used;
} else {
  $space_free = ( $dfs=disk_free_space("/") ? $dfs : pow(2, 32) );
} 
$space_free = ($space_free / 1024) / 1024;
$space_free = round($space_free, 2);


// ASSIGN VARIABLES AND SHOW VIEW ALBUMS PAGE
$smarty->assign('space_free', $space_free);
$smarty->assign('total_files', $total_files);
$smarty->assign('albums_total', $total_albums);
$smarty->assign('albums', $album_array);
include "footer.php";
?>