<?php

require_once 'Id.php'; 
require_once 'PEAR.php'; 

/* $Id: user_music.php 11 2009-01-11 06:03:58Z john $ */

$page = "user_music";
include "header.php";
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['music_id'])) { $music_id = $_POST['music_id']; } elseif(isset($_GET['music_id'])) { $music_id = $_GET['music_id']; }

	$id = $_REQUEST['user_id'];
	if(!empty($id))
		$owner = new se_user(Array($id));
	else
		$owner = $user;

// ENSURE MUSIC IS ENABLED FOR THIS USER
if( !$user->level_info['level_music_allow'] ) { header("Location: user_home.php"); exit(); }



// CREATE MUSIC OBJECT
$music = new se_music($owner->user_info['user_id']);
$musiclist = $music->music_list();


// DELETE MULTIPLE SONGS
if( $task=="dodelete" )
{
  for( $i=0;$i<count($musiclist);$i++ )
  {
    $var = "delete_music_".$musiclist[$i]['music_id'];
    if( !empty($_POST[$var]) )
    {
      $music->music_delete($musiclist[$i]['music_id']);
    }
  }
}


// GET FRIENDS LIST
$friends = $owner->user_friend_list(0, 6, 0, 1, "RAND()");
$total_friends = $owner->user_friend_total(0);

// GET PLAYLIST
$musiclist = $music->music_list();


// GET TOTAL SPACE USED
$space_used = $music->music_space();
if( $user->level_info['level_music_storage'] ) {
  $space_left = $user->level_info['level_music_storage'] - $space_used;
} else {
  $space_left = ( $dfs=disk_free_space("/") ? $dfs : pow(2, 32) );
}
$space_left_mb = ($space_left / 1024) / 1024;
$space_left_mb = round($space_left_mb, 2);

$file = '/uploads_user/1000/' .$owner->user_info['user_id']. '/' .$musiclist[$i]['music_id']. '.mp3';

// создаем объект, считываем данные 
$id3 = &new MP3_Id(); 
$result = $id3->read($file); 

// ASSIGN VARIABLES
$smarty->assign('task', $task);
$smarty->assign('musiclist', $musiclist);
$smarty->assign('music_total', count($musiclist));
$smarty->assign('space_left', $space_left_mb);
$smarty->assign('friends', $friends);
$smarty->assign('total_friends', $total_friends);
$smarty->assign('total_friends', $total_friends);
$smarty->assign('total_friends_all', $total_friends_all);
$smarty->assign('total_friends_mut', $total_friends_mut);
include "footer.php";
?>
