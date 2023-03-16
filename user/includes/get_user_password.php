<?php
require_once 'dbh.inc.php';
require_once 'functions.inc.php';
require_once 'sql.inc.php';

$username = $_POST['username'];
$password = $_POST['oldPassword'];
$sql = "SELECT * FROM user_account 
        JOIN person ON user_account.PERSON_ID = person.PERSON_ID
        WHERE EMAIL = '$username' OR USERNAME = '$username'";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../index.html?error=stmterror");
        exit();
    }

    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        $passwordhashed = $row['PASSWORD'];
    } 
    else {
        $result = false;
    }

    mysqli_stmt_close($stmt);
        
    $checkPassword = password_verify($password, $passwordhashed);

    if(!$checkPassword){
        echo json_encode("Wrong Old Password");
    } else {
        echo json_encode("Correct Old Password");
    }

?>
