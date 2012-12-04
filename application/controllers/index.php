<?php 

switch($arrayRequest['action'])
{	
	case 'index':	
		$content=renderView($config, 'index/index', array());
	break;
	default:
	break; 
}


include("../application/layouts/layout_front.php");





