<?php
include "dbConn.php"; // db connection file

if(isset($_POST['submit'])){
    $username=$_POST['username'];
    $password=$_POST['password'];
    $bio=$_POST['bio'];
    $age=$_POST['age'];

    $insert = mysqli_query($db, "INSERT INTO `customer` (`username`, `password`, `bio`, `age`) VALUES ('$username', '$password', '$age', '$bio')");

    if(!$insert) {
        echo mysqli_error();
    } else {
        echo "User data submitted successfully!";
    }
}

mysqli_close($db);
?>