<?php
// Check if an 'id' is present in the URL query parameters (typically from a link or form submission)
include('dbcon.php'); ?>

<?php

if (isset($_GET['id'])) {
    // Retrieve the 'id' from the URL
    $id = $_GET['id'];
}

// Create an SQL query to delete a student record with the specified 'id'
$query = "delete from `students` where `id` = '$id' ";

// Execute the deletion query on the database
$result = mysqli_query($connection, $query);

// Check if the query execution was successful
if (!$result) {
    die("QUery Failed" . mysqli_error());
} else {
    // If the query succeeds, redirect to the index page with a success message indicating the record has been deleted
    header('location:index.php?delete_msg=You have deleted the record.');
}
?>
