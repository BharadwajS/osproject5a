<?php
session_start();
echo "Init.php called";
//include("session_handler.php");

$session = $_COOKIE["PHPSESSID"];
echo $session;
$transaction = 1; //means this transaction is complete
/*Now the transaction is complete so set the transaction flag to 1*/
saveTransaction($session,$transaction);
?>
