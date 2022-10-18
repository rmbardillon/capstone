<?php
    if (isset($_POST['add_admin_submit'])) {
        $lastName = $_POST['last_name'];
        $firstName = $_POST['first_name'];
        $adminType = $_POST['admin-type'];
        $barangay = $_POST['barangay'];
        $email = $_POST["email"];
        $password = $_POST["password"];
        $confirmPassword = $_POST["repeat_password"];
        $currentUsername = "admin".str_replace(" ", "", strtolower($firstName[0].$lastName));
        $username = $currentUsername;
        $i = 0;
    
        require_once 'dbh.inc.php';
        require_once 'functions.inc.php';

        while (usernameExists($connection, $currentUsername) !== false) {
            $i++;
            $currentUsername = "";
            $currentUsername = $username.$i;
        }
        if (userExists($connection, $firstName, $lastName) !== false) {
            header("location: ../add-administrator.html?error=userexists");
            exit();
        }
        if (invalidEmail($email) !== false) {
            header("location: ../add-administrator.html?error=invalidemail");
            exit();
        }
        if (emailExists($connection, $email) !== false) {
            header("location: ../add-administrator.html?error=emailtaken");
            exit();
        }
        if (passwordMatch($password, $confirmPassword) !== false) {
            header("location: ../add-administrator.html?error=passwordnotmatch");
            exit();
        }
        insertAdmin($connection, $firstName, $lastName, $adminType, $barangay, $currentUsername, $email, $password);
    
    }
    else {
        header("location: ../add-administrator.html");
        exit();
    }
?>