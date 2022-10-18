<?php
    if (isset($_POST['register'])) {
        $firstName = $_POST['firstName'];
        $lastName = $_POST['lastName'];
        $middleName = $_POST['middleName'];
        $suffix = $_POST['suffix'];
        $email = $_POST["email"];
        $password = $_POST["password"];
        $confirmPassword = $_POST["confirmPassword"];
        $currentUsername = str_replace(" ", "", strtolower($firstName[0].$middleName[0].$lastName.$suffix));
        $username = $currentUsername;
        $i = 0;
        $vkey = md5(time().$username);
    
        require_once 'dbh.inc.php';
        require_once 'functions.inc.php';

        while (usernameExists($connection, $currentUsername) !== false) {
            $i++;
            $currentUsername = "";
            $currentUsername = $username.$i;
        }
        if (userExists($connection, $firstName, $middleName, $lastName) !== false) {
            header("location: ../sign-up.html?error=userexists");
            exit();
        }
        if (emailExists($connection, $email) !== false) {
            header("location: ../sign-up.html?error=emailtaken");
            exit();
        }
        insertUser($connection, $firstName, $middleName, $lastName, $suffix, $currentUsername, $email, $vkey, $password);
    
    }
    else {
        header("location: ../sign-up.html");
        exit();
    }
?>