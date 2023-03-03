<?php 
    $current_date = date("Y-m-d");
    $personId = $_POST['person_id'];
    $applicantType = $_POST['applicant_type'];
    $adminUsername = $_POST['admin_username'];
    if($applicantType == "PWD") {
        $expiration_date = date("Y-m-d", strtotime("+5 years"));
    } else if($applicantType == "Solo Parent"){
        $expiration_date = date("Y-m-d", strtotime("+1 years"));
    } else {
        $expiration_date = NULL;
    }
    require_once 'dbh.inc.php';
    require_once 'sql.inc.php';
    insertIssuedId($connection, $personId, $applicantType, $current_date, $expiration_date, $adminUsername);
?>