<?
$page = "user_points";
include "header.php";
include "include/billing.php";
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "buy"; }

if($user->user_exists != 1){
echo "<script>location.href='home.php'</script>";
}

if($task == "buy"){
if(isset($_POST['pay'])){
$out_sum=$_POST['sum'][sum];
$crc  = md5("$mrh_login:$out_sum:$inv_id:$mrh_pass1:Shp_item=$shp_item");
$smarty->assign('mrh_login', $mrh_login);
$smarty->assign('mrh_pass1', $mrh_pass1);
$smarty->assign('inv_id', $inv_id);
$smarty->assign('inv_desc', $inv_desc);
$smarty->assign('in_curr', $in_curr);
$smarty->assign('culture', $culture);
$smarty->assign('shp_item', $shp_item);
$smarty->assign('out_summ', $out_sum);
$smarty->assign('crc', $crc);
$smarty->assign('page', 4);
}elseif(isset($_GET['fail'])){
$smarty->assign('page', 5);
}elseif(isset($_GET['success'])){
$smarty->assign('page', 6);
}else{
$smarty->assign('page', 1);
}
}elseif($task == "sell"){
$smarty->assign('page', 2);
}elseif($task == "status"){
$smarty->assign('page', 3);
}
$smarty->assign('prefix_sms',$prefix_sms);
$smarty->assign('sms_mon',$sms_mon);
$smarty->assign('sms_num',$sms_num);
$smarty->assign('point',$point);
include "footer.php";
?>