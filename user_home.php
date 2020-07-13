<?php

/* $Id: user_home.php 42 2009-01-29 04:55:14Z john $ */

$page = "user_home";
include "header.php";


if(isset($_GET['task'])) { $task = $_GET['task']; } elseif(isset($_POST['task'])) { $task = $_POST['task']; } else { $task = "main"; }


// RESET PROFILE VIEWS
if($task == "resetviews")
{
  $database->database_query("UPDATE se_profileviews SET profileview_views=0, profileview_viewers='' WHERE profileview_user_id='{$user->user_info['user_id']}' LIMIT 1");
}



// POPULATE USER SETTINGS ARRAY
$user->user_settings();



// GET NEWS ITEMS
$news_array = site_news();

$smarty->assign_by_ref('news', $news_array);



// RETRIEVE VIEWS AND VIEWERS IF NECESSARY
$profile_views = 0;
$profile_viewers = Array();
$view_query = $database->database_query("SELECT profileview_views, profileview_viewers FROM se_profileviews WHERE profileview_user_id='{$user->user_info['user_id']}'");
if($database->database_num_rows($view_query) == 1)
{
  $views = $database->database_fetch_assoc($view_query);
  $profile_views = $views['profileview_views'];
  if($views['profileview_viewers'] == "") { $views['profileview_viewers'] = "''"; }
  $viewer_query = $database->database_query("SELECT user_id, user_username, user_fname, user_lname FROM se_users WHERE user_id IN ({$views['profileview_viewers']})");
  while($viewer_info = $database->database_fetch_assoc($viewer_query))
  {
    $viewer = new se_user();
    $viewer->user_info['user_id'] = $viewer_info['user_id'];
    $viewer->user_info['user_username'] = $viewer_info['user_username'];
    $viewer->user_info['user_fname'] = $viewer_info['user_fname'];
    $viewer->user_info['user_lname'] = $viewer_info['user_lname'];
    $viewer->user_displayname();
    
    // SET PROFILE VIEWERS 
    $profile_viewers[] = $viewer;
  }
  
  $profile_viewers_array = explode(",", $views['profileview_viewers']);
  usort($profile_viewers, create_function('$a,$b', 'global $profile_viewers_array; if(array_search($a->user_info["user_id"], $profile_viewers_array) == array_search($b->user_info["user_id"], $profile_viewers_array)) { return 0; } else { return (array_search($a->user_info["user_id"], $profile_viewers_array) < array_search($b->user_info["user_id"], $profile_viewers_array)) ? -1 : 1; }'));
}


// CREATE ARRAY OF ACTION TYPES
$actiontypes_array = $actions->actions_allowed();

$smarty->assign_by_ref('actiontypes', $actiontypes_array);



// GET UPCOMING BIRTHDAYS, START BY CHECKING FOR BIRTHDAY PROFILE FIELDS
$birthday_array = friends_birthdays();

$smarty->assign_by_ref('birthdays', $birthday_array);




// Get online users
$online_array = online_users();

$smarty->assign_by_ref('online_users', $online_array);



// GET RANDOM USERS 
$randoms_query = $database->database_query(" 
  
  SELECT  
    user_id,  
    user_username,  
    user_photo  
  FROM  
    se_users  
  WHERE  
    user_verified='1'  
  AND  
    user_enabled='1'   
  ORDER BY  
    rand()  
  DESC LIMIT  
    1000 
  "); 
   
$random_array = Array(); 
while($random = $database->database_fetch_assoc($randoms_query)) { 

  $random_user = new se_user($random[user_id]); 
  $random_user->user_info[user_id] = $random[user_id]; 
  $random_user->user_info[user_username] = $random[user_username]; 
  $random_profile->profile_info[profile_8] = $random[profile_8]; 
  $random_profile->profile_info[profile_10] = $random[profile_10]; 
  $random_user->user_info[user_photo] = $random[user_photo]; 
  $random_user->user_info[user_lastlogindate] = $random[user_lastlogindate]; 

  $random_array[] = $random_user; 
}   



$smarty->assign('randoms', $random_array); 


// Get actions feed - Has code in it that is preventing direct caching
$actions_array = $actions->actions_display($setting['setting_actions_visibility'], $setting['setting_actions_actionsperuser']);

$smarty->assign_by_ref('actions', $actions_array);


// ONLY MY FRIENDS' MUSIC
if( $v=="1" && $user->user_exists )
{
  // SET WHERE CLAUSE
  $where = "(
    SELECT
      TRUE
    FROM
      se_friends
    WHERE
      friend_user_id1={$user->user_info[user_id]} &&
      friend_user_id2=se_music.music_user_id &&
      friend_status=1
    ) 
  ";
}


