<?
//////////////////////////////////
//    Автор:  Fost		//
//    Сайт:   www.vceti.net	//
//    E-mail: admin@vceti.net	//
//    ICQ:    434-897-434	//
//            473-167-680	//
//////////////////////////////////

 include "header.php";

$user_id = $_GET['id'];
$com_id = $_GET['cid'];

$author_query = mysql_query("SELECT checkbox_user_id FROM se_checkbox WHERE checkbox_id = $com_id");
$author = mysql_result($author_query, 'checkbox_user_id');

if($user->user_info['user_id']==$author){
$dell_com_query = mysql_query("DELETE FROM `se_checkbox` WHERE `checkbox_id` = $com_id");
header("Location: ./user_opinions.php?m=2");
exit();
	}
else
	{
header("Location: ./user_opinions.php?m=1");
exit();
	}

?>