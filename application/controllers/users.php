<?php 
/**
 * Usersontroller.php is the users controller
 *
 * This module implement CRUD over users table.
 *
 * @author     Agustín Calderón <agustincl@gmail.com>
 * @copyright  Copyright 2012 Elemental. All Rights Reserved.
 * @license    http://creativecommons.org/licenses/by-nc-nd/3.0/es/CC-NC-ND
 * @category   PHP & MySQL Training
 * @package    Users
 * @subpackage file
 * @version    GIT $Id:$
 *
*/

// Inicializaciones
$arrayUser=initArrayUser();


if(isset($_GET['action']))
	$action=$_GET['action'];
else
	$action='select';

switch($action)
{
	case 'update':
// 		die("esto es update");
		if ($_POST)
		{
			$imageName=updateImage($_FILES, $_GET['id'], $config);
			updateToFile($imageName, $_GET['id'], $config);
			header ("Location: users.php?action=select");
			exit();
		}
		else
		{
			$arrayUser=readUser($_GET['id'], $config);
			$params=array('arrayUser'=>$arrayUser,
					'arrayDataPets'=>readPets($cnx),
					'arrayUserPets'=>readUserPets($arrayUser['iduser'], $cnx),
					'arrayDataCities'=>readCities($cnx),
					'arrayUserCities'=>array($arrayUser['cities_idcity']),
					'arrayDataCoders'=>readCoders($cnx),
					'arrayUserCoders'=>array($arrayUser['coders']),
					'arrayDataLanguages'=>readLanguages($cnx),
					'arrayUserLanguages'=>readUserLanguages($arrayUser['iduser'], $cnx)
			);
		}

	case 'insert':
		if($_POST)
		{			
			$imageName=uploadImage($_FILES, $config);
			$id=insertUser($_POST, $cnx, $imageName);
			header ("Location: users.php?action=select");
			exit();
		}
		else
		{
			$params=array('arrayUser'=>$arrayUser,
					'arrayDataPets'=>readPets($cnx),
					'arrayUserPets'=>array(),
					'arrayDataCities'=>readCities($cnx),
					'arrayUserCities'=>array(),
					'arrayDataCoders'=>readCoders($cnx),
					'arrayUserCoders'=>array(),
					'arrayDataLanguages'=>readLanguages($cnx),
					'arrayUserLanguages'=>array()
					);
			
			
			$content=renderView($config, 'formulario', $params);
		}
			
	break;
	case 'delete':
		if($_POST)
		{
			if($_POST['submit']=='si')
			{
				deleteUser($_GET['id'], $config);
				header ("Location: users.php?action=select");
				exit();
			}
			else
			{				
				header ("Location: users.php?action=select");
				exit();				
			}
				
		}
		else
		{
			$content=renderView($config, 'delete', array());
		}
	break;
	case 'select':		
		$arrayUsers=readUsers($cnx);
		$params=array('arrayUsers'=>$arrayUsers);
		$content=renderView($config, 'select', $params);
	default:
	break; 
}


include("../application/layouts/layout_admin1.php");