// CREATE ALBUM OBJECT
$music_object = new se_music();

// GET TOTAL ALBUMS
$browse_music_total = $music_object->music_list_total(NULL, NULL, $where);

// MAKE ENTRY PAGES
$music_per_page = 20;
$page_vars = make_page($browse_music_total, $music_per_page, $p);

// GET ALBUM ARRAY
$browse_music_list = $music_object->music_list($page_vars[0], $music_per_page, $s, $where);


// ASSIGN SMARTY VARIABLES AND DISPLAY MUSIC PAGE
$smarty->assign('browse_music_list', $browse_music_list);
$smarty->assign('browse_music_total', $browse_music_total);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('search', $search);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($browse_music_list));
$smarty->assign('s', $s);
$smarty->assign('v', $v);




// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if( !$user->user_exists && !$setting['setting_permission_video'] )
{
  $page = "error";
  $smarty->assign('error_header', 639);
  $smarty->assign('error_message', 656);
  $smarty->assign('error_submit', 641);
  include "footer.php";
}


// PARSE GET/POST
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_POST['s'])) { $s = $_POST['s']; } elseif(isset($_GET['s'])) { $s = $_GET['s']; } else { $s = "video_datecreated DESC"; }
if(isset($_POST['v'])) { $v = $_POST['v']; } elseif(isset($_GET['v'])) { $v = $_GET['v']; } else { $v = 0; }
if(isset($_POST['search'])) { $search = $_POST['search']; } elseif(isset($_GET['search'])) { $search = $_GET['search']; } else { $search = ""; }

if($search != "") { 
  $where .= "(video_title LIKE '%$search%' )"; 
}
// ENSURE SORT/VIEW ARE VALID
if($s != "video_datecreated DESC" && $s != "video_views DESC" && $s != "video_cache_rating_weighted DESC") { $s = "video_dateupdated DESC"; }
if($v != "0" && $v != "1") { $v = 0; }




// SET WHERE CLAUSE
$where = "video_search='1' AND video_is_converted='1' AND
	(CASE
	    WHEN se_videos.video_user_id='{$user->user_info['user_id']}'
	      THEN TRUE
	    WHEN ((se_videos.video_privacy & @SE_PRIVACY_REGISTERED) AND '{$user->user_exists}'<>0)
	      THEN TRUE
	    WHEN ((se_videos.video_privacy & @SE_PRIVACY_ANONYMOUS) AND '{$user->user_exists}'=0)
	      THEN TRUE
	    WHEN ((se_videos.video_privacy & @SE_PRIVACY_FRIEND) AND (SELECT TRUE FROM se_friends WHERE friend_user_id1=se_videos.video_user_id AND friend_user_id2='{$user->user_info['user_id']}' AND friend_status='1' LIMIT 1))
	      THEN TRUE
	    WHEN ((se_videos.video_privacy & @SE_PRIVACY_SUBNET) AND '{$user->user_exists}'<>0 AND (SELECT TRUE FROM se_users WHERE user_id=se_videos.video_user_id AND user_subnet_id='{$user->user_info['user_subnet_id']}' LIMIT 1))
	      THEN TRUE
	    WHEN ((se_videos.video_privacy & @SE_PRIVACY_FRIEND2) AND (SELECT TRUE FROM se_friends AS friends_primary LEFT JOIN se_users ON friends_primary.friend_user_id1=se_users.user_id LEFT JOIN se_friends AS friends_secondary ON friends_primary.friend_user_id2=friends_secondary.friend_user_id1 WHERE friends_primary.friend_user_id1=se_videos.video_user_id AND friends_secondary.friend_user_id2='{$user->user_info['user_id']}' AND se_users.user_subnet_id='{$user->user_info['user_subnet_id']}' LIMIT 1))
	      THEN TRUE
	    ELSE FALSE
	END)";


