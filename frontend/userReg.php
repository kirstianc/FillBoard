<?php
$connect = mysql_connect(“db.bit.io”, “fillboardAdmin”, “v2_3uu93_euPNE7PXsRNKF6pWje8hsBh”);

if (!connect){
    die('Connection Failed: ' . mysql_error());
    { mysql_select_db(“fillboardAdmin/fillboard”, $connect);


        $user_info = “INSERT INTO 'customer' (username, password, age, bio) VALUES ('$_POST[username]', '$_POST[password]', '$_POST[age]', '$_POST[bio]')”;
        if (!mysql_query($user_info, $connect)) {
            die('Error: ' . mysql_error());
        }

        echo “Your information was added to the database.”;
        
        mysql_close($connect);
    } 
?>