<?php
require_once 'dbh.inc.php';
require_once 'functions.inc.php';
require_once 'sql.inc.php';

$username = $_POST['username'];
$password = $_POST['oldPassword'];
$userdata = loginCredentialsExists($connection, $username, $username);

$passwordhashed = $userdata['password'];
$checkPassword = password_verify($password, $passwordhashed);

if(!$checkPassword){
    echo json_encode("Wrong Old Password");
} else {
    echo json_encode("Correct Old Password");
}
?>