// ONLY MY FRIENDS' VIDEOS
if($v == "1" && $user->user_exists) {

  // SET WHERE CLAUSE
  $where .= " AND (SELECT TRUE FROM se_friends WHERE friend_user_id1='{$user->user_info['user_id']}' AND friend_user_id2=se_videos.video_user_id AND friend_status=1)";

}



// CREATE VIDEO OBJECT
$video = new se_video();

// GET TOTAL VIDEOS
$total_videos = $video->video_total($where);

// MAKE ENTRY PAGES
$videos_per_page = 21;
$page_vars = make_page($total_videos, $videos_per_page, $p);

// GET VIDEO ARRAY
$video_array = $video->video_list($page_vars[0], $videos_per_page, $s, $where, 1);


// ASSIGN SMARTY VARIABLES AND DISPLAY VIDEOS PAGE
$smarty->assign('videos', $video_array);
$smarty->assign('total_videos', $total_videos);
$smarty->assign('search', $search);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($video_array));
$smarty->assign('s', $s);
$smarty->assign('v', $v);
// ASSIGN SMARTY VARS AND INCLUDE FOOTER
$smarty->assign('profile_views', $profile_views);
$smarty->assign('profile_viewers', $profile_viewers);
$smarty->assign('total_friend_requests', $user->user_friend_total(1, 0));
// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if( !$user->user_exists && !$setting['setting_permission_album'] )
{
  $page = "error";
  $smarty->assign('error_header', 639);
  $smarty->assign('error_message', 656);
  $smarty->assign('error_submit', 641);
  include "footer.php";
}


// PARSE GET/POST
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_POST['s'])) { $s = $_POST['s']; } elseif(isset($_GET['s'])) { $s = $_GET['s']; } else { $s = "album_datecreated DESC"; }
if(isset($_POST['v'])) { $v = $_POST['v']; } elseif(isset($_GET['v'])) { $v = $_GET['v']; } else { $v = 0; }

// ENSURE SORT/VIEW ARE VALID
if($s != "album_datecreated DESC" && $s != "album_dateupdated DESC") { $s = "album_dateupdated DESC"; }
if($v != "0" && $v != "1") { $v = 0; }


// SET WHERE CLAUSE
$where = "CASE
	    WHEN se_albums.album_user_id='{$user->user_info[user_id]}'
	      THEN TRUE
	    WHEN ((se_albums.album_privacy & @SE_PRIVACY_REGISTERED) AND '{$user->user_exists}'<>0)
	      THEN TRUE
	    WHEN ((se_albums.album_privacy & @SE_PRIVACY_ANONYMOUS) AND '{$user->user_exists}'=0)
	      THEN TRUE
	    WHEN ((se_albums.album_privacy & @SE_PRIVACY_FRIEND) AND (SELECT TRUE FROM se_friends WHERE friend_user_id1=se_albums.album_user_id AND friend_user_id2='{$user->user_info[user_id]}' AND friend_status='1' LIMIT 1))
	      THEN TRUE
	    WHEN ((se_albums.album_privacy & @SE_PRIVACY_SUBNET) AND '{$user->user_exists}'<>0 AND (SELECT TRUE FROM se_users WHERE user_id=se_albums.album_user_id AND user_subnet_id='{$user->user_info[user_subnet_id]}' LIMIT 1))
	      THEN TRUE
	    WHEN ((se_albums.album_privacy & @SE_PRIVACY_FRIEND2) AND (SELECT TRUE FROM se_friends AS friends_primary LEFT JOIN se_users ON friends_primary.friend_user_id1=se_users.user_id LEFT JOIN se_friends AS friends_secondary ON friends_primary.friend_user_id2=friends_secondary.friend_user_id1 WHERE friends_primary.friend_user_id1=se_albums.album_user_id AND friends_secondary.friend_user_id2='{$user->user_info[user_id]}' AND se_users.user_subnet_id='{$user->user_info[user_subnet_id]}' LIMIT 1))
	      THEN TRUE
	    ELSE FALSE
	END";


