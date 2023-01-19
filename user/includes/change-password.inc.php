<?php
    if(isset($_POST['change-password'])){
        $old_password = $_POST['old_password'];
        $new_password = $_POST['new_password'];
        $confirm_new_password = $_POST['confirm_new_password'];
        
        require_once 'dbh.inc.php';
        require_once 'functions.inc.php';

        changePassword($connection, $old_password, $new_password, $confirm_new_password);

    } else {
        header("Location: ../change-password.html?error=accessdenied");
        exit();
    }
?>