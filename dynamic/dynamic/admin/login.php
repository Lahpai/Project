<?php
session_start();
include_once "../includes/functions.php";
include_once "../includes/connection.php";
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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

            <h1 class="h3 mb-3 font-weight-normal">Please Login</h1>

            <input type="email" name="author_email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus><br>
            <!-- <label for="inputPassword" class="sr-only">Password</label> -->
            <input type="password" name="author_password" id="inputPassword" class="form-control" placeholder="Password" required><br>
            <div class="checkbox mb-3">
            </div>
            <button class="btn btn-lg btn-primary btn-block" name="login" type="submit">Log in</button>

        </form>

        <?php if (isset($_POST['login'])) {
            $author_email = mysqli_real_escape_string($conn, $_POST['author_email']);
            $author_password = mysqli_real_escape_string($conn, $_POST['author_password']);

            //checking for empty fields
            if (empty($author_email) or empty($author_password)) {
                header("Location: login.php?message=Empty+Fields");
                exit();
            }
            //checking for validity for email
            if (!filter_var($author_email, FILTER_VALIDATE_EMAIL)) {
                header("Location: login.php?message=Please+Enter+A+Valid+email");
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
                if (mysqli_num_rows($result) <= 0) {
                    header("Location: login.php?message=Login+error");
                    exit();
                } else {
                    while ($row = mysqli_fetch_assoc($result)) {
                        //checking if password matches
                        if (!password_verify($author_password, $row['author_password'])) {
                            header("Location: login.php?message=Login+error");
                            exit();
                        } else if (password_verify($author_password, $row['author_password'])) {
                            $_SESSION['author_id'] = $row['author_id'];
                            $_SESSION['author_name'] = $row['author_name'];
                            $_SESSION['author_email'] = $row['author_email'];
                            $_SESSION['author_bio'] = $row['author_bio'];
                            $_SESSION['author_role'] = $row['author_role'];
                            header("Location: index.php");
                        }
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