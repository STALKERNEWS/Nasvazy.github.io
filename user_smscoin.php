<?
/*
=====================================================
 Social Engine plugin - by SmsCoin
-----------------------------------------------------
 http://smscoin.com
-----------------------------------------------------
 Copyright (c) 2008 SmsCoin
=====================================================
 Файл: user_smscoin.php
-----------------------------------------------------
 Назначение: модуль оплаты посредством смс сообщения
=====================================================
*/

##
#	Функция создания подписи 
##
function ref_sign() {
	$params = func_get_args();
	$prehash = implode("::", $params);
	return md5($prehash);
}

$page = "user_smscoin";
include "header.php";

# Выборка данных
$res = $database->database_query("SELECT * FROM se_languagevars WHERE languagevar_id = 81000011");
$res = $database->database_fetch_assoc($res);
$cron = $database->database_query("SELECT * FROM se_languagevars WHERE languagevar_id = 81000012");
$cron = $database->database_fetch_assoc($cron);
$purse = $database->database_query("SELECT * FROM se_languagevars WHERE languagevar_id = 81000005");
$purse = $database->database_fetch_assoc($purse);
$purse = $purse['languagevar_value'];

$pair = false;
if(is_numeric($_POST['s_amount'])) {
	
	$pair = $_POST['s_amount'];
	$description = $database->database_query("SELECT * FROM se_languagevars WHERE languagevar_id = 81000007");
	$description = $database->database_fetch_assoc($description);
	$description = $description['languagevar_value'];
	$code = $database->database_query("SELECT * FROM se_languagevars WHERE languagevar_id = 81000009");
	$code = $database->database_fetch_assoc($code);
	$code = $code['languagevar_value'];
	// making signature
	// создаем подпись
	$sign = ref_sign($purse, $user->user_info['user_id'], $pair, 0, $description, $code);

	$smarty->assign('purse', $purse);
	$smarty->assign('pair', $pair);
	$smarty->assign('order_id', $user->user_info['user_id']);
	$smarty->assign('description', $description);
	$smarty->assign('sign', $sign);

} else {

	$smarty->assign('pair', $pair);
	$smarty->assign('points', $res['languagevar_value']);
	$smarty->assign('bankurl', $url->url_base."smsbank_json");
}
# Обновление тарифов
if($cron['languagevar_value']<(time()-3600)) {

	@ini_set('user_agent', 'smscoin_generic_cron');
	$response = file_get_contents("http://bank.smscoin.com/json/bank/".$purse);
	if ($response !== false) {
		if (preg_match('|(JSONResponse = \[.*?\])|is', $response, $feed) > 0) {
			$filename = dirname(__FILE__).'/smsbank_json/lib/local.js';
			if (($hnd = @fopen($filename, 'w')) !== false) {
				if (@fwrite($hnd, $response) !== false) {
					$info = ('Success, file updated @ '.date("r"));
					$database->database_query("UPDATE se_languagevars SET languagevar_value = ".time()." WHERE languagevar_id = 81000012");
				} else {
					$info = ('File not writeable');
				}
				fclose($hnd);
			} else {
				$info = ('Could not open file');
			}
		} else {
			$info = ('Received file is not feed');
		}
	} else {
		$info = ('Unable to connect to remote server');
	}
}
include "footer.php";
?>
