<?
$page = "user_mobile_logout";
include "mobile_header.php";

$user->user_logout();

// FORWARD TO USER LOGIN PAGE
cheader("mobile_home.php");
exit();
?>