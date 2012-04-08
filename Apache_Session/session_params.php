<?php 
//add your session parameters in this class
class SessionParams{
	var $uri; //string the url of request
	var $post_params; //an associative array of post parameters
		
	function SessionParams($uri,$post_params,$transaction_flag){
	$this->uri = $uri;
	$this->post_params = $post_params;
	}
}
?>
