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
        $password = $_POST["password"];
        $confirmPassword = $_POST["repeat_password"];
        $securityQuestion1 = $_POST["security_question1"];
        $securityQuestion2 = $_POST["security_question2"];
        $securityQuestion3 = $_POST["security_question3"];
        $securityAnswer1 = $_POST["securityAnswer1"];
        $securityAnswer2 = $_POST["securityAnswer2"];
        $securityAnswer3 = $_POST["securityAnswer3"];
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
        if (passwordMatch($password, $confirmPassword) !== false) {
            header("location: ../add-administrator.html?error=passwordnotmatch");
            exit();
        }
        if (validatePassword($password) !== true) {
            header("location: ../add-administrator.html?error=passwordmustcontain");
           exit();
        }
        insertAdmin($connection, $firstName, $lastName, $adminType, $barangay, $currentUsername, $email, $password);
    
    } else if (isset($_POST['add_admin'])) {
        $lastName = $_POST['last_name'];
        $firstName = $_POST['first_name'];
        $adminType = $_POST['admin-type'];
        $barangay = $_POST['barangay'];
        $email = $_POST["email"];
        $password = $_POST["password"];
        $confirmPassword = $_POST["repeat_password"];
        $securityQuestion1 = $_POST["security_question1"];
        $securityQuestion2 = $_POST["security_question2"];
        $securityQuestion3 = $_POST["security_question3"];
        $securityAnswer1 = $_POST["securityAnswer1"];
        $securityAnswer2 = $_POST["securityAnswer2"];
        $securityAnswer3 = $_POST["securityAnswer3"];
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
        if (passwordMatch($password, $confirmPassword) !== false) {
            header("location: ../add-administrator-admin.html?error=passwordnotmatch");
            exit();
        }
        adminInsertAdmin($connection, $firstName, $lastName, $adminType, $barangay, $currentUsername, $email, $password);
    
    } else {
        header("location: ../add-administrator.html");
        exit();
    }
?>