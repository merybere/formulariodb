<?php


function loginUser($cnx, $arrayData)
{
	$sql="SELECT iduser, name
		  FROM users
		  WHERE email='".$arrayData['email']."' AND
		  		password='".$arrayData['password']."'";
	_debug($sql);
	
	$user=query($sql, $cnx);
	
	if(count($user)==1)
	{
		echo "si";
		$_SESSION['iduser']=$user[0]['iduser'];
		RETURN TRUE;
	}
	else
		return FALSE;
	
	
			
	
}









