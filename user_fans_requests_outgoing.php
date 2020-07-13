<?
$page = "user_fans_requests_outgoing";
include "header.php";

if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }

// ENSURE CONECTIONS ARE ALLOWED FOR THIS USER
if($setting[setting_connection_allow] == 0) { header("Location: user_home.php"); exit(); }

// GET TOTAL fanS
$total_fans = $user->user_fan_total(0, 0);

// MAKE fan PAGES
$fans_per_page = 10;
$page_vars = make_page($total_fans, $fans_per_page, $p);

// GET fan ARRAY
$fans = $user->user_fan_list($page_vars[0], $fans_per_page, 0, 0);

// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('fans', $fans);
$smarty->assign('total_fans', $total_fans);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($fans));
include "footer.php";
?>