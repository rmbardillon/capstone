<?php
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;
    $isDeleted =  'N';
    if (isset($_SESSION['admin-data'])) {
        $getActiveUser = $_SESSION['admin-data']['username'];
    }
function email($senderName, $subject, $senderEmail, $receiverName, $receiverEmail, $message) {
    require 'PHPMailer/src/Exception.php';
    require 'PHPMailer/src/PHPMailer.php';
    require 'PHPMailer/src/SMTP.php';

    $mail = new PHPMailer(true);
    // $mail->SMTPDebug = 3;
    $mail->isSMTP();
    $mail->Host = "smtp.gmail.com";
    $mail->SMTPAuth = true;
    $mail->Username = "populationmanagementsystem@gmail.com";
    $mail->Password = "ntllidrufjiuujll";
    $mail->SMTPSecure = "tls";
    $mail->Port = "587";
    $mail->From = $senderEmail;
    $mail->FromName = $senderName;
    $mail->addAddress($receiverEmail, $receiverName);
    $mail->isHTML(true);
    $mail->Subject = $subject;
    $mail->Body = $message;
    $mail->AltBody = "This is the plain text version of email content";
    if (!$mail->send()) {
        echo "Email failed";
        exit();
    }
}

function ageCalculator($dob){
    if(!empty($dob)){
        $birthdate = new DateTime($dob);
        $today   = new DateTime('today');
        $age = $birthdate->diff($today)->y;
        return $age;
    }else{
        return 0;
    }
}

function usernameExists($connection, $username){
    $sql = "SELECT * FROM administrator WHERE username=?";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../admin-add-administrator.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "s", $username);
    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        return $row;
    } 
    else {
        $result = false;
        return $result;
    }

    mysqli_stmt_close($stmt);
}

function userExists($connection, $firstName, $lastName) {
    $sql = "SELECT * FROM administrator WHERE first_name=? and last_name=?";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../add-administrator.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "ss", $firstName, $lastName);
    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        return true;
    } 
    else {
        return false;
    }
    mysqli_stmt_close($stmt);
}

function invalidEmail($email) {
    $result;
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $result = true;
    }
    else {
        $result = false;
    }
    return $result;
}

function emailExists($connection, $email) { 
    $sql = "SELECT * FROM administrator WHERE email=?";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../admin-add-administrator.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "s", $email);
    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        return $row;
    } 
    else {
        $result = false;
        return $result;
    }

    mysqli_stmt_close($stmt);
}

function passwordMatch($password, $confirmPassword) {
    $result;
    if ($password !== $confirmPassword) {
        $result = true;
    }
    else {
        $result = false;
    }
    return $result;
}

function loginCredentialsExists($connection, $username, $email) {
    $sql = "SELECT * FROM administrator WHERE username=? or email=?";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../admin-add-administrator.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "ss", $username, $email);
    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        return $row;
    } 
    else {
        $result = false;
        return $result;
    }

    mysqli_stmt_close($stmt);
}

function loginUser($connection, $username, $password){
    $loginCredentialsExists = loginCredentialsExists($connection, $username, $username);
    if ($loginCredentialsExists === false) {
        header("location: ../../login/admin.html?error=wrongaccount");
        exit();
    }
    $passwordhashed = $loginCredentialsExists['password'];
    $checkPassword = password_verify($password, $passwordhashed);

    if ($checkPassword === false) {
        header("location: ../../login/admin.html?error=wrongpassword");
        exit();
    }
    else if($checkPassword === true) {
        session_start();
        $adminData = $_SESSION['admin-data'] = $loginCredentialsExists;
        header("location: ../dashboard.html");
        exit();
    }
}

function changePassword($connection, $oldPassword, $newPassword, $confirmPassword) {
    session_start();
    $username = $_SESSION['admin-data']['username'];
    $loginCredentialsExists = loginCredentialsExists($connection, $username, $username);
    $passwordhashed = $loginCredentialsExists['password'];
    $checkPassword = password_verify($oldPassword, $passwordhashed);

    if ($checkPassword === false) {
        header("location: ../change-password.html?error=wrongpassword");
        exit();
    } else {
        if ($confirmPassword != $newPassword) {
            header("location: ../change-password.html?error=passwordcheck");
            exit();
        } else {
            $sql = "UPDATE administrator SET password=? WHERE username=?";
            $stmt = $connection->prepare($sql);

            $hashedPassword = password_hash($confirmPassword, PASSWORD_DEFAULT);

            mysqli_stmt_bind_param($stmt, "ss", $hashedPassword, $username);
            mysqli_stmt_execute($stmt); 
            mysqli_stmt_close($stmt);
            header("location: ../change-password.html?success=passwordchanged");
            exit();
        }
    }
}

