<?php include('header.php') ?> <!-- Include the 'header.php' file to include header content -->

<?php include('dbcon.php') ?> <!-- Include the 'dbcon.php' file to establish a database connection -->

<div class="box1">
    <h2>ALL STUDENTS</h2>
    <button class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">ADD STUDENTS</button>
    <!-- Display a header and a button that triggers a modal for adding students -->
</div>

<table class="table table-hover table-bordered table-striped">
    <!-- Create an HTML table with Bootstrap styling -->

    <thead>
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Student ID</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
    </thead>

    <tbody>
        <?php
        $query = "select * from `students`";
        $result = mysqli_query($connection, $query);

        if (!$result) {
            die("query Failed" . mysqli_error());
        } else {
            while ($row = mysqli_fetch_assoc($result)) {
        ?>
                <tr>
                    <td><?php echo $row['id']; ?></td>
                    <td><?php echo $row['first_name']; ?></td>
                    <td><?php echo $row['last_name']; ?></td>
                    <td><?php echo $row['student_id']; ?></td>
                    <td><a href="update.php?id=<?php echo $row['id']; ?>" class="btn btn-success">Update</td>
                    <td><a href="delete.php?id=<?php echo $row['id']; ?>" class="btn btn-danger">Delete</td>
                </tr>
        <?php
            }
        }
        ?>
    </tbody>
</table>
<!-- Populate the table with student data fetched from the database and provide Update and Delete buttons for each student -->

<?php
if (isset($_GET['message'])) {
    echo "<h6>" . $_GET['message'] . "</h6>";
}
?>
<!-- Display a message if a 'message' is present in the URL query parameters -->

<?php
if (isset($_GET['insert_msg'])) {
    echo "<h6>" . $_GET['insert_msg'] . "</h6>";
}
?>
<!-- Display a message if an 'insert_msg' is present in the URL query parameters -->

<?php
if (isset($_GET['update_msg'])) {
    echo "<h6>" . $_GET['update_msg'] . "</h6>";
}
?>
<!-- Display a message if an 'update_msg' is present in the URL query parameters -->

<?php
if (isset($_GET['delete_msg'])) {
    echo "<h6>" . $_GET['delete_msg'] . "</h6>";
}
?>
<!-- Display a message if a 'delete_msg' is present in the URL query parameters -->

<form action="insert_data.php" method="post">
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <!-- Create a Bootstrap modal form for adding students -->
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">ADD STUDENTS</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Modal body contains a form for adding student information -->
                    <div class="form-group">
                        <label for="f_name">First Name</label>
                        <input type="text" name="f_name" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="l_name">Last Name</label>
                        <input type="text" name="l_name" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="stu_id">Student Id</label>
                        <input type="text" name="stu_id" class="form-control">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-success" name="add_students" value="ADD">
                </div>
            </div>
        </div>
    </div>
</form>
<!-- The form in the modal allows the user to input new student information for addition to the database -->

<?php include('footer.php') ?> <!-- Include the 'footer.php' file to include footer content -->