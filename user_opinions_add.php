<?
//////////////////////////////////
//    Автор:  Fost		//
//    Сайт:   www.vceti.net	//
//    E-mail: admin@vceti.net	//
//    ICQ:    434-897-434	//
//            473-167-680	//
//////////////////////////////////

include "header.php";

$body = $_GET['body'];

if($body=="" OR $body==" "){
header("Location: ./opinions.php?act=view&id=".$owner->user_info[user_id]."&m=1"); exit();
	}
else
	{
$plus_text_query = mysql_query("
INSERT INTO se_checkbox (checkbox_id, checkbox_user_id, checkbox_authoruser_id, checkbox_body, checkbox_date) 
VALUE ('', '".$owner->user_info[user_id]."', '".$user->user_info[user_id]."', '$body', '".time()."')");
$database->database_query("UPDATE se_users SET user_opinions  = user_opinions + 1 WHERE user_id = ".$owner->user_info[user_id]."");
header("Location: ./opinions.php?user=".$owner->user_info[user_username]."&m=2"); exit();
	}

?>