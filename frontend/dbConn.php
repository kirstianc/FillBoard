<?php

$db = mysqli_connect("db.bit.io", "fillboardAdmin", "v2_3uu93_euPNE7PXsRNKF6pWje8hsBh", "fillboardAdmin/fillboard", "5432");

if(!$db) {
    die("Connection failed: " . mysqli_connect_error());
}

?>