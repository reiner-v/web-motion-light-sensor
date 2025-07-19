<?php 
include_once('connect.php');

$pstate = $_GET['pState'];
$mstate = $_GET['mState'];
$m = $_GET['mon'];
$d = $_GET['day'];
$y = $_GET['yr'];
$t = $_GET['time'];
$ms = $_GET['mode'];

$result = mysqli_query($con,"UPDATE power  SET power_state='$pstate',mode_state='$mstate'");
if ($m!="null"){
$insert = mysqli_query($con,"INSERT INTO logs (month,day,year,log_time, mode_status,alarm_status) VALUES ('$m','$d','$y','$t','$ms','0')");
echo 'inputted!';
}
echo 'inputted!'; 

?>