// ONLY MY FRIENDS' ALBUMS
if($v == "1" && $user->user_exists) {

  // SET WHERE CLAUSE
  $where .= " AND (SELECT TRUE FROM se_friends WHERE friend_user_id1='{$user->user_info['user_id']}' AND friend_user_id2=se_albums.album_user_id AND friend_status=1)";

}



// CREATE ALBUM OBJECT
$album = new se_album();

// GET TOTAL ALBUMS
$total_albums = $album->album_total($where);

// MAKE ENTRY PAGES
$albums_per_page = 10;
$page_vars = make_page($total_albums, $albums_per_page, $p);

// GET ALBUM ARRAY
$album_array = $album->album_list($page_vars[0], $albums_per_page, $s, $where);


// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if( (!$user->user_exists && !$setting['setting_permission_group']) || ($user->user_exists && (~(int)$user->level_info['level_group_allow'] & 1)) )
{
  $page = "error";
  $smarty->assign('error_header', 639);
  $smarty->assign('error_message', 656);
  $smarty->assign('error_submit', 641);
  include "footer.php";
}


// PARSE GET/POST
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_POST['s'])) { $s = $_POST['s']; } elseif(isset($_GET['s'])) { $s = $_GET['s']; } else { $s = "group_datecreated DESC"; }
if(isset($_POST['v'])) { $v = $_POST['v']; } elseif(isset($_GET['v'])) { $v = $_GET['v']; } else { $v = 0; }
if(isset($_POST['groupcat_id'])) { $groupcat_id = $_POST['groupcat_id']; } elseif(isset($_GET['groupcat_id'])) { $groupcat_id = $_GET['groupcat_id']; } else { $groupcat_id = 0; }

// ENSURE SORT/VIEW ARE VALID
if($s != "group_datecreated DESC" && $s != "group_totalmembers DESC") { $s = "group_datecreated DESC"; }
if($v != "0" && $v != "1") { $v = 0; }


// SET WHERE CLAUSE
$where = "CASE
	    WHEN se_groups.group_user_id='{$user->user_info['user_id']}'
	      THEN TRUE
	    WHEN ((se_groups.group_privacy & 32) AND '{$user->user_exists}'<>0)
	      THEN TRUE
	    WHEN ((se_groups.group_privacy & 64) AND '{$user->user_exists}'=0)
	      THEN TRUE
	    WHEN ((se_groups.group_privacy & 2) AND (SELECT TRUE FROM se_groupmembers WHERE groupmember_user_id='{$user->user_info['user_id']}' AND groupmember_group_id=se_groups.group_id AND groupmember_status=1 LIMIT 1))
	      THEN TRUE
	    WHEN ((se_groups.group_privacy & 4) AND '{$user->user_exists}'<>0 AND (SELECT TRUE FROM se_friends WHERE friend_user_id1=se_groups.group_user_id AND friend_user_id2='{$user->user_info['user_id']}' AND friend_status=1 LIMIT 1))
	      THEN TRUE
	    WHEN ((se_groups.group_privacy & 8) AND '{$user->user_exists}'<>0 AND (SELECT TRUE FROM se_groupmembers LEFT JOIN se_friends ON se_groupmembers.groupmember_user_id=se_friends.friend_user_id1 WHERE se_groupmembers.groupmember_group_id=se_groups.group_id AND se_friends.friend_user_id2='{$user->user_info['user_id']}' AND se_groupmembers.groupmember_status=1 AND se_friends.friend_status=1 LIMIT 1))
	      THEN TRUE
	    WHEN ((se_groups.group_privacy & 16) AND '{$user->user_exists}'<>0 AND (SELECT TRUE FROM se_groupmembers LEFT JOIN se_friends AS friends_primary ON se_groupmembers.groupmember_user_id=friends_primary.friend_user_id1 LEFT JOIN se_friends AS friends_secondary ON friends_primary.friend_user_id2=friends_secondary.friend_user_id1 WHERE se_groupmembers.groupmember_group_id=se_groups.group_id AND se_groupmembers.groupmember_status=1 AND friends_secondary.friend_user_id2='{$user->user_info['user_id']}' AND friends_primary.friend_status=1 AND friends_secondary.friend_status=1 LIMIT 1))
	      THEN TRUE
	    ELSE FALSE
	END";


