<?php
include_once('connect.php');

    $sql = "SELECT * FROM power";
    $result = mysqli_query($con, $sql);

    $value = $result -> fetch_assoc();
    
    if ($value["mode_state"] == '0' and $value["power_state"] == '1')
    {
	    echo "Manual|Light Status is ON!";
    }
   else if ($value["mode_state"] == '0' and $value["power_state"] == '0')
    {
	    echo "Manual|Light Status is OFF!";
    }
   else if ($value["mode_state"] == '1' and $value["power_state"] == '1')
   {
   	    echo "Automatic|Light Status is ON!"; 
    }
    else if ($value["mode_state"] == '1' and $value["power_state"] == '0')
   {
   	    echo "Automatic|Light Status is OFF!"; 
    }
    else 
    {
        echo 'error';
    }


   

?>