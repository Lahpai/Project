<?php
// Include the 'dbcon.php' file to establish a database connection
include 'dbcon.php';

// Check if the 'add_students' form has been submitted
if (isset($_POST['add_students'])) {
    // Retrieve data submitted through the form
    $fname = $_POST['f_name'];
    $lname = $_POST['l_name'];
    $stu_id = $_POST['stu_id'];

    // Check if the first name is empty
    if ($fname == "" || empty($fname)) {
        // If the first name is empty, redirect to the index page with an error message
        header('location:index.php?message=You need to fill in the first name!');
    } else {
        $query = "insert into `students` (`first_name`, `last_name`, `student_id`) 
        values ('$fname', '$lname', '$stu_id')";

        // Execute the query on the database
        $result = mysqli_query($connection, $query);

        // Check if the query execution was successful
        if (!$result) {
            die("Query Failed" . mysqli_error());
        }
        // If the query succeeds, redirect to the index page with a success message
        else {
            header('location:index.php?insert_msg= Your data has benn added successfully');
        }
    }
}
