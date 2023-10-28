<?php
// Define constants to store database connection information
define("HOSTNAME", "localhost");
define("USERNAME", "root");
define("PASSWORD", "");
define("DATABASE", "crud_operations");

// Establish a database connection using the defined constants
$connection = mysqli_connect(HOSTNAME, USERNAME, PASSWORD, DATABASE);

// Check if the connection was successful
if (!$connection) {
    // If the connection failed, display an error message and terminate the script
    die("Connection Failed: ");
}
// If the connection is successful, the script continues to execute
