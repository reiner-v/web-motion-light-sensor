<?php 
include_once('connect.php');

$result = mysqli_query($con,"SELECT alarm_state  FROM power");
$value = $result -> fetch_assoc();
if($value["alarm_state"] == '0')
{
echo 'no alarm';
}
 else{
echo 'alarm';
}

?>