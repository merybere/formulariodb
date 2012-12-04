<?php

$arrayRequest=setRequest();
// if(isset($_GET['controller']))
// 	$action=$_GET['controller'];
// else
// 	$action='index';
// _debug($arrayRequest);

$config=readConfig('../application/configs/config.ini', APPLICATION_ENV);
$cnx=connect($config);

session_start();
_debug($_SESSION);


switch($_GET['controller'])
{
	case 'users':
		include("../application/controllers/users.php");	
	break;
	case 'error':
		include("../application/controllers/error.php");
	break;
	case 'login':
		include("../application/controllers/login.php");
	break;
	case 'index':
	default:
		include("../application/controllers/index.php");
	break;
}
