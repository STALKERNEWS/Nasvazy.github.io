<?php

/* $Id: user_classified_listing.php 16 2009-01-13 04:01:31Z john $ */

$page = "user_classified_listing";
include "header.php";


$task           = ( !empty($_POST['task'])          ? $_POST['task']          : ( !empty($_GET['task'])           ? $_GET['task']           : NULL ) );
$classified_id  = ( !empty($_POST['classified_id']) ? $_POST['classified_id'] : ( !empty($_GET['classified_id'])  ? $_GET['classified_id']  : NULL ) );


// ENSURE CLASSIFIEDS ARE ENABLED FOR THIS USER
if( !$user->level_info['level_classified_allow'] )
{
  header("Location: user_home.php");
  exit();
}


// GET PRIVACY SETTINGS
$level_classified_privacy = unserialize($user->level_info['level_classified_privacy']);
rsort($level_classified_privacy);
$level_classified_comments = unserialize($user->level_info['level_classified_comments']);
rsort($level_classified_comments);


// INITIALIZE VARIABLES
$is_error = FALSE;

$classified = new se_classified($user->user_info['user_id'], $classified_id);

if( $classified->classified_exists && $user->user_info['user_id']!=$classified->classified_info['classified_user_id'] )
{
  header('user_home.php');
  exit();
}

if( !$classified->classified_exists ) $classified->classified_info = array
(
  'classified_title'                => '',
  'classified_body'                 => '',
  'classified_classifiedcat_id'     => 0,
  'classified_classifiedsubcat_id'  => 0,
  'classified_search'               => 1,
  'classified_privacy'              => $level_classified_privacy[0],
  'classified_comments'             => $level_classified_comments[0]
);


// BEGIN POST ENTRY TASK
if( $task=="dosave" )
{
  $classified->classified_info['classified_id']                   = $_POST['classified_id'];
  $classified->classified_info['classified_title']                = censor($_POST['classified_title']);
  $classified->classified_info['classified_body']                 = censor(str_replace("\r\n", "<br />", $_POST['classified_body']));
  $classified->classified_info['classified_search']               = $_POST['classified_search'];
  $classified->classified_info['classified_privacy']              = $_POST['classified_privacy'];
  $classified->classified_info['classified_comments']             = $_POST['classified_comments'];
  $classified->classified_info['classified_classifiedcat_id']     = $_POST['classified_classifiedcat_id'];
  $classified->classified_info['classified_classifiedsubcat_id']  = $_POST['classified_classifiedsubcat_id'];
  
  // GET FIELDS
  $field = new se_field("classified");
  $field->cat_list(1, 0, 0, "classifiedcat_id='{$classified->classified_info[classified_classifiedcat_id]}'", "", "");
  $selected_fields = $field->fields_all;
  $is_error = $field->is_error;
  
  if( !$classified->classified_info['classified_id'] )
    $classified->classified_info['classified_id'] = NULL;
  
  // CHECK TO MAKE SURE TITLE HAS BEEN ENTERED
  if( !trim($classified->classified_info['classified_title']) )
    $is_error = 4500100;

  // CHECK TO MAKE SURE CATEGORY HAS BEEN SELECTED
  if( !$classified->classified_info['classified_classifiedcat_id'] )
    $is_error = 4500101;
    
  // MAKE SURE SUBMITTED PRIVACY OPTIONS ARE ALLOWED, IF NOT, SET TO EVERYONE
  if( !in_array($classified->classified_info['classified_privacy'] , $level_classified_privacy ) )
    $classified->classified_info['classified_privacy']  = $level_classified_privacy[0] ;
  if( !in_array($classified->classified_info['classified_comments'], $level_classified_comments) )
    $classified->classified_info['classified_comments'] = $level_classified_comments[0];
  
  // CHECK THAT SEARCH IS NOT BLANK
  if( !$user->level_info['level_classified_search'] )
    $classified->classified_info['classified_search'] = 1;
  
  
  // IF NO ERROR, SAVE GROUP
  if( !$is_error )
  {
    // SET classified CATEGORY ID
    if( $classified->classified_info['classified_classifiedsubcat_id'] && $classified->classified_info['classified_classifiedsubcat_id'] )
      $classified->classified_info['classified_classifiedcat_id'] = $classified->classified_info['classified_classifiedsubcat_id'];
    
    $classified->classified_info['classified_id'] = $classified->classified_post(
      $classified->classified_info['classified_id'],
      $classified->classified_info['classified_title'],
      $classified->classified_info['classified_body'],
      $classified->classified_info['classified_classifiedcat_id'],
      $classified->classified_info['classified_search'],
      $classified->classified_info['classified_privacy'],
      $classified->classified_info['classified_comments'],
      $field->field_query
    );
    
    // UPDATE LAST UPDATE DATE (SAY THAT 10 TIMES FAST)
    $user->user_lastupdate();
    
    // INSERT ACTION
    if( $classified_id )
    {
      $classified_title_short = $classified->classified_info['classified_title'];
      if( strlen($classified_title_short) > 100 ) $classified_title_short = substr($classified_title_short, 0, 97); $classified_title_short .= "...";
      $actions->actions_add(
        $user,
        "postclassified",
        array(
          $user->user_info['user_username'],
          $user->user_displayname,
          $classified->classified_info['classified_id'],
          $classified_title_short
        )
      );
    }
    
    header($classified_id ? "Location: user_classified.php" : "Location: user_classified_media.php?classified_id={$classified->classified_info['classified_id']}&justadded=1" );
    exit();
  }
}





