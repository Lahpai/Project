<?php
include_once "../includes/functions.php";
include_once "../includes/connection.php";
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <link rel="stylesheet" href="../style/bootstrap.min.css">
    <link rel="stylesheet" href="../style.css">
</head>

<body>
    <?php
    if (isset($_GET['message'])) {
        $msg = $_GET['message'];
        echo '<div class="alert alert-warning alert-dismissible fade show" role="alert">
        ' . $msg . '    
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        </div>';
    }
    ?>

    <div style="width:500px; margin:auto auto; margin-top:250px;">

        <form method="post" class="form-signin">

            <h1 class="h3 mb-3 font-weight-normal">Please sign up</h1>
            <label for="inputEmail" class="sr-only">Email address</label>
            <input type="text" name="author_name" id="input" class="form-control" placeholder="Enter name" required autofocus>
            <input type="email" name="author_email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" name="author_password" id="inputPassword" class="form-control" placeholder="Password" required>
            <div class="checkbox mb-3">
            </div>
            <button class="btn btn-lg btn-primary btn-block" name="signup" type="submit">Sign in</button>

        </form>

        <?php if (isset($_POST['signup'])) {
            $author_name = mysqli_real_escape_string($conn, $_POST['author_name']);
            $author_email = mysqli_real_escape_string($conn, $_POST['author_email']);
            $author_password = mysqli_real_escape_string($conn, $_POST['author_password']);

            //checking for empty fields
            if (empty($author_name) or empty($author_email) or empty($author_password)) {
                header("Location: signup.php?message=Empty+Fields");
                exit();
            }
            //checking for validity for email
            if (!filter_var($author_email, FILTER_VALIDATE_EMAIL)) {
                header("Location: signup.php?message=Please+Enter+A+Valid+email");
                exit();
            } else {
                //hashing password
                $hash = password_hash(
                    $author_password,
                    PASSWORD_DEFAULT
                );

                //If email exists
                $sql = "SELECT * FROM `author` WHERE author_email='$author_email'";
                $result = mysqli_query($conn, $sql);
                if (mysqli_num_rows($result) > 0) {
                    header("Location: signup.php?message=Email+Already+Exists");
                    exit();
                } else {
                    //Signing up the USER
                    $sql = "INSERT INTO `author` (
                        `author_name`,
                        `author_email`,
                        `author_password`,
                        `author_bio`,
                        `author_role`)
                        VALUES ('$author_name', 
                        '$author_email', 
                        '$hash', 
                        'Enter Bio', 'author')";

                    if (mysqli_query($conn, $sql)) {
                        header("Location: signup.php?message=Successfully+Registered");
                        exit();
                    } else {
                        header("Location: signup.php?message=Registration+Failed");
                    }
                }
            }
        }
        ?>
    </div>

    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/scroll.js"></script>
</body>

</html>