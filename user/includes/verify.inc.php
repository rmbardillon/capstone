<?php
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';

    if (isset($_GET['vkey'])) {
        $vkey = $_GET['vkey'];

        $userVkey = getUserData($connection, "user", "vkey", $vkey);
        $verified = "1";
        if ($userVkey) {
            $sql = "UPDATE user SET is_verified = ? WHERE vkey = ?;";
            $stmt = mysqli_stmt_init($connection);
            if (!mysqli_stmt_prepare($stmt, $sql)) {
                header("location: ../home.html?error=stmterror");
                exit();
            }
            mysqli_stmt_bind_param($stmt, "ss", $verified, $vkey);
            mysqli_stmt_execute($stmt);
            mysqli_stmt_close($stmt);
            header("location: ../verified.html?verified=success");
            exit();
        } else {
            header("location: ../verified.html?verified=failed");
            exit();
        }
    }

?>