<?php

if (isset($_POST['login'])) {
    $username = $_POST['email'];
    $password = $_POST['password'];

    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';

    loginUser($connection, $username, $password);
}
else {
    header("location: ../login.html");
    exit();
}