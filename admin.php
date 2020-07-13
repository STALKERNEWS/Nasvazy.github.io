<?
error_reporting (E_ALL ^ E_NOTICE);

$page = "admin";
include "header.php";
$smarty->assign('pg', 1);

$act = $_GET['act'];
$smarty->assign('do', $do);
//////////////////////////////
// Панель администратора
//////////////////////////////
if($act == "" or $act == "main"){
$act_title = "Админ Панель";

$do = $_GET['do'];
if($user->user_info['admin_vceti'] > 0){
}

$smarty->assign('act_title', $act_title);
include "footer.php";
}

//////////////////////////////
// Забанить пользователя
//////////////////////////////
else if($act == 'ban'){
$do = $_GET['do'];
if($user->user_info['user_adm'] == 1){
$database->database_query("UPDATE se_users SET user_ban='".$do."' WHERE user_id='".$owner->user_info[user_id]."'");

header("Location: id".$owner->user_info['user_id']."");
exit();

$smarty->assign('act_title', $act_title);
include "footer.php";
}
header("Location: id".$owner->user_info['user_id']."");
exit();
}
//////////////////////////////
//Дать голоса
//////////////////////////////
else if($act == 'point'){
$do = $_GET['do'];
if($user->user_info['user_adm'] == 1){

$database->database_query("UPDATE se_users SET user_points=user_points +'".$do."' WHERE user_id='".$owner->user_info[user_id]."'");

header("Location: id".$owner->user_info['user_id']."");
exit();

$smarty->assign('act_title', $act_title);
include "footer.php";
}
header("Location: id".$owner->user_info['user_id']."");
exit();
}
//////////////////////////////
// повысить рейтинг
//////////////////////////////
else if($act == 'rate'){
$do = $_GET['do'];
if($user->user_info['user_adm'] == 1){

$database->database_query("UPDATE se_users SET rate=rate +'".$do."' WHERE user_id='".$owner->user_info[user_id]."'");

header("Location: id".$owner->user_info['user_id']."");
exit();

$smarty->assign('act_title', $act_title);
include "footer.php";
}
header("Location: id".$owner->user_info['user_id']."");
exit();
}
//////////////////////////////
// повысить рейтинг
//////////////////////////////
else if($act == 'real'){
$do = $_GET['do'];
if($user->user_info['user_adm'] == 1){
$database->database_query("UPDATE se_users SET user_real='".$do."' WHERE user_id='".$owner->user_info[user_id]."'");

header("Location: id".$owner->user_info['user_id']."");
exit();

$smarty->assign('act_title', $act_title);
include "footer.php";
}
header("Location: id".$owner->user_info['user_id']."");
exit();
}
//////////////////////////////
// Не настоящяя страница
//////////////////////////////
else if($act == 'nreal'){
$do = $_GET['do'];
if($user->user_info['user_adm'] == 1){
$database->database_query("UPDATE se_users SET user_nreal='".$do."' WHERE user_id='".$owner->user_info[user_id]."'");

header("Location: id".$owner->user_info['user_id']."");
exit();

$smarty->assign('act_title', $act_title);
include "footer.php";
}
header("Location: id".$owner->user_info['user_id']."");
exit();
}
//////////////////////////////
// Хочу обшатся
//////////////////////////////
else if($act == 'want'){
$do = $_GET['do'];
if($user->user_info['user_adm'] == 1){
$database->database_query("UPDATE se_users SET user_want='".$do."' WHERE user_id='".$owner->user_info[user_id]."'");

header("Location: id".$owner->user_info['user_id']."");
exit();

$smarty->assign('act_title', $act_title);
include "footer.php";
}
header("Location: id".$owner->user_info['user_id']."");
exit();
}
?>
