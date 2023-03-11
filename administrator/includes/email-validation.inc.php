<?php
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';
    require_once 'sql.inc.php';
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $result = getUserData($connection, "person", "EMAIL", $email);

    if(!empty($result)) {
        echo(1);
    } else {
        echo(0);
    }
?>