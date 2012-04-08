<?php
session_start();
echo "This is Salinis System";
include("session_params.php");
include("session_handler.php");
/*Saving the parameters of the current request into the database*/
//$url = $_SERVER['REQUEST_URI'];
$pageURL = (@$_SERVER["HTTPS"] == "on") ? "https://" : "http://";
if ($_SERVER["SERVER_PORT"] != "80")
{
    $pageURL .= $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"];
} 
else 
{
    $pageURL .= $_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
}
echo $pageURL;
foreach ($_POST  as $property=>$value) {
print ( "<i>".$property."</i> => <b>".$value." </b> <br/>" );
}
$post = serialize($_POST);
echo $post;
$session_id = $_COOKIE["PHPSESSID"];
$currentRequest =  new SessionParams($pageURL,$post);
$requestString = serialize($currentRequest);
saveSession_init($session_id,$requestString,0);
?>
