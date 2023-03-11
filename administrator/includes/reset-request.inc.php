<?php
require_once 'dbh.inc.php';
require_once 'functions.inc.php';
function checkSecurityQuestions($connection, $email, $securityQuestion1, $securityQuestion2, $securityQuestion3, $securityAnswer1, $securityAnswer2, $securityAnswer3) {
    $sql = "SELECT id, security_questions.ADMINISTRATOR_ID, SECURITY_QUESTION_1, SECURITY_ANSWER_1, SECURITY_QUESTION_2, SECURITY_ANSWER_2, SECURITY_QUESTION_3, SECURITY_ANSWER_3
    FROM administrator
    JOIN security_questions ON administrator.id = security_questions.ADMINISTRATOR_ID
    WHERE email = ? AND SECURITY_QUESTION_1 = ? AND SECURITY_ANSWER_1 = ? AND SECURITY_QUESTION_2 = ? AND SECURITY_ANSWER_2 = ? AND SECURITY_QUESTION_3 = ? AND SECURITY_ANSWER_3 = ?";
    try {
        $stmt = $connection->prepare($sql);
        // Bind the values to the placeholders
        $stmt->bind_param("sssssss", $email, $securityQuestion1, $securityAnswer1, $securityQuestion2, $securityAnswer2, $securityQuestion3, $securityAnswer3);
        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0){
        return true;
    } else{
        return false;
    }

    $stmt->close();
    $connection->close();
}
if (isset($_POST["reset-request-submit"])){
    $userEmail = $_POST["email"];
    $securityQuestion1 = $_POST["security_question1"];
    $securityQuestion2 = $_POST["security_question2"];
    $securityQuestion3 = $_POST["security_question3"];
    $securityAnswer1 = $_POST["securityAnswer1"];
    $securityAnswer2 = $_POST["securityAnswer2"];
    $securityAnswer3 = $_POST["securityAnswer3"];
    if(!checkSecurityQuestions($connection, $userEmail, $securityQuestion1, $securityQuestion2, $securityQuestion3, $securityAnswer1, $securityAnswer2, $securityAnswer3)) {
        header("Location: ../forgot-password.html?error=securityquestions");
        exit();
    }
    
    $selector = bin2hex (random_bytes(8));
    $token = random_bytes(32);

    $url = "http://localhost/capstone/administrator/create-new-password.html?selector=" . $selector . "&validator=" . bin2hex($token) . "&email=" . $userEmail;

    $expires = date("U") + 1800;


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