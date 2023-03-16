<?php
require 'dbh.inc.php';
require 'functions.inc.php';
if(isset($_POST["reset-password-submit"])){

    $selector = $_POST["selector"];
    $validator = $_POST["validator"];
    $email = $_POST["email"];
    $password = $_POST["pwd"];
    $passwordRepeat = $_POST["pwd-repeat"];

    if(empty($password) || empty($passwordRepeat)){
        header("Location: ../create-new-password.html?error=empty&selector=" . $selector . "&validator=" . $validator . "&email=" . $email);
        exit();
    }
    else if($password != $passwordRepeat){
        header("Location: ../create-new-password.html?error=passwordcheck&selector=" . $selector . "&validator=" . $validator . "&email=" . $email);
        exit();
    }
    if(!validatePassword($password)) {
        header("Location: ../create-new-password.html?error=invalidpassword&selector=" . $selector . "&validator=" . $validator . "&email=" . $email);
        exit();
    }
    $sql = "SELECT * FROM user_account 
        JOIN person ON user_account.PERSON_ID = person.PERSON_ID
        WHERE EMAIL = '$email' OR USERNAME = '$email'";
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

    if($checkPassword){
        header("Location: ../create-new-password.html?error=useoldpassword&selector=" . $selector . "&validator=" . $validator . "&email=" . $email);
        exit();
    }

    $currentDate = date("U");

    $sql = "SELECT * FROM pwdReset WHERE pwdResetSelector =? AND pwdResetExpires >= ?";
    $stmt = mysqli_stmt_init($connection);
    if(!mysqli_stmt_prepare($stmt, $sql)){
        echo "There was an error!";
        exit();
    }
    else{
        mysqli_stmt_bind_param($stmt, "ss", $selector, $currentDate);
        mysqli_stmt_execute($stmt);

        $result = mysqli_stmt_get_result($stmt);
        if(!$row = mysqli_fetch_assoc($result)){
            echo "You need to resubmit your reset request.";
            exit();
        }
        else{
            $tokenBin = hex2bin($validator);
            $tokenCheck = password_verify($tokenBin, $row["pwdResetToken"]);

            if($tokenCheck === false){
                echo "You need to resubmit your reset request.";
                exit();
            }
            else if ($tokenCheck === true){
                $tokenEmail = $row['pwdResetEmail'];
                $sql = "SELECT * FROM user_account 
                JOIN person ON user_account.PERSON_ID = person.PERSON_ID
                WHERE person.EMAIL=?;";
                $stmt = mysqli_stmt_init($connection);
                if(!mysqli_stmt_prepare($stmt, $sql)){
                    echo "There was an error!";
                    exit();
                }
                else{
                    mysqli_stmt_bind_param($stmt, "s", $tokenEmail);
                    mysqli_stmt_execute($stmt);
                    $result = mysqli_stmt_get_result($stmt);
                    if(!$row = mysqli_fetch_assoc($result)){
                        echo "There was an error!";
                        exit();
                    }
                    else{
                        $sql = "UPDATE user_account 
                        JOIN person ON user_account.PERSON_ID = person.PERSON_ID
                        SET PASSWORD=? 
                        WHERE person.EMAIL=?;";
                        $stmt = mysqli_stmt_init($connection);
                        if(!mysqli_stmt_prepare($stmt, $sql)){
                            echo "There was an error!";
                            exit();
                        }
                        else{
                            $newPwdHash = password_hash($password, PASSWORD_DEFAULT);
                            mysqli_stmt_bind_param($stmt, "ss", $newPwdHash, $tokenEmail);
                            mysqli_stmt_execute($stmt);

                            $sql = "DELETE FROM pwdReset WHERE pwdResetEmail=?";
                            $stmt = mysqli_stmt_init($connection);
                            if(!mysqli_stmt_prepare($stmt, $sql)){
                                echo "There was an error!";
                                exit();
                            }
                            else{
                                $message =  "Your password has been successfully reset.<br><br>" .
                                            "Please log in to your account with your new password.<br>" .
                                            "If you have any further questions or concerns, please contact our support team.<br><br>" .
                                            "Thank you.";
                                mysqli_stmt_bind_param($stmt, "s", $tokenEmail);
                                mysqli_stmt_execute($stmt);
                                $loginCredentialsExists = loginCredentialsExists($connection, $tokenEmail, $tokenEmail);
                                updateLoginAttempt($connection, 0, $loginCredentialsExists['PERSON_ID']);
                                updateAccountStatus($connection, 0, $loginCredentialsExists['PERSON_ID']);
                                email("CSWDO Santa Rosa", "Reset Password Sucessfull", "populationmanagementsystem@gmail.com", "", $tokenEmail, $message);
                                header("Location: ../../login/citizen.html?newpwd=passwordupdated");
                            }
                        }
                    }
                }

            }
        }
    }
}
else{
    header ("Location: ../index.php");
}

?>