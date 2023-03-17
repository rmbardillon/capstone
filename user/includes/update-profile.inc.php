<?php

    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';
    require_once 'sql.inc.php';

    if (isset($_POST['update-profile'])) {
        session_start();
        $username = $_SESSION['username'];
        $id = $_POST['person_id'];
        $email = $_POST['email'];
        $image = $_FILES['file'];
        $securityQuestion1 = $_POST["security_question1"];
        $securityQuestion2 = $_POST["security_question2"];
        $securityQuestion3 = $_POST["security_question3"];
        $securityAnswer1 = $_POST["securityAnswer1"];
        $securityAnswer2 = $_POST["securityAnswer2"];
        $securityAnswer3 = $_POST["securityAnswer3"];

        if ($image['name'] != "") {
            $fileName = $image['name'];
            $fileTmpName = $image['tmp_name'];
            $fileSize = $image['size'];
            $fileError = $image['error'];
            $fileType = $image['type'];
            $fileExt = explode('.', $fileName);
            $fileActualExt = strtolower(end($fileExt));
            $allowed = array('jpg', 'jpeg', 'png', '');

            if (in_array($fileActualExt, $allowed)) {
                if ($fileError === 0) {
                    $newFileName = uniqid('', true).".".$fileActualExt;
                    $fileDestination = "../uploads/".$newFileName;
                    $_SESSION['profileDestination'] = $fileDestination;
                    insertProfile($connection, $username, $newFileName, $fileTmpName, $fileDestination);
                } else {
                    header("location: ../profile.html?error=therewasanerror");
                    exit();
                }
            } else {
                header("location: ../profile.html?error=filenotallowed");
                exit();
            }
        }
        $stmt = $connection->prepare("UPDATE person SET EMAIL = '$email' WHERE PERSON_ID = '$id'");
        // Execute the query
        $stmt->execute();
        $securityQuestions = getUserData($connection, "security_questions", "PERSON_ID", $id);
        if($securityQuestions == null) {
            insertSecurityQuestions($connection, $id, $securityQuestion1, $securityAnswer1, $securityQuestion2, $securityAnswer2, $securityQuestion3, $securityAnswer3);
        } else {
            updateSecurityQuestions($connection, $id, $securityQuestion1, $securityAnswer1, $securityQuestion2, $securityAnswer2, $securityQuestion3, $securityAnswer3);
        }
        header("location: ../profile.html?error=none");
        exit();
    }