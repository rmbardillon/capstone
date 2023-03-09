<?php
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';
    require_once 'sql.inc.php';
    if (isset($_POST['add_admin_submit'])) {
        $lastName = $_POST['last_name'];
        $firstName = $_POST['first_name'];
        $adminType = $_POST['admin-type'];
        $barangay = $_POST['barangay'];
        $email = $_POST["email"];
        $password = generateRandomPassword();
        $confirmPassword = $_POST["repeat_password"];
        $currentUsername = "admin".str_replace(" ", "", strtolower($firstName[0].$lastName));
        $username = $currentUsername;
        $i = 0;
    
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
        insertAdmin($connection, $firstName, $lastName, $adminType, $barangay, $currentUsername, $email, $password);
    
    } else if (isset($_POST['add_admin'])) {
        $lastName = $_POST['last_name'];
        $firstName = $_POST['first_name'];
        $adminType = $_POST['admin-type'];
        $barangay = $_POST['barangay'];
        $email = $_POST["email"];
        $password = $password = generateRandomPassword();
        $currentUsername = "admin".str_replace(" ", "", strtolower($firstName[0].$lastName));
        $username = $currentUsername;
        $i = 0;

        while (usernameExists($connection, $currentUsername) !== false) {
            $i++;
            $currentUsername = "";
            $currentUsername = $username.$i;
        }
        if (userExists($connection, $firstName, $lastName) !== false) {
            header("location: ../add-administrator-admin.html?error=userexists");
            exit();
        }
        if (invalidEmail($email) !== false) {
            header("location: ../add-administrator-admin.html?error=invalidemail");
            exit();
        }
        if (emailExists($connection, $email) !== false) {
            header("location: ../add-administrator-admin.html?error=emailtaken");
            exit();
        }
        adminInsertAdmin($connection, $firstName, $lastName, $adminType, $barangay, $currentUsername, $email, $password);
    
    } else {
        header("location: ../add-administrator.html");
        exit();
    }
?>