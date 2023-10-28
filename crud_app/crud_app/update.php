<?php include('header.php'); ?>
<?php include('dbcon.php'); ?>

<?php

if (isset($_GET['id'])) {
    $id = $_GET['id'];


    // Fetch the student record based on the 'id' parameter from the URL
    $query = "select * from `students` where `id` = '$id'";
    $result = mysqli_query($connection, $query);

    if (!$result) {
        die("query Failed" . mysqli_error());
    } else {
        $row = mysqli_fetch_assoc($result);
        // print_r($row);
        // Store the fetched student record in the '$row' variable
    }
}

?>

<?php

if (isset($_POST['update_students'])) {
    if (isset($_GET['id_new'])) {
        $idnew = $_GET['id_new'];
    }
}
// Check if the 'update_students' form has been submitted and if an 'id_new' parameter is set in the URL

if (isset($_POST['update_students'])) {
    $fname = $_POST['f_name'];
    $lname = $_POST['l_name'];
    $stu_id = $_POST['stu_id'];

    // Update the student record with the new values provided in the form
    $query = "update `students` set `first_name` = '$fname',`last_name` = '$lname',`student_id` = '$stu_id' where `id`='$idnew'";

    $result = mysqli_query($connection, $query);
    if (!$result) {
        die("query Failed" . mysqli_error());
    } else {
        header('location:index.php?update_msg= You have sucessfully updated the data.');
    }
    // Redirect to the index page with an 'update_msg' in the URL if the update is successful
}
?>

<form action="update.php?id_new=<?php echo $id; ?>" method="post">
    <!-- Create a form for updating student records, the 'id_new' parameter is included in the action URL -->
    <div class="form-group">
        <label for="f_name">First Name</label>
        <input type="text" name="f_name" class="form-control" value="<?php echo $row['first_name'] ?>">
    </div>

    <div class="form-group">
        <label for="l_name">Last Name</label>
        <input type="text" name="l_name" class="form-control" value="<?php echo $row['last_name'] ?>">
    </div>

    <div class=" form-group">
        <label for="stu_id">Student Id</label>
        <input type="text" name="stu_id" class="form-control" value="<?php echo $row['student_id'] ?>">
    </div>
    <input type="submit" class="btn btn-success" name="update_students" value="UPDATE">

</form>

<?php include('footer.php'); ?>