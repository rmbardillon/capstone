<?php
    if (isset($_POST['admin-login'])) {
    $username = $_POST['email'];
    $password = $_POST['password'];

    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';

    loginUser($connection, $username, $password);
    } else {
        header("location: ../index.html");
        exit();
    }
?>