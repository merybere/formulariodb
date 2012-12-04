<?php 
include_once(APPLICATION_PATH."/models/loginModel.php");

switch($arrayRequest['action'])
{	
	case 'index':
	case 'login':	
		if($_POST)
		{
			_debug($_POST);
			loginUser($cnx, $_POST);
			header ("Location: /users");
			exit();
		}
		else
			$content=renderView($config, 'login/login', array());
	break;
	case 'logout':
		session_destroy();
		header ("Location: /index");
		exit();
	break;
	default:
	break; 
}

$params=array('content'=>$content);
echo renderLayout($config, 'layout_login', $params);





