<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Doctor View Table</title>
</head>
<style>
h1{
font-size:50px;
text-align:center;
padding-top:20px;
color:#000066;
}
li{
font-size:24px;
}
ul{
font-size:28px;
}
ul h3{
font-size:30px;
}
body {margin:0;
padding:0;
width:100%;
height:100vh;
background-image:url(../pic/Doctor_Time.jpg);
background-size:cover;}
div ul
{
padding-bottom:70px;
}
</style>
<body class="container-fluid">
<h1 class="text-monocase text-capitalize text-center text-light">Disease View Table</h1>
    
<ul class="text-center font-weight-bold text-monospace text-dark">  
<table border="1" 
class="table table-hover table-dark">
  <thead>
    <tr>
      <th scope="col" >ID</th>
      <th scope="col" >Disease</th>
      <th scope="col" >Disease_Type</th>
      <th scope="col" >Disease Stage</th>
      <th scope="col" >Disease Transmission</th>
      <th scope="col" >Disease Communicable</th>
      <th scope="col" >Disease Fatality</th>
    </tr>
  </thead>
<?php 
include("connection.php");
?><br/>
<?php
       $query = "SELECT 
                    Disease_ID AS ID, 
                    Disease_name AS Disease, 
                    Disease_type as Disease_Type, 
                    Disease_stage as Disease Stage, 
                    Disease_transmission as Disease Transmission, 
                    Disease_communicable as Disease Communicable, 
                    Disease_fatality as Disease Fatality
                 FROM Disease_View";

            $run = mysqli_query($connection, $query);

				   while($row = mysqli_fetch_array($run))
				   {
                    echo "<h3><tr><th>". $row['ID'] ." </h3>";
                      echo "<h3><th>". $row['Disease'] ." </h3>";
                        echo "<h3><th>". $row['Disease_Type'] ." </h3>";
                            echo "<h3><th>". $row['Disease Stage'] ." </h3>";
                                echo "<h3><th>". $row['Disease Transmission'] ." </h3>";
                                    echo "<h3><th>". $row['Disease Communicable'] ." </h3>";
                                        echo "<h3><th>". $row['Disease Fatality'] ." </th></tr></h3>";
				   }
			   ?></table></ul>
                   
<div class="container ">
<ul class="pager font-weight-bold text-monospace">


</ul></div><?php
?>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
              
</body>
</html>