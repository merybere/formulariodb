<?php 

switch($_GET['action'])
{	
	case '404':	
		header("HTTP/1.0 404 Not Found");	
		$content=renderView($config, 'error/404', array());
	break;
	default:
	break; 
}


include("../application/layouts/layout_admin1.php");





