<?php 

   $host = 'localhost';
   $database = 'mydb';
   $user = 'root';
   $password = '1234';

   $conn = mysqli_connect($host,$user, $password, $database);

   if (!$conn) {
      die("Connection failed: " . mysqli_connect());
   }
   echo "Connected successfully";
   mysqli_close();
?>
