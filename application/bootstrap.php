<?php

$config=readConfig('../application/configs/config.ini', APPLICATION_ENV);
$cnx=connect($config);

session_start();
_debug($_SESSION);

$arrayRequest=setRequest();


_debug($arrayRequest);
if(isset($_SESSION['iduser']))
	$user=readUser($_SESSION['iduser'], $cnx);
else
	$user['roles_idrol']='4';

_debug($user['roles_idrol']);
$arrayRequest=acl($arrayRequest,$user['roles_idrol'], $cnx);
_debug($arrayRequest);

switch($arrayRequest['controller'])
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
