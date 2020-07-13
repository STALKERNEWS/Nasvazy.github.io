<?
error_reporting (E_ALL ^ E_NOTICE);


///////////////////////////////////////////////////////
if($_GET['act'] == "" or $_GET['act'] == "other"){

$page = "settings_real";
include "header.php";

$m = $_GET['m'];
$smarty->assign('m', $m);


$smarty->assign('pg', 1);

$page_title = "Дополнительные сервисы";
$smarty->assign('page_title', $page_title);

include "footer.php";
}
//////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////

elseif($_GET['act'] == "wanted"){

$page = "settings_want";
include "header.php";


if(isset($_POST['want'])) { $want = $_POST['want']; } elseif(isset($_GET['want'])) { $want = $_GET['want']; } else { $want = "0"; }


if($want == 0){
header("Location: ./user_account_other.php?act=other&m=1"); exit(); 
}
else
{

if($user->user_info['user_points'] <= 4){ 
header("Location: ./user_account_other.php?act=other&m=1"); exit(); 
}

if($user->user_info['user_points'] >= 5){

$database->database_query("UPDATE se_users SET user_points = user_points - 5 WHERE user_id = ".$user->user_info[user_id]."");

$database->database_query("UPDATE se_users SET user_want = ".$want." WHERE user_id = ".$user->user_info[user_id]."");

header("Location: ./user_account_other.php?act=other&m=2"); exit(); 
}

}




}
//////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////

elseif($_GET['act'] == "wantdel"){

$page = "settings_want";
include "header.php";



$database->database_query("UPDATE se_users SET user_want = 0 WHERE user_id = ".$user->user_info[user_id]."");

header("Location: ./user_account_other.php?act=other&m=3"); exit(); 







}
///////////////////////////////////////////////////////

































?>