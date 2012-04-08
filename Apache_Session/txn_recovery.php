<?php
//read from the database the value of the transaction ph

session_start();
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
include("session_handler.php");
include("session_params.php");
$session_id = $_COOKIE["PHPSESSID"];
$session_data = retrieveSession($session_id);
//print_r($session_data);
if($session_data[2] == 0){
	echo "Entered into hotstandby";
	//create a url which is read from the databse 
	//window.alert('PCR Has Been Updated');
	saveTransaction($session_id,1);
	$request_object = unserialize($session_data[1]);
	$url = $request_object->uri;
	//$url ="www.google.com"
	$post_params = $request_object->post_params;
	//echo $url;
	//create the post parameters 
	$post=unserialize($post_params);
	//print_r($post);
	foreach($post as $key=>$value) { $fields_string .= $key.'='.$value.'&'; }
	rtrim($fields_string,'&');
	//echo $fields_string;
	//what about the cookies?
	//execute the url 
	//open connection
	$ch = curl_init(); 
        
	//set the url, number of POST vars, POST data
	curl_setopt ($ch, CURLOPT_COOKIE, 'user=joya; pass=angel');
	curl_setopt($ch,CURLOPT_URL,$url);
	curl_setopt($ch,CURLOPT_POST,count($post));
	
	curl_setopt($ch,CURLOPT_POSTFIELDS,$fields_string);
        echo $url;
	//execute post
	$content = curl_exec($ch);
	curl_close($ch);
        $content = json_decode($content);

        $luckyUrl = $content->responseData->results[0]->unescapedUrl;
      header("Location: ".$luckyUrl);
      exit; //do not proceed with the current request.. 
	//close connection
	
}
//else do nothing 
?>
