<?php

if(isset($_GET['controller']))
	$action=$_GET['controller'];
else
	$action='index';


$config=readConfig('../application/configs/config.ini', APPLICATION_ENV);
$cnx=connect($config);


switch($action)
{
	case 'users':
		include("../application/controllers/users.php");	
	break;
	case 'index':
	default:
		die("Al controller index");
	break;
}
