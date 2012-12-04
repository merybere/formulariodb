<?php 

switch($arrayRequest['action'])
{	
	case '404':	
		header("HTTP/1.0 404 Not Found");	
		$content=renderView($config, 'error/404', array());
	break;
	case '403':
		header("HTTP/1.0 403 Not Found");
		$content=renderView($config, 'error/403', array());
	break;
	default:
		
	break; 
}

$params=array('userName'=>'NO USER',
		'content'=>$content);
echo renderLayout($config, 'layout_admin1', $params);





