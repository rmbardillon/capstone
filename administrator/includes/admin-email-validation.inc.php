<?php
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';
    require_once 'sql.inc.php';
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $result = getUserData($connection, "administrator", "email", $email);

    if(!empty($result)) {
        echo(1); // Email already exists
    } else {
        echo(0); // Email does not exist
    }
?>