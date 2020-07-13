<?
//////////////////////////////////
//    Автор:  Fost		//
//    Сайт:   www.vceti.net	//
//    E-mail: admin@vceti.net	//
//    ICQ:    434-897-434	//
//            473-167-680	//
//////////////////////////////////

 include "header.php";

$cid = $_GET['cid'];
$body = $_GET['body'];
$subject = "Ответ на мнение";

if($body=="" OR $body==" "){
header("Location: ./opinions.php?&m=5"); exit();
	}
else
	{
$query = "SELECT * FROM `se_checkbox` WHERE checkbox_id = ".$cid."";
$res = mysql_query($query);
while($row = mysql_fetch_array($res))
{
$plus_text_query = mysql_query("
INSERT INTO se_pms (pm_id,  pm_user_id, pm_authoruser_id, pm_body,  pm_date, pm_subject) 
VALUE ('', '".$row['checkbox_authoruser_id']."', '".$user->user_info[user_id]."', '$body', '".time()."', 'Ответ на мнение')");
header("Location: ./user_opinions.php?&m=6"); exit();
}
	}
?>