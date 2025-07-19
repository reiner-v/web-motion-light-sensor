<?php

$DB_HOST = "192.168.43.156";
$DB_USER = "reiner";
$DB_PASS = "";
$DB_NAME = "ate_co";

//$DB_HOST = "localhost";
//$DB_USER = "root";
//$DB_PASS = "";
//$DB_NAME = "lehitimo";


//create database connection
$con=mysqli_connect($DB_HOST,$DB_USER,$DB_PASS,$DB_NAME);

//check connection
if (!$con)
{
   die( "Connection Failed");
}
?>