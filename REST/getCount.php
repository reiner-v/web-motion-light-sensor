<?php
include_once('connect.php');

    $month = $_GET['month'];
    $day = $_GET['day'];
    $yr = $_GET['year'];

    $sql = "SELECT * FROM logs WHERE month='$month' AND day='$day' AND year='$yr'";
    $result = mysqli_query($con, $sql);

  

   echo mysqli_num_rows($result);

   

?>