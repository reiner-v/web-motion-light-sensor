<?php

include_once('connect.php');

   //$empid = $_GET['empID'];
	$emp = mysqli_query($con,"SELECT * FROM logs ORDER BY logs_pk DESC ");
    $allemployee = array();


  if (mysqli_num_rows($emp)==0)
    {
        echo "no rows";
    }
    else if (mysqli_num_rows($emp)!=0)
    {
        while($value = mysqli_fetch_assoc($emp))
        {  
            $allemployee[] = $value;
        }
        
        echo json_encode($allemployee);
    }
	mysqli_close($con);
?>
