<?php

include_once('connect.php');

	
	$username = $_GET['uname'];
	$password = $_GET['pword'];

	$adminacc = mysqli_query($con,"SELECT * FROM account WHERE role = 'Admin' AND employeeid = '$username' AND pword = '$password'");
	$clientacc = mysqli_query($con,"SELECT * FROM account WHERE role = 'Client' AND employeeid = '$username' AND pword = '$password'");
	
	if (mysqli_num_rows($adminacc)>0)
	{
      	echo "Admin";
	}
	else if (mysqli_num_rows($clientacc)>0)
	{	
       	echo "Client";
	}
	else 
	{
		echo "User doesn't exist.";	
	}
	mysqli_close($con);
?>