function insertAdmin($connection, $firstName, $lastName, $adminType, $barangay, $username, $email, $password){
    $sql = "INSERT INTO administrator (id, admin_type, barangay, username, first_name, last_name, email, password) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, ?, ?, ?);";
    $stmt = $connection->prepare($sql);

    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    mysqli_stmt_bind_param($stmt, "sssssss", $adminType, $barangay, $username, $firstName, $lastName, $email, $hashedPassword);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    header("location: ../add-administrator.html?error=none&username=".$username);
    exit();
}

function adminInsertAdmin($connection, $firstName, $lastName, $adminType, $barangay, $username, $email, $password){
    $sql = "INSERT INTO administrator (id, admin_type, barangay, username, first_name, last_name, email, password) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, ?, ?, ?);";
    $stmt = $connection->prepare($sql);

    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    mysqli_stmt_bind_param($stmt, "sssssss", $adminType, $barangay, $username, $firstName, $lastName, $email, $hashedPassword);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    header("location: ../add-administrator-admin.html?error=none&username=".$username);
    exit();
}

function getUserData($connection, $table, $where, $condition) {
    $data = [];
    if (empty($where)) {
        $sql = "SELECT * FROM $table";
    } else {
        $sql = "SELECT * FROM $table WHERE $where = '$condition'";
    } 
    
    $result = $connection->query($sql);

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            array_push($data, $row);
        }
    }
    return $data;
}

function getUserDataPerBarangay($connection, $table, $where, $condition, $where2, $condition2) {
    $data = [];

    $sql = "SELECT * FROM $table WHERE $where = '$condition' AND $where2 = '$condition2'";
    
    $result = $connection->query($sql);

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            array_push($data, $row);
        }
    }
    return $data;
}

function addAnnouncement($connection, $title, $for, $where, $message, $date, $from, $to) {
    session_start();
    global $isDeleted;
    $getActiveUser = $_SESSION['admin-username'];
    $sql = "INSERT INTO announcement (ANNOUNCEMENT_ID, TITLE, ANNOUNCEMENT_FOR, BARANGAY, DATE, MESSAGE, DATE_FROM, DATE_TO, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, ?, ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser');";
    $stmt = $connection->prepare($sql);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../announcement.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "sssssss", $title, $for, $where, $date, $message, $from, $to);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    header("location: ../announcement.html?error=none");
    exit();
}

function updateAnnouncement($connection, $title, $for, $where, $message, $id, $date, $from, $to) {
    session_start();
    global $isDeleted;
    $getActiveUser = $_SESSION['admin-username'];
    $sql = "UPDATE announcement SET TITLE = ?, ANNOUNCEMENT_FOR = ?, BARANGAY = ?, DATE = ?, MESSAGE = ?, DATE_FROM = ?, DATE_TO = ? DATE_UPDATED = CURDATE(), UPDATED_BY = '$getActiveUser' WHERE ANNOUNCEMENT_ID = ?;";
    $stmt = $connection->prepare($sql);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../announcement.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "ssssssss", $title, $for, $where, $date, $message, $from, $to, $id);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    header("location: ../announcement.html?error=none");
    exit();
}

function profileExisting($connection, $username, $email){
    $sql = "SELECT * FROM media WHERE username=? OR username=?";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../profile.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "ss", $username, $email);
    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        return $row;
    } 
    else {
        $result = false;
        return $result;
    }

    mysqli_stmt_close($stmt);
}

function insertProfile($connection, $username, $fileName, $fileTmpName, $fileDestination) {
    $profileExists = profileExisting($connection, $username, $username);
    if (!$profileExists) {
        move_uploaded_file($fileTmpName, $fileDestination);
        $sql = "INSERT INTO media(USERNAME, IMAGE_LOCATION) VALUES (?, ?);";
        $stmt = mysqli_stmt_init($connection);
        if (!mysqli_stmt_prepare($stmt, $sql)) {
            header("location: ../home.html?error=stmterror");
            exit();
        }
        mysqli_stmt_bind_param($stmt, "ss", $username, $fileName);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_close($stmt);
    } else {
        move_uploaded_file($fileTmpName, $fileDestination);
        unlink("../uploads/".$profileExists["IMAGE_LOCATION"]);
        $sql = "UPDATE media SET
        IMAGE_LOCATION = ?
        WHERE USERNAME = ?;";
        $stmt = mysqli_stmt_init($connection);
        if (!mysqli_stmt_prepare($stmt, $sql)) {
            header("location: ../home.html?error=stmterror");
            exit();
        }
        mysqli_stmt_bind_param($stmt, "ss", $fileName, $username);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_close($stmt);
    }
    header("location: ../profile.html?error=none");
    exit();
}

function updateProfile($connection, $username, $firstName, $lastName, $barangay, $email) {
    $sql = "UPDATE administrator SET first_name = ?, last_name = ?, email = ? WHERE username = ?;";
    $stmt = $connection->prepare($sql);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../profile.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "ssss", $firstName, $lastName, $email, $username);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    header("location: ../profile.html?error=none");
    exit();
}

