<?php

    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';

    if (isset($_POST['update-profile'])) {
        session_start();
        $username = $_SESSION['username'];
        $firstName = $_POST['first_name'];
        $lastName = $_POST['last_name']; 
        $barangay = $_POST['barangay'];
        $email = $_POST['email'];
        $image = $_FILES['file'];

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
        updateProfile($connection, $username, $firstName, $lastName, $barangay, $email);

    }