// ONLY MY FRIENDS' GROUPS
if($v == "1" && $user->user_exists)
{
  // SET WHERE CLAUSE
  $where .= " AND (SELECT TRUE FROM se_friends LEFT JOIN se_groupmembers ON se_friends.friend_user_id2=se_groupmembers.groupmember_user_id WHERE friend_user_id1='{$user->user_info['user_id']}' AND friend_status=1 AND groupmember_group_id=se_groups.group_id AND groupmember_status=1 LIMIT 1)";
}


// SPECIFIC GROUP CATEGORY
if( is_numeric($groupcat_id) )
{
  $groupcat_query = $database->database_query("SELECT groupcat_id, groupcat_title, groupcat_dependency FROM se_groupcats WHERE groupcat_id='{$groupcat_id}' LIMIT 1");
  if( $database->database_num_rows($groupcat_query) )
  {
    $groupcat = $database->database_fetch_assoc($groupcat_query);
    if( !$groupcat['groupcat_dependency'] )
    {
      $cat_ids[] = $groupcat['groupcat_id'];
      $depcats = $database->database_query("SELECT groupcat_id FROM se_groupcats WHERE groupcat_id='{$groupcat['groupcat_id']}' OR groupcat_dependency='{$groupcat['groupcat_id']}'");
      while($depcat_info = $database->database_fetch_assoc($depcats)) { $cat_ids[] = $depcat_info['groupcat_id']; }
      $where .= " AND se_groups.group_groupcat_id IN('".implode("', '", $cat_ids)."')";
    }
    else
    {
      $where .= " AND se_groups.group_groupcat_id='{$groupcat['groupcat_id']}'";
      $groupsubcat = $groupcat;
      $groupcat = $database->database_fetch_assoc($database->database_query("SELECT groupcat_id, groupcat_title FROM se_groupcats WHERE groupcat_id='{$groupcat['groupcat_dependency']}' LIMIT 1"));
    }
  }
}

// CREATE GROUP OBJECT
$group = new se_group();

// GET TOTAL GROUPS
$total_groups = $group->group_total($where);

// MAKE ENTRY PAGES
$groups_per_page = 10;
$page_vars = make_page($total_groups, $groups_per_page, $p);

// GET GROUP ARRAY
$group_array = $group->group_list($page_vars[0], $groups_per_page, $s, $where, TRUE);

// GET CATS
$field = new se_field("group");
$field->cat_list(0, 0, 0, "", "", "groupfield_id=0");
$cat_array = $field->cats;

// SET GLOBAL PAGE TITLE
$global_page_title[0] = 2000324; 
$global_page_description[0] = 2000325;

// ASSIGN SMARTY VARIABLES AND DISPLAY GROUPS PAGE
$smarty->assign('groupcat_id', $groupcat_id);
$smarty->assign('groupcat', $groupcat);
$smarty->assign('groupsubcat', $groupsubcat);
$smarty->assign('cats', $cat_array);
$smarty->assign('groups', $group_array);
$smarty->assign('total_groups', $total_groups);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($group_array));
$smarty->assign('s', $s);
$smarty->assign('v', $v);
// ASSIGN SMARTY VARIABLES AND DISPLAY ALBUMS PAGE
$smarty->assign('albums', $album_array);
$smarty->assign('total_albums', $total_albums);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($album_array));
$smarty->assign('s', $s);
$smarty->assign('v', $v);
$smarty->assign('online_friends', online_friends() );
include "footer.php";
?>