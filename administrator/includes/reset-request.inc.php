<?php

if (isset($_POST["reset-request-submit"])){

    $selector = bin2hex (random_bytes(8));
    $token = random_bytes(32);

    $url = "http://localhost/cswd/administrator/create-new-password.html?selector=" . $selector . "&validator=" . bin2hex($token);

    $expires = date("U") + 1800;

    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';

    $userEmail = $_POST["email"];

    $sql = "DELETE FROM pwdReset WHERE pwdResetEmail=?";
    $stmt = mysqli_stmt_init($connection);
    if(!mysqli_stmt_prepare($stmt, $sql)){
        echo "There was an error!";
        exit();
    }
    else{
        mysqli_stmt_bind_param($stmt, "s", $userEmail);
        mysqli_stmt_execute($stmt);
    }

    $sql = "INSERT INTO pwdReset (pwdResetEmail, pwdResetSelector, pwdResetToken, pwdResetExpires) 
    VALUES (?, ?, ?, ?);";
    $stmt = mysqli_stmt_init($connection);
    if(!mysqli_stmt_prepare($stmt, $sql)){
        echo "There was an error!";
        exit();
    }
    else{
        $hashedToken = password_hash($token, PASSWORD_DEFAULT);
        mysqli_stmt_bind_param($stmt, "ssss", $userEmail, $selector, $hashedToken, $expires);
        mysqli_stmt_execute($stmt);
    }

    mysqli_stmt_close($stmt);
    mysqli_close($connection);


    $subject = 'Reset your password for CSWDO Santa Rosa';

    $message = '<p>We received a password reset request. The link to reset your password is below. If you did not
    make this request, you can ignore this email</p>';
    $message .= '<p>Here is your password reset link: </br>';
    $message .= '<a href = " ' .$url . ' ">' . 'Reset Password' . '<a/></p>'; 

    $headers = "From: CSWDO Santa Rosa <populationmanagementsystem@gmail.com>\r\n";
    $headers .= "Reply-To: populationmanagementsystem@gmail.com\r\n";
    $headers .= "Content-Type: text/html\r\n";

    // mail($userEmail, $subject, $message, $headers);
    email("CSWDO Santa Rosa", $subject, "populationmanagementsystem@gmail.com", "", $userEmail, $message);

    header("Location: ../forgot-password.html?reset=success");

} else{
    header ("Location: ../index.html");
}