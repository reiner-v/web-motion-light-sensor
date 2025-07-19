<form action="fetchAjax.php" method="POST">
<center>
<?php    
   

 include_once('connects.php');
 


$query = "SELECT * FROM `power`";
$check=mysqli_query($con,$query);
$row=mysqli_num_rows($check);


if($check == FALSE) { 
    echo ".".$row."."; 
}

while($row=mysqli_fetch_array($check))
  	{
  	
	echo $row['power_state'] ;
        echo "</br>";
  	
  	}
  
  


?>

</form>
</center>

