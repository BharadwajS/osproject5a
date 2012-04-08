<?php 
include('database_access_param.php');

class SessionHandler{
    function SessionHandler(){
        session_start();
    }
    // register object as session data
    function registerObject($obj,$objName='defaultObject'){
        if(!is_object($obj)){  
   	   $error = "Its not an object!!!";
        }
        $var = serialize($obj);
        $_SESSION[$objName] = $var;
    }
    // deregister object from session data
    function unregisterObject($objName='defaultObject'){
       /* if(!$_SESSION[$objName]){
            trigger_error('Invalid object name.',E_USER_ERROR);
        }*/
        unset($_SESSION[$objName]);
    }
    function getSessionId()
    {
	return session_id();    
    }
    // retrieve session object
    
    function getObject($objName='defaultObject'){
        if(!$_SESSION[$objName]){
            echo('Invalid object name');
        }
        $var = $_SESSION[$objName];
        $obj = unserialize($var);
        if(!is_object($obj)){
            echo "Not an object!!!";
        }
        return  $obj;
    }
}

    
function saveSession_init($session_id,$request_obj,$transaction_flag)
{
echo "save session init called";
$hostname = "localhost";
$dbuser = "root";
$dbpassword = "saranya08";
$dbname = "exam";
if(!mysql_connect( $hostname, $dbuser, $dbpassword))
echo "Database cannot be connected";
mysql_select_db($dbname );
/*Here create a table with the user parameters*/
$sql = "CREATE TABLE ApacheSession
(
session_id varchar(200) default NULL,
session_obj varchar(500) default NULL,
transaction_flag int default 0,
PRIMARY KEY  (session_id)
);";
if(!mysql_query($sql))
echo "Query not run";

$sql = "insert into ApacheSession(session_id) values('".$session_id."');";
mysql_query($sql);
$sql = "UPDATE ApacheSession SET session_obj='".$request_obj."' WHERE session_id='".$session_id."';";
mysql_query($sql);
$sql = "UPDATE ApacheSession SET transaction_flag='".$request_obj."' WHERE session_id='".$session_id."';";
mysql_query($sql);
}

function saveTransaction($session_id,$transaction_flag)
{
echo "Save session called";
$hostname = "localhost";
$dbuser = "root";
$dbpassword = "saranya08";
$dbname = "exam";
mysql_connect( $hostname, $dbuser, $dbpassword);
mysql_select_db($dbname );
$sql = "UPDATE ApacheSession SET transaction_flag='".$transaction_flag."' WHERE session_id='".$session_id."';";
mysql_query($sql);
} 

function retrieveSession($session_id)
{
$hostname = "localhost";
$dbuser = "root";
$dbpassword = "saranya08";
$dbname = "exam";
echo "Retrieve session called";
mysql_connect( $hostname, $dbuser, $dbpassword);
mysql_select_db($dbname );
$sql = "select * from ApacheSession where session_id='".$session_id."'";
$result=mysql_query($sql);
if(mysql_numrows($result))
{
    $row = mysql_fetch_row($result);   
}
return $row;
}

?>