// GET PREVIOUS PRIVACY SETTINGS
for($c=0;$c<count($level_classified_privacy);$c++) {
  if(user_privacy_levels($level_classified_privacy[$c]) != "") {
    SE_Language::_preload(user_privacy_levels($level_classified_privacy[$c]));
    $privacy_options[$level_classified_privacy[$c]] = user_privacy_levels($level_classified_privacy[$c]);
  }
}

for($c=0;$c<count($level_classified_comments);$c++) {
  if(user_privacy_levels($level_classified_comments[$c]) != "") {
    SE_Language::_preload(user_privacy_levels($level_classified_comments[$c]));
    $comment_options[$level_classified_comments[$c]] = user_privacy_levels($level_classified_comments[$c]);
  }
}


// GET FIELDS
$field = new se_field("classified", $classified->classifiedvalue_info);
$field->cat_list(0, 0, 0, "", "", "");
$cat_array = $field->cats;
if( $is_error && $classified_info['classified_classifiedcat_id'] )
{
  $selected_cat_array = array_filter($cat_array, create_function('$a', 'if($a["cat_id"] == "'.$classified_info['classified_classifiedcat_id'].'") { return $a; }'));
  foreach( $selected_cat_array as $key=>$val )
  {
    $cat_array[$key]['fields'] = $selected_fields;
  }
}


// GET SUBCAT IF NECESSARY
$thiscat = $database->database_fetch_assoc($database->database_query("SELECT classifiedcat_id, classifiedcat_dependency FROM se_classifiedcats WHERE classifiedcat_id='{$classified->classified_info[classified_classifiedcat_id]}'"));
if( !$thiscat['classifiedcat_dependency'] )
{
  $classified->classified_info['classified_classifiedsubcat_id'] = 0;
}
else
{
  $classified->classified_info['classified_classifiedsubcat_id'] = $classified->classified_info['classified_classifiedcat_id'];
  $classified->classified_info['classified_classifiedcat_id'] = $thiscat['classifiedcat_dependency'];
}


// REMOVE BREAKS
$classified->classified_info['classified_body'] = str_replace("<br />", "\r\n", $classified->classified_info['classified_body']);




// ASSIGN VARIABLES AND SHOW ADD GROUPS PAGE
$smarty->assign('is_error', $is_error);

$smarty->assign_by_ref('classified', $classified);
$smarty->assign_by_ref('cats', $cat_array);

$smarty->assign('privacy_options', $privacy_options);
$smarty->assign('comment_options', $comment_options);
include "footer.php";
?>