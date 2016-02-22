<?php
$servername = "localhost";
$username = "wangel12";
$password = "shuffle101S";
$db = "eservicetracker";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $db);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully";
?>