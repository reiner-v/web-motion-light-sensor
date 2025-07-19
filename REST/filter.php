<?php

include_once('connect.php');
    
    $month = $_GET['month'];
    $day = $_GET['day'];
    $yr = $_GET['year'];
    $alarm = $_GET['alarmstate'];
    $mode = $_GET['modestate'];


    if ($month =="null" AND $day =="null" AND $yr =="null" AND $alarm == "All" AND $mode == "All"){ // no filter
        $sql = mysqli_query($con,"SELECT * FROM logs ORDER BY logs_pk DESC");
       
    }
    else if ($month !="null" AND $day !="null" AND $yr !="null"  AND $alarm == "All" AND $mode == "All"){ //date - no alarm - no mode 
        $sql = mysqli_query($con,"SELECT * FROM logs  WHERE month='$month' AND day='$day' AND year='$yr' ORDER BY logs_pk DESC");
    }
    else if($month !="null" AND $day !="null" AND $yr!="null" AND $alarm != "All"  AND $mode == "All" ){ //date - alarm - no mode
         $sql = mysqli_query($con,"SELECT * FROM logs  WHERE month='$month' AND day='$day' AND year='$yr' AND alarm_status='$alarm' ORDER BY logs_pk DESC");
    }
    else if($month !="null" AND $day !="null" AND $yr!="null"  AND $alarm == "All"  AND $mode != "All"){ //date - no alarm - mode
         $sql = mysqli_query($con,"SELECT * FROM logs  WHERE month='$month' AND day='$day' AND year='$yr' AND mode_status='$mode' ORDER BY logs_pk DESC");
    }
    else if($month !="null" AND $day !="null" AND $yr!="null"  AND $alarm != "All"  AND $mode != "All"){ //date - no alarm - no mode
         $sql = mysqli_query($con,"SELECT * FROM logs  WHERE month='$month' AND day='$day' AND year='$yr' AND mode_status='$mode'  AND alarm_status='$alarm' ORDER BY logs_pk DESC");
    }
    else if($month =="null" AND $day =="null" AND $yr=="null" AND $alarm != "All" AND  $mode == "All" ){ //no date - alarm - no mode
         $sql = mysqli_query($con,"SELECT * FROM logs  WHERE alarm_status='$alarm' ORDER BY logs_pk DESC");
    } 
    else if($month =="null" AND $day =="null" AND $yr=="null" AND $alarm == "All"  AND $mode != "All" ){ //no date - no alarm - mode
         $sql = mysqli_query($con,"SELECT * FROM logs  WHERE mode_status='$mode' ORDER BY logs_pk DESC");
    }
     else if($month =="null" AND $day =="null" AND $yr=="null" AND $alarm != "All"  AND $mode != "All" ){ //no date - alarm -  mode
         $sql = mysqli_query($con,"SELECT * FROM logs  WHERE mode_status='$mode'  AND alarm_status='$alarm' ORDER BY logs_pk DESC");
    }




    $allemployee = array();


  if (mysqli_num_rows($sql)==0)
    {
        echo "no rows";
    }
  else if (mysqli_num_rows($sql)!=0)
  {
        while($value = mysqli_fetch_assoc($sql))
        {  
            $allemployee[] = $value;
        }
        
        echo json_encode($allemployee);
    }
	mysqli_close($con);
?>
