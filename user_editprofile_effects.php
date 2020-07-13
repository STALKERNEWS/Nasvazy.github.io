<?
error_reporting (E_ALL ^ E_NOTICE);

/////////////////////////////////////////////////////////////////
if($_GET['page'] == "" or $_GET['page'] == "main"){

$page = "user_editprofile_effects";
include "header.php";

$m = $_GET['m'];
$smarty->assign('m', $m);


$smarty->assign('pg', 1);

$page_title = "Редактирование моей страницы";
$smarty->assign('page_title', $page_title);



include "footer.php";
}
/////////////////////////////////////////////////////////////////




/////////////////////////////////////////////////////////////////
elseif($_GET['page'] == "effects"){


$page = "user_editprofile_effects";
include "header.php";

$m = $_GET['m'];
$smarty->assign('m', $m);


$smarty->assign('pg', 1);

$page_title = "Редактирование моей страницы";
$smarty->assign('page_title', $page_title);



include "footer.php";
}
/////////////////////////////////////////////////////////////////




/////////////////////////////////////////////////////////////////
elseif($_GET['page'] == "effected"){

$page = "user_editprofile_effects";
include "header.php";


if(isset($_POST['effect'])) { $effect = $_POST['effect']; } elseif(isset($_GET['effect'])) { $effect = $_GET['effect']; } else { $effect = "0"; }


if($effect == 0){
header("Location: ./user_editprofile_effects.php?page=effects&m=1"); exit(); 
}
else
{

if($user->user_info['user_points'] <= 14){ header("Location: ./editprofile.php?page=effects&m=1"); exit(); }

if($user->user_info['user_points'] >= 15){

$database->database_query("UPDATE se_users SET user_points = user_points - 15 WHERE user_id = ".$user->user_info[user_id]."");

$database->database_query("UPDATE se_users SET user_photoef = ".$effect." WHERE user_id = ".$user->user_info[user_id]."");

header("Location: ./user_editprofile_photo.php?m=2"); exit(); 
}

}




}
/////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////
elseif($_GET['page'] == "effdel"){

$page = "user_editprofile_effects";
include "header.php";



$database->database_query("UPDATE se_users SET user_photoef = 0 WHERE user_id = ".$user->user_info[user_id]."");

header("Location: ./user_editprofile_photo.php?m=3"); exit(); 







}
/////////////////////////////////////////////////////////////////




?>