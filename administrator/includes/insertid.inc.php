<?php 
    $current_date = date("Y-m-d");
    $expiration_date = date("Y-m-d", strtotime("+5 years"));
    $personId = $_POST['person_id'];
    $applicantType = $_POST['applicant_type'];
    $adminUsername = $_POST['admin_username'];
    require_once 'dbh.inc.php';
    require_once 'sql.inc.php';
    insertIssuedId($connection, $personId, $applicantType, $current_date, $expiration_date, $adminUsername);
?>