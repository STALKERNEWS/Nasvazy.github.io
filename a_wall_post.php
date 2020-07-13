<?php
include "header.php";
	$act = rq('act');
	$id = rq('id');
	$ajax = 1;
			
	if(!empty($id))
		$owner = new se_user(Array($id));
	else
		$owner = $user;
		
		
$smarty->compile_check = true;
$smarty->debugging = false;
#----- самописанная функция для вытаскивания информации о пользователи id которого мы ей передадим.
function get_user_info($id){
	global $database;
		$to_user = $database -> database_query("
			SELECT * FROM `se_users` as users
			inner join `se_profiles` as profile
					on `profile`.`profile_user_id` = `users`.`user_id`
			WHERE `users`.`user_id` = '".(int)$id."'
		");
	
		$t_users = $database -> database_fetch_assoc($to_user);
		return $t_users;
}
#-------------------------------------------------------------------------------------------------

$act = $_REQUEST['act'];
$smarty->assign('act', $act);
$id = $_REQUEST['user_id'];
		$page = "a_wall_post"; 


  $comment = new se_comment('profile', 'user_id', $id);
     $total_comments = $comment->comment_total();

     $comments_per_page = 10;
     $page_vars = make_page($total_comments, $comments_per_page, $str);

     $comments = $comment->comment_list($page_vars[0], $comments_per_page);
     $comment_body = ereg_replace("http://[^<>[:space:]]+[[:alnum:]/]", "<a target=_blank href=\"away.php?to=\\0\">\\0</a>", $comment_body);

	 $is_like = $comment->likeds(se_profilecomments.profilecomment_id);
	 
     $smarty->assign('p', $page_vars[1]);
     $smarty->assign('total_comments', $total_comments);
     $smarty->assign('maxpage', $page_vars[2]);
     $smarty->assign('p_start', $page_vars[0]+1);
     $smarty->assign('p_end', $page_vars[0]+count($comments));
     $smarty->assign('comments', $comments);


	$smarty->assign('ajax', $ajax);
	include "footer.php";
?>