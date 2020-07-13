<?
$page = "user_fans";
include "header.php";

if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_POST['s'])) { $s = $_POST['s']; } elseif(isset($_GET['s'])) { $s = $_GET['s']; } else { $s = "ud"; }
if(isset($_POST['search'])) { $search = $_POST['search']; } elseif(isset($_GET['search'])) { $search = $_GET['search']; } else { $search = ""; }


// ENSURE CONECTIONS ARE ALLOWED FOR THIS USER
if($setting[setting_connection_allow] == 0) { header("Location: user_home.php"); exit(); }



// SET fan SORT-BY VARIABLES FOR HEADING LINKS
$u = "ud";    // LAST UPDATE DATE
$l = "ld";    // LAST LOGIN DATE
$t = "t";     // fan TYPE

// SET SORT VARIABLE FOR DATABASE QUERY
switch($s) {
  case "ud": $sort = "se_users.user_dateupdated DESC"; $u = "ud"; break;
  case "ld": $sort = "se_users.user_lastlogindate DESC"; $l = "ld"; break;
  case "t": $sort = "se_fans.fan_type"; $t = "td"; break;
  default: $sort = "se_users.user_dateupdated DESC"; $u = "ud";
}

// SET WHERE CLAUSE
if($search != "") { $is_where = 1; $where = "(se_users.user_username LIKE '%$search%' OR se_users.user_email LIKE '%$search%')"; } else { $is_where = 0; $where = ""; }

// DECIDE WHETHER TO SHOW DETAILS
$connection_types = explode("<!>", trim($setting[setting_connection_types]));
if((count($connection_types) == 0 | str_replace(" ", "", $setting[setting_connection_types]) == "") & $setting[setting_connection_other] == 0 & $setting[setting_connection_explain] == 0) {
  $show_details = 0;
} else {
  $show_details = 1;
}

// GET TOTAL fanS
$total_fans = $user->user_fan_total(0, 1, $is_where, $where);


// MAKE fan PAGES
$fans_per_page = 10;
$page_vars = make_page($total_fans, $fans_per_page, $p);

// GET fan ARRAY
$fans = $user->user_fan_list($page_vars[0], $fans_per_page, 0, 1, $sort, $where, $show_details);



// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('s', $s);
$smarty->assign('u', $u);
$smarty->assign('l', $l);
$smarty->assign('t', $t);
$smarty->assign('search', $search);
$smarty->assign('fans', $fans);
$smarty->assign('total_fans', $total_fans);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($fans));
$smarty->assign('show_details', $show_details);
include "footer.php";
?>