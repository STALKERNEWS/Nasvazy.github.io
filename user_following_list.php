<?php

/**
 * @author Idris
 * @copyright Hire-Experts LLC
 * @version Wall 3.1
 */

$page = "user_following_list";
include "header.php";

$list_id = he_wall_getpost('list_id', 0);
$list_name = he_wall_getpost('list_name', 0);
$task = he_wall_getpost('task', '');

$followers_per_page = 10;
$follower_info = he_wall::get_followers_in_list($user->user_info['user_id'], $list_id, 0, 0, $followers_per_page);
$user_lists = he_wall::get_user_lists($user->user_info['user_id']);

$smarty->assign('followers', $follower_info['followers']);
$smarty->assign('list_name', $follower_info['list_name']);
$smarty->assign('total_followers', $follower_info['total_followers']);
$smarty->assign('followers_per_page', $followers_per_page);
$smarty->assign('list_id', $list_id);
$smarty->assign('lists', $user_lists);
$smarty->assign('task', $task);
$smarty->assign('is_error', $is_error);

include "footer.php";

?>