<?
header("Content-type: text/html; charset=Windows-1251");

error_reporting(E_ERROR | E_WARNING | E_PARSE);

error_reporting (E_ALL ^ E_NOTICE);

#----- самописанная функция для вытаскивания информации о пользователи id которого мы ей передадим.
function get_user_info($id){
	global $database;
		$to_user = $database -> database_query("
			SELECT * FROM `se_users` as users
			inner join `se_profilecomments` as profilecomments
					on `profilecomments`.`profilecomment_id` = `profilecomments`.`profilecomment_id`
			WHERE `profilecomments`.`profilecomment_id` = '".(int)$id."'
		");
	
		$t_users = $database -> database_fetch_assoc($to_user);
		return $t_users;
}
#-------------------------------------------------------------------------------------------------

#----- самописанная функция для вытаскивания информации о пользователи id которого мы ей передадим.
function get_comm_info($id){
	global $database;
		$to_user = $database -> database_query("
			SELECT * FROM `se_users` as users
			inner join `se_profilecomments` as profilecomments
					on `profilecomments`.`profilecomment_id` = `profilecomments`.`profilecomment_id`
			WHERE `users`.`user_id` = '".(int)$id."'
		");
	
		$t_users = $database -> database_fetch_assoc($to_user);
		return $t_users;
}
#-------------------------------------------------------------------------------------------------

	$page = "profile_comments";
	include "header.php";
	$act = $_REQUEST['act'];
	$smarty->assign('act', $act);

	$id = $_REQUEST['id'];
	if(!empty($id))
		$owner = new se_user(Array($id));
	else
		$owner = $user;

	if($act == '' OR $act == 'main'){

///////////////////////////////////////////////////////
if($_GET['person'] == "" or $_GET['person'] == "0"){

$page_title = "Стена";
$smarty->assign('page_title', $page_title);

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_profile] == 0) {
  $page = "error";
  $smarty->assign('error_header', $profile_comments[20]);
  $smarty->assign('error_message', $profile_comments[22]);
  $smarty->assign('error_submit', $profile_comments[23]);
  include "footer.php";
}

// DISPLAY ERROR PAGE IF NO OWNER
if($owner->user_exists == 0) {
  $page = "error";
  $smarty->assign('error_header', $profile_comments[20]);
  $smarty->assign('error_message', $profile_comments[21]);
  $smarty->assign('error_submit', $profile_comments[23]);
  include "footer.php";
}

// GET PRIVACY LEVEL
$privacy_level = $owner->user_privacy_max($user, $owner->level_info[level_profile_privacy]);
$allowed_privacy = true_privacy($owner->user_info[user_privacy_profile], $owner->level_info[level_profile_privacy]);
if($privacy_level < $allowed_privacy) { header("Location: ".$url->url_create('profileid', $owner->user_info[user_id])); exit(); }


// SET VARS
$is_error = 0;
$refresh = 0;
$allowed_to_comment = 1;


// CHECK IF USER IS ALLOWED TO COMMENT
$comment_level = $owner->user_privacy_max($user, $owner->level_info[level_profile_comments]);
$allowed_comment = true_privacy($owner->user_info[user_privacy_comments], $owner->level_info[level_profile_comments]);
if($comment_level < $allowed_comment) { $allowed_to_comment = 0; }



// IF A COMMENT IS BEING POSTED
if($task == "dopost" & $allowed_to_comment != 0) {
  $comment_date = time();
  $comment_body = $_POST['comment_body'];

  // RETRIEVE AND CHECK SECURITY CODE IF NECESSARY
  if($setting[setting_comment_code] != 0) {
    session_start();
    $code = $_SESSION['code'];
    if($code == "") { $code = randomcode(); }
    $comment_secure = $_POST['comment_secure'];

    if($comment_secure != $code) { $is_error = 1; }
  }

  // MAKE SURE COMMENT BODY IS NOT EMPTY - ADD BREAKS AND CENSOR
  $comment_body = censor(str_replace("\n", "<br>", $comment_body)); 
  $comment_body = preg_replace('/(<br>){3,}/is', '<br><br>', $comment_body);
  $comment_body = ChopText($comment_body);
  $asconf['smiles'] = "angel, bad, biggrin, blum, blush, cray, crazy, dance, diablo, dirol, drinks, fool, good, kiss, man_in_love, music, no, pardon, rofl, rolleyes, sad, scratch_one-s_head, shok, shout, smile, unknw, wacko, wink, yahoo"; 
  $find = array(); 
  $replace = array(); 

  // SMILES REPLACING // 
  $smilies_arr = explode(",", $asconf['smiles']); 
            foreach($smilies_arr as $smile) 
            { 
                        $smile = trim($smile); 
                        $find = ':'.$smile.':'; 
                        $replace = '<img alt="'.$smile.'" src="./templates/images/smiles/'.$smile.'.gif" border=0>'; 
  $comment_body = ereg_replace("http://[^<>[:space:]]+[[:alnum:]/]", "<a target=_blank href=\"away.php?to=\\0\">\\0</a>", $comment_body);
            } 
  if(str_replace(" ", "", $comment_body) == "") { $is_error = 1; $comment_body = ""; }

  // ADD COMMENT IF NO ERROR
  if($is_error == 0) {
    $database->database_query("INSERT INTO se_profilecomments (profilecomment_user_id, profilecomment_authoruser_id, profilecomment_date, profilecomment_body) VALUES ('".$owner->user_info[user_id]."', '".$user->user_info[user_id]."', '$comment_date', '$comment_body')");

    // INSERT ACTION IF USER EXISTS
    if($user->user_exists != 0) {
      $commenter = $user->user_info[user_username];
      $comment_body_encoded = $comment_body;
      if(strlen($comment_body_encoded) > 250) { 
        $comment_body_encoded = substr($comment_body_encoded, 0, 240);
        $comment_body_encoded .= "...";
      }
      $comment_body_encoded = htmlspecialchars(str_replace("<br>", " ", $comment_body_encoded));
      $actions->actions_add($user, "postcomment", Array('[name1]', '[username1]', '[lastname1]', '[id1]', '[name2]', '[username2]', '[lastname2]', '[id2]',  '[comment]'), Array($user->user_info[user_name], $user->user_info[user_username], $user->user_info[user_lastname], $user->user_info[user_id], $owner->user_info[user_name], $owner->user_info[user_username], $owner->user_info[user_lastname], $owner->user_info[user_id], $comment_body_encoded));
    } else { 
      $commenter = $profile_comments[12]; 
    }

    // SEND PROFILE COMMENT NOTIFICATION IF COMMENTER IS NOT OWNER
    if($owner->user_info[user_id] != $user->user_info[user_id]) { send_profilecomment($owner, $commenter); }
  }

  echo "<html><head><script type=\"text/javascript\">";
  echo "window.parent.addComment('$is_error', '$comment_body', '$comment_date');";
  echo "</script></head><body></body></html>";
  exit();
}



// START COMMENT OBJECT
$comment = new se_comment('profile', 'user_id', $owner->user_info[user_id]);

// GET TOTAL COMMENTS
$total_comments = $comment->comment_total();

// MAKE COMMENT PAGES
$comments_per_page = 20;
$page_vars = make_page($total_comments, $comments_per_page, $p);

//GET PROFILE COMMENTS
$comments = $comment->comment_list($page_vars[0], $comments_per_page);


// GET CUSTOM PROFILE STYLE IF ALLOWED
if($user->level_info[level_profile_style] != 0) { 
  $profilestyle_info = $database->database_fetch_assoc($database->database_query("SELECT profilestyle_css FROM se_profilestyles WHERE profilestyle_user_id='".$owner->user_info[user_id]."' LIMIT 1")); 
  $global_css = $profilestyle_info[profilestyle_css];
}


// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('comments', $comments);
$smarty->assign('allowed_to_comment', $allowed_to_comment);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('total_comments', $total_comments);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($comments));

$act = $_GET['act'];
$smarty->assign('act', $act);



}


///////////////////////////////////////////////////////
elseif($_GET['person'] != "" or $_GET['person'] != "0"){

$page = "wall_person";


$page_title = "Стена";
$smarty->assign('page_title', $page_title);

if(isset($_POST['person'])) { $id2 = $_POST['person']; } elseif(isset($_GET['person'])) { $id2= $_GET['person']; } else { $person = ""; }



	function comment_list($start, $limit, $id, $id2) {
	  global $database;

	  $comment_array = Array();
	  $comment_query = "select profilecomment_id, profilecomment_user_id, profilecomment_authoruser_id, profilecomment_date, profilecomment_body from se_profilecomments WHERE 
(profilecomment_user_id='$id' 
AND profilecomment_authoruser_id='$id2') 
OR (profilecomment_user_id='$id2' AND profilecomment_authoruser_id='$id')

ORDER BY profilecomment_id DESC LIMIT $start, $limit";
	  $comments = $database->database_query($comment_query);
	  while($comment_info = $database->database_fetch_assoc($comments)) {

	    // SET comment ARRAY
	    $comment_array[] = Array(
			'profilecomment_id' 		=> $comment_info['profilecomment_id'],
			'profilecomment_user_id' 	=> $comment_info['profilecomment_user_id'],
			'profilecomment_authoruser_id' 	=> $comment_info['profilecomment_authoruser_id'],
			'profilecomment_date' 		=> $comment_info['profilecomment_date'],
			'profilecomment_body' 		=> $comment_info['profilecomment_body']);
	  }

	  return $comment_array;

	} // END comment_list() METHOD


$total_comments = $database->database_num_rows($database->database_query("SELECT profilecomment_id FROM se_profilecomments WHERE (profilecomment_user_id='".$owner->user_info[user_id]."' 
AND profilecomment_authoruser_id='".$id2."') OR (profilecomment_user_id='".$id2."' AND profilecomment_authoruser_id='".$owner->user_info[user_id]."')"));



$smarty->assign('total_comments', $total_comments);  


$comments = comment_list(0, 1000, $owner->user_info['user_id'], $id2); 



$smarty->assign('id2', $id2);  




$query = "SELECT * FROM `se_users` WHERE user_id = ".$id2."";
$res = mysql_query($query);
while($row = mysql_fetch_array($res))
{
$smarty->assign('owner2_user_id', $row['user_id']);
$smarty->assign('owner2_user_firstname', $row['user_firstname']);
$smarty->assign('owner2_user_username', $row['user_username']);
$smarty->assign('owner2_user_lastname', $row['user_lastname']);
$smarty->assign('owner2_user_photo', $row['user_photo']);
}




// MAKE COMMENT PAGES
$comments_per_page = 20;
$page_vars = make_page($total_comments, $comments_per_page, $p);

//GET PROFILE COMMENTS

$comments = comment_list($page_vars[0], $comments_per_page, $owner->user_info['user_id'], $id2); 






// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('comments', $comments);
$smarty->assign('allowed_to_comment', $allowed_to_comment);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('total_comments', $total_comments);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($comments));

$act = $_GET['act'];
$smarty->assign('act', $act);



///////////////////////////////////////////////////////



}




}
///////////////////////////////////////////////////////



///////////////////////////////////////////////////////
elseif($act == "write"){

$page = "wall_add";

$page_title = "Стена";
$smarty->assign('page_title', $page_title);


include "footer.php";


}
///////////////////////////////////////////////////////



///////////////////////////////////////////////////////
elseif($act == "add_1"){



$page_title = "Стена";
$smarty->assign('page_title', $page_title);

$body = $_GET['body'];


  $body = censor(str_replace("\n", "<br>", $body)); 
  $body = preg_replace('/(<br>){3,}/is', '<br><br>', $body);
  $body = ChopText($body);
  $body = ereg_replace("http://[^<>[:space:]]+[[:alnum:]/]", "<a target=_blank href=\"away.php?to=\\0\">\\0</a>", $body);


$actions->actions_add($user, "postcomment", Array('[name1]', '[username1]', '[lastname1]', '[id1]', '[name2]', '[username2]', '[lastname2]', '[id2]',  '[comment]'), Array($user->user_info[user_firstname], $user->user_info[user_username], $user->user_info[user_lastname], $user->user_info[user_id], $owner->user_info[user_firstname], $owner->user_info[user_username], $owner->user_info[user_lastname], $owner->user_info[user_id], $body));


$plus_text_query = mysql_query("
INSERT INTO se_profilecomments (profilecomment_id, profilecomment_user_id, profilecomment_authoruser_id, profilecomment_body, profilecomment_date) 
VALUE ('', '".$owner->user_info[user_id]."', '".$user->user_info[user_id]."', '$body', '".time()."')");

header("Location: ./id".$owner->user_info[user_id]."#profilecomments"); exit();
}
///////////////////////////////////////////////////////




///////////////////////////////////////////////////////
elseif($act == "111"){

$page = "wall_111";


$page_title = "Тет-а-тет";
$smarty->assign('page_title', $page_title);


$person = $_GET['person'];
$smarty->assign('person', $person);

	function profilecomment_list($start, $limit, $id) {
	  global $database;


	  $profilecomment_array = Array();
	  $profilecomment_query = "select  `profilecomment_id`, `profilecomment_user_id`, `profilecomment_authoruser_id`, `profilecomment_date`, `profilecomment_body`, `user_id`, `user_firstname`, `user_username`, `user_lastname`, `user_photo` from se_profilecomments JOIN se_users WHERE profilecomment_user_id = $id AND profilecomment_user_id = se_users.user_id ORDER BY profilecomment_id DESC LIMIT $start, $limit";
	  $profilecomments = $database->database_query($profilecomment_query);
	  while($profilecomment_info = $database->database_fetch_assoc($profilecomments)) {$myuser = new se_user(); 
				$myuser->user_info[user_id] 		= $profilecomment_info[user_id]; 
				$myuser->user_info[user_firstname] 		= $profilecomment_info[user_firstname]; 
				$myuser->user_info[user_username] 	= $profilecomment_info[user_username]; 
				$myuser->user_info[user_lastname] 	= $profilecomment_info[user_lastname]; 
				$myuser->user_info[user_photo] 		= $profilecomment_info[user_photo]; 
	    	$profilecomment_array[] = Array('profilecomment_id' 	=> $profilecomment_info['profilecomment_id'],
					'profilecomment_user_id' 	=> $profilecomment_info['profilecomment_user_id'],
					'profilecomment_authoruser_id' 	=> $profilecomment_info['profilecomment_authoruser_id'],
					'profilecomment_date' 		=> $profilecomment_info['profilecomment_date'],
					'profilecomment_body' 		=> $profilecomment_info['profilecomment_body'],
					'myuser' 			=> $myuser); }

	  return $profilecomment_array;

	}

$profilecomments = profilecomment_list(0, 100, $person); 


$smarty->assign('profilecomments', $profilecomments);  

}
///////////////////////////////////////////////////////





///////////////////////////
     elseif($act == "get10"){

     $page = "wall_get10";

     $mid = $_REQUEST['mid'];
     $oid = $_REQUEST['oid'];




     $wpage = $_REQUEST['wpage'];
     $seed = $_REQUEST['seed'];


     if($seed != "" & $wpage == "100000") {

       $comment_date = time();
       $comment_body = $seed;

       $comment = new se_comment();
    $comment_body = $comment->re_text($comment_body);
       if(str_replace(" ", "", $comment_body) == "") { $is_error = 1; $comment_body = ""; }

     if($is_error == 0){
       $comment_body = iconv('UTF-8', 'Windows-1251', $comment_body);
       $database->database_query("INSERT INTO se_profilecomments (profilecomment_user_id, profilecomment_authoruser_id, profilecomment_date, profilecomment_body) VALUES ('".$mid."', '".$user->user_info[user_id]."', '$comment_date', '$comment_body')");
     }

     }


     if($oid != ""){$owner = new se_user(Array($oid));}
     if($mid != ""){$owner = new se_user(Array($mid));}



     $str = $_REQUEST['page'];
     if($str == ""){$str = "1";}

     // GET PROFILE COMMENTS
     $comment = new se_comment('profile', 'user_id', $owner->user_info[user_id]);
     $total_comments = $comment->comment_total();

     $comments_per_page = 10;
     $page_vars = make_page($total_comments, $comments_per_page, $str);

     $comments = $comment->comment_list($page_vars[0], $comments_per_page);
     $comment_body = ereg_replace("<b>", "</b>", "http://[^<>[:space:]]+[[:alnum:]/]", "<a target=_blank href=\"away.php?to=\\0\">\\0</a>", $comment_body);

     $smarty->assign('page', $page_vars[1]);
     $smarty->assign('total_comments', $total_comments);
     $smarty->assign('maxpage', $page_vars[2]);
     $smarty->assign('p_start', $page_vars[0]+1);
     $smarty->assign('p_end', $page_vars[0]+count($comments));
     $smarty->assign('comments', $comments);



     }
     ///////////////////////////





     ///////////////////////////

	//********************************
	//	Удаление комментария в группе
	//********************************


	elseif($act == "g_delete"){

	$page = "null";

    $cid = $_REQUEST['cid'];
    $oid = $_REQUEST['oid'];

    if($oid > 0){
    $group = "1"; 
    $oid = str_replace("-", "", $oid);
    }

    $comment = $database->database_query("SELECT * FROM se_groupcomments WHERE groupcomment_id='".$cid."'");
    $comment_info = $database->database_fetch_assoc($comment);

    if($comment_info[groupcomment_authoruser_id] == $user->user_info[user_id] || $user->user_info[user_id] == 2){
    $database->database_query("DELETE FROM se_groupcomments WHERE groupcomment_id='$cid'");
    echo "<div class='dld' id='wResult".$cid."' style='padding: 9px 4px 10px 10px;font-weight:normal;margin:0px 0px 15px'>Сообщение успешно удалено.</div>";
    }else{
    echo "<div class='dld' id='wResult".$cid."' style='padding: 9px 4px 10px 10px;font-weight:normal;margin:0px 0px 15px'>Ошибка безопасности.</div>";
    }
    exit;
	}


	//********************************
	//	Удаление комментария на стене
	//********************************


	elseif($act == "a_delete"){

	$page = "null";

    $cid = $_REQUEST['cid'];
    $oid = $_REQUEST['oid'];

    if($oid > 0){
    $group = "0"; 
    $oid = str_replace("-", "", $oid);
    }

    $comment = $database->database_query("SELECT * FROM se_profilecomments WHERE profilecomment_id='".$cid."'");
    $comment_info = $database->database_fetch_assoc($comment);

    if($comment_info[profilecomment_user_id] == $user->user_info[user_id] OR $comment_info[profilecomment_authoruser_id] == $user->user_info[user_id]){
    $database->database_query("DELETE FROM se_profilecomments WHERE profilecomment_id='$cid'");
    echo "<div class='dld' id='wResult".$cid."' style='padding: 9px 4px 10px 10px;font-weight:normal;margin:0px 0px 15px'>Сообщение успешно удалено.</div>";
    }else{
    echo "<div class='dld' id='wResult".$cid."' style='padding: 9px 4px 10px 10px;font-weight:normal;margin:0px 0px 15px'>Ошибка безопасности.</div>";
    }
    exit;
	}


	//********************************
	//	Удаление комментария в альбоме
	//********************************


	elseif($act == "p_delete"){

	$page = "null";

	$cid = $_REQUEST['cid'];
    $oid = $_REQUEST['oid'];

    if($oid > 0){
    $group = "0"; 
    $oid = str_replace("-", "", $oid);
    }	

	$comment = $database->database_query("SELECT * FROM se_mediacomments WHERE mediacomment_id='".$cid."'");
	$comment_info = $database->database_fetch_assoc($comment);

	$photo = $database->database_query("SELECT * FROM se_media WHERE media_id='".$comment_info[mediacomment_media_id]."'");
	$photo_info = $database->database_fetch_assoc($photo);

	if($comment_info[mediacomment_authoruser_id] == $user->user_info[user_id] OR $photo_info[media_user_id] == $user->user_info[user_id]){
	$database->database_query("DELETE FROM se_mediacomments WHERE mediacomment_id='$cid'");
    echo "<div class='dld' id='wResult".$cid."' style='padding: 9px 4px 10px 10px;font-weight:normal;margin:0px 0px 15px'>Сообщение успешно удалено.</div>";
    }else{
    echo "<div class='dld' id='wResult".$cid."' style='padding: 9px 4px 10px 10px;font-weight:normal;margin:0px 0px 15px'>Ошибка безопасности.</div>";
    }
	exit;
	}

     ///////////////////////////

     ///////////////////////////
     elseif($act == 'a_report_spam'){
     
     $cid = $_REQUEST['cid'];
     $oid = $_REQUEST['oid'];

     echo "<div class=\"dld\" id=\"wResult".$cid."\" style=\"margin: 0px 0px 15px; padding: 9px 4px 10px 10px; font-weight: normal;\">Сообщение помечено как спам.</div>";
     exit;
     }
     ///////////////////////////

     ///////////////////////////
     elseif($act == 'sent'){
     $to_id = $_REQUEST['to_id'];if($to_id == ""){$to_id = "0";}




     exit;
     }
     ///////////////////////////

/////////////////////////////////////////////////////////
     elseif($act == 'a_like'){
     
$uid = get_user_info((int)$_REQUEST['uid']);
$cid = get_user_info((int)$_REQUEST['cid']);

		if ($cid['user_photo'] == ""){
			$cid['user_photo'] = "./images/nophoto.gif";
			} else {
			$cid['user_photo'] = './uploads_user/'.$cid['user_id'].'/'.$cid["user_photo"].''; // нужна уменьшеная копия.
			}

$comment_text = "<TABLE BORDER=0 cellpadding=1><TR><TD ROWSPAN=2 width=24 height=24><a href=id".$cid["user_id"]."><img src=".$cid["user_photo"]."  width=24 height=24 border=1></a></TD><TD width=260 height=12>&nbsp;<b><img src=/images/icons/about.png> <a href=id".$cid["user_id"].">".$cid["user_username"]."</a></b></TD></TR><TR><TD height=12><font color=#999999>&nbsp;".$cid["profilecomment_date"]."</font></TD></TR></TABLE><TABLE BORDER=0><TR><TD width=300>&nbsp;".$cid["profilecomment_body"]."</TD></TR></TABLE>";

$plus_text_query = mysql_query("
INSERT INTO se_profilecomments (profilecomment_id, profilecomment_user_id, profilecomment_authoruser_id, profilecomment_body, profilecomment_date) 
VALUE ('', '".$user->user_info[user_id]."', '".$cid[user_id]."', '$comment_text', '".time()."')");

echo "<span class=\"label fl_l\" id=\"likepost".$cid."\" style=\"\">Отправленно</span>";

     exit;
     }
////////////////////////////////////////////////////////////////

	include "footer.php";





?>