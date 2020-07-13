<?
if($_GET['act'] == "delete"){
$page = "user_support";
include "header.php";
$jax = $_GET['jax'];

$ticket_id = $_GET['ticket_id'];

$smarty->assign('jax', $jax);


$database->database_query("DELETE FROM se_supports WHERE support_id='$ticket_id'");
	  $database->database_query("DELETE FROM se_supportcomments WHERE supportcomment_support_id='$ticket_id'");

header("Location: /support");


$pagetitle =  "Помощь";
$smarty->assign('pagetitle', $pagetitle);
$okay = $_GET['act'];
$smarty->assign('okay', $okay);
$smarty->assign('search', $search);
$smarty->assign('supports', $supports);
$smarty->assign('total_supports', $total_supports);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($supports));
include "footer.php";
}elseif($_GET['act'] == "browse"){
$page = "user_support";
include "header.php";
$jax = $_GET['jax'];
$smarty->assign('jax', $jax);

$okay = $_GET['act'];
$pagetitle =  "Помощь";
$smarty->assign('pagetitle', $pagetitle);
$smarty->assign('okay', $okay);
// INCLUDE supportS CLASS FILE
include "./include/class_support.php";

// INCLUDE supportS FUNCTION FILE
include "./include/functions_support.php";
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_POST['search'])) { $search = $_POST['search']; } elseif(isset($_GET['search'])) { $search = $_GET['search']; } else { $search = ""; }



// SET SORT CLAUSE
$sort = "support_id DESC";

// SET WHERE CLAUSE
if($search != "") { $where = "(support_title LIKE '%$search%' OR support_body LIKE '%$search%')"; } else { $where = ""; }

// CREATE support OBJECT
$entries_per_page = 1000;
$support = new se_support();

// DELETE NECESSARY ENTRIES
$start = ($p - 1) * $entries_per_page;
if($task == "delete") { $support->supports_delete($start, $entries_per_page, $sort, $where); }

// GET TOTAL ENTRIES
$total_supports = $support->supports_total($where);

// MAKE ENTRY PAGES
$page_vars = make_page($total_supports, $entries_per_page, $p);
$uuid = $user->user_info[user_id];
// GET ENTRY ARRAY
$supports = $support->supports_list($page_vars[0], $entries_per_page, $sort, $where);
$database->database_query("UPDATE se_users SET supadm='0' WHERE user_id = $uuid");
// ASSIGN VARIABLES AND SHOW VIEW ENTRIES PAGE
$smarty->assign('search', $search);
$smarty->assign('supports', $supports);
$smarty->assign('total_supports', $total_supports);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($supports));
include "footer.php";
}
elseif($_GET['act'] == "post"){
$page = "user_support";
include "header.php";
$jax = $_GET['jax'];
$smarty->assign('jax', $jax);

$pagetitle =  "Помощь";
$smarty->assign('pagetitle', $pagetitle);
$okay = $_GET['act'];
$smarty->assign('okay', $okay);
// INCLUDE LANGUAGE FILE
include "./lang/lang_profile_russian.php";

$text = $_GET['text'];
$user_id = $_GET['user_id'];
$support = $_GET['support'];
$attachments = $_GET['attachments'];
$mid= $_GET['mid'];
$mimg = $_GET['mimg'];
$mvid = $_GET['mvid'];
$comment_date	= time();

$database->database_query("INSERT INTO se_supportcomments (supportcomment_support_id, supportcomment_authoruser_id, supportcomment_date, supportcomment_body) VALUES ('$support', '".$user->user_info[user_id]."', '$comment_date', '$text')");


 $info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_supports WHERE support_id=$support"));
$support_title = $info[support_title];
$support_body = $info[support_body];
$support_body = $info[support_body];
	  $support_body = ereg_replace(":smile:", "<img  src=/images/sm/smile.gif>", $support_body);
	  $support_body = ereg_replace(":angel:", "<img  src=/images/sm/angel.gif>", $support_body);
	  $support_body = ereg_replace(":bad:", "<img  src=/images/sm/bad.gif>", $support_body);
	  $support_body = ereg_replace(":biggrin:", "<img  src=/images/sm/biggrin.gif>", $support_body);
	  $support_body = ereg_replace(":blum:", "<img  src=/images/sm/blum.gif>", $support_body);
	  $support_body = ereg_replace(":blush:", "<img  src=/images/sm/blush.gif>", $support_body);
	  $support_body = ereg_replace(":cray:", "<img  src=/images/sm/cray.gif>", $support_body);
	  $support_body = ereg_replace(":crazy:", "<img  src=/images/sm/crazy.gif>", $support_body);
	  $support_body = ereg_replace(":dance:", "<img  src=/images/sm/dance.gif>", $support_body);
	  $support_body = ereg_replace(":diablo:", "<img  src=/images/sm/diablo.gif>", $support_body);
	  $support_body = ereg_replace(":dirol:", "<img  src=/images/sm/dirol.gif>", $support_body);
	  $support_body = ereg_replace(":good:", "<img  src=/images/sm/good.gif>", $support_body);
	  $support_body = ereg_replace(":in_love:", "<img  src=/images/sm/in_love.gif>", $support_body);
	  $support_body = ereg_replace(":kiss_mini:", "<img  src=/images/sm/kiss_mini.gif>", $support_body);
	  $support_body = ereg_replace(":music:", "<img  src=/images/sm/music.gif>", $support_body);
	  $support_body = ereg_replace(":nea:", "<img  src=/images/sm/nea.gif>", $support_body);
	  $support_body = ereg_replace(":pardon:", "<img  src=/images/sm/pardon.gif>", $support_body);
	  $support_body = ereg_replace(":rolleyes:", "<img  src=/images/sm/rolleyes.gif>", $support_body);
	  $support_body = ereg_replace(":scratch:", "<img  src=/images/sm/scratch.gif>", $support_body);
	  $support_body = ereg_replace(":shok:", "<img  src=/images/sm/shok.gif>", $support_body);
	  $support_body = ereg_replace(":shout:", "<img  src=/images/sm/shout.gif>", $support_body);
	  $support_body = ereg_replace(":unknw:", "<img  src=/images/sm/unknw.gif>", $support_body);
	  $support_body = ereg_replace(":wacko2:", "<img  src=/images/sm/wacko2.gif>", $support_body);
	  $support_body = ereg_replace(":wink:", "<img  src=/images/sm/wink.gif>", $support_body);
	  $support_body = ereg_replace(":yahoo:", "<img  src=/images/sm/yahoo.gif>", $support_body);
	  $support_body = ereg_replace(":laugh:", "<img  src=/images/sm/laugh.gif>", $support_body);
	  $support_body = ereg_replace(":wall:", "<img  src=/images/sm/wall.gif>", $support_body);

$support_date = $info[support_date];
$support_user_id = $info[support_user_id];


if($user->user_info[user_id] == '1' ) {
$database->database_query("UPDATE se_supports SET support_status='1' WHERE support_id = $support");
$database->database_query("UPDATE se_users SET total_support  = total_support + 1 WHERE user_id = $support_user_id");
}else{
$database->database_query("UPDATE se_supports SET support_status='0' WHERE support_id = $support");
$database->database_query("UPDATE se_users SET supadm  = supadm + 1 WHERE user_id = 1");
$database->database_query("UPDATE se_users SET supadm  = supadm + 1 WHERE user_id = 2");

}


$comment = new se_comment('support', 'support_id', $support);
$comments = $comment->comment_list(0, 300, '');

$smarty->assign('comments', $comments);

$smarty->assign('support_user_id', $support_user_id);
$smarty->assign('support_date', $support_date);
$smarty->assign('support_body', $support_body);
$smarty->assign('support', $support);
$smarty->assign('support_title', $support_title);


include "footer.php";
}
elseif($_GET['act'] == "save"){
$page = "user_support";
include "header.php";
$okay = $_GET['act'];
$jax = $_GET['jax'];
$smarty->assign('jax', $jax);

$pagetitle =  "Помощь";
$smarty->assign('pagetitle', $pagetitle);

$title = $_GET['title'];
$text = $_GET['text'];
$comment_date	= time();
$database->database_query("INSERT INTO se_supports (support_user_id, support_date, support_title, support_body) VALUES ('".$user->user_info[user_id]."', '$comment_date', '$title', '$text')");

header("Location: support");
$smarty->assign('okay', $okay);
include "footer.php";
}
elseif($_GET['act'] == "new"){
$page = "user_support";
include "header.php";
$okay = $_GET['act'];
$pagetitle =  "Помощь";
$jax = $_GET['jax'];
$smarty->assign('jax', $jax);

$smarty->assign('pagetitle', $pagetitle);
$smarty->assign('okay', $okay);
include "footer.php";
}
elseif($_GET['act'] == "show"){
$page = "user_support";
include "header.php";
$pagetitle =  "Помощь";
$jax = $_GET['jax'];
$smarty->assign('jax', $jax);

$smarty->assign('pagetitle', $pagetitle);
$support = $_GET['id'];
 $info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_supports WHERE support_id=$support"));
$support_title = $info[support_title];

if($support_title == '')
{
header("Location: /support");
}
$support_body = $info[support_body];



$support_body = $info[support_body];
	  $support_body = ereg_replace(":smile:", "<img  src=/images/sm/smile.gif>", $support_body);
	  $support_body = ereg_replace(":angel:", "<img  src=/images/sm/angel.gif>", $support_body);
	  $support_body = ereg_replace(":bad:", "<img  src=/images/sm/bad.gif>", $support_body);
	  $support_body = ereg_replace(":biggrin:", "<img  src=/images/sm/biggrin.gif>", $support_body);
	  $support_body = ereg_replace(":blum:", "<img  src=/images/sm/blum.gif>", $support_body);
	  $support_body = ereg_replace(":blush:", "<img  src=/images/sm/blush.gif>", $support_body);
	  $support_body = ereg_replace(":cray:", "<img  src=/images/sm/cray.gif>", $support_body);
	  $support_body = ereg_replace(":crazy:", "<img  src=/images/sm/crazy.gif>", $support_body);
	  $support_body = ereg_replace(":dance:", "<img  src=/images/sm/dance.gif>", $support_body);
	  $support_body = ereg_replace(":diablo:", "<img  src=/images/sm/diablo.gif>", $support_body);
	  $support_body = ereg_replace(":dirol:", "<img  src=/images/sm/dirol.gif>", $support_body);
	  $support_body = ereg_replace(":good:", "<img  src=/images/sm/good.gif>", $support_body);
	  $support_body = ereg_replace(":in_love:", "<img  src=/images/sm/in_love.gif>", $support_body);
	  $support_body = ereg_replace(":kiss_mini:", "<img  src=/images/sm/kiss_mini.gif>", $support_body);
	  $support_body = ereg_replace(":music:", "<img  src=/images/sm/music.gif>", $support_body);
	  $support_body = ereg_replace(":nea:", "<img  src=/images/sm/nea.gif>", $support_body);
	  $support_body = ereg_replace(":pardon:", "<img  src=/images/sm/pardon.gif>", $support_body);
	  $support_body = ereg_replace(":rolleyes:", "<img  src=/images/sm/rolleyes.gif>", $support_body);
	  $support_body = ereg_replace(":scratch:", "<img  src=/images/sm/scratch.gif>", $support_body);
	  $support_body = ereg_replace(":shok:", "<img  src=/images/sm/shok.gif>", $support_body);
	  $support_body = ereg_replace(":shout:", "<img  src=/images/sm/shout.gif>", $support_body);
	  $support_body = ereg_replace(":unknw:", "<img  src=/images/sm/unknw.gif>", $support_body);
	  $support_body = ereg_replace(":wacko2:", "<img  src=/images/sm/wacko2.gif>", $support_body);
	  $support_body = ereg_replace(":wink:", "<img  src=/images/sm/wink.gif>", $support_body);
	  $support_body = ereg_replace(":yahoo:", "<img  src=/images/sm/yahoo.gif>", $support_body);
	  $support_body = ereg_replace(":laugh:", "<img  src=/images/sm/laugh.gif>", $support_body);
	  $support_body = ereg_replace(":wall:", "<img  src=/images/sm/wall.gif>", $support_body);

$support_date = $info[support_date];
$support_user_id = $info[support_user_id];

$support_status = $info[support_status];
$smarty->assign('support_status', $support_status);
$comment = new se_comment('support', 'support_id', $support);
$comments = $comment->comment_list(0, 300, '');

$smarty->assign('comments', $comments);
$okay = $_GET['act'];
$smarty->assign('okay', $okay);
$smarty->assign('support_user_id', $support_user_id);
$smarty->assign('support_date', $support_date);
$smarty->assign('support_body', $support_body);
$smarty->assign('support', $support);
$smarty->assign('support_title', $support_title);


include "footer.php";
}else{
$page = "user_support";
include "header.php";
$okay = $_GET['act'];
$jax = $_GET['jax'];
$smarty->assign('jax', $jax);

$pagetitle =  "Помощь";
$smarty->assign('pagetitle', $pagetitle);
$smarty->assign('okay', $okay);
// INCLUDE supportS CLASS FILE
include "./include/class_support.php";

// INCLUDE supportS FUNCTION FILE
include "./include/functions_support.php";
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_POST['search'])) { $search = $_POST['search']; } elseif(isset($_GET['search'])) { $search = $_GET['search']; } else { $search = ""; }



// SET SORT CLAUSE
$sort = "support_id DESC";

// SET WHERE CLAUSE
if($search != "") { $where = "(support_title LIKE '%$search%' OR support_body LIKE '%$search%')"; } else { $where = ""; }

// CREATE support OBJECT
$entries_per_page = 1000;
$support = new se_support($user->user_info[user_id]);

// DELETE NECESSARY ENTRIES
$start = ($p - 1) * $entries_per_page;
if($task == "delete") { $support->supports_delete($start, $entries_per_page, $sort, $where); }

// GET TOTAL ENTRIES
$total_supports = $support->supports_total($where);

// MAKE ENTRY PAGES
$page_vars = make_page($total_supports, $entries_per_page, $p);
$uuid = $user->user_info[user_id];
// GET ENTRY ARRAY
$supports = $support->supports_list($page_vars[0], $entries_per_page, $sort, $where);
$database->database_query("UPDATE se_users SET total_support='0' WHERE user_id = $uuid");
// ASSIGN VARIABLES AND SHOW VIEW ENTRIES PAGE
$smarty->assign('search', $search);
$smarty->assign('supports', $supports);
$smarty->assign('total_supports', $total_supports);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($supports));
include "footer.php";}
?>