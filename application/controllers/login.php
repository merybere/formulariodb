<?php 
include_once(APPLICATION_PATH."/models/loginModel.php");

switch($_GET['action'])
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


echo renderLayout($config, 'layout_login', array());





