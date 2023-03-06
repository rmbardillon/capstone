<?php
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';
    require_once 'sql.inc.php';

    $formID = $_GET['form_name'];
    $applicantName = $_GET['applicant_name'];
    $applicationType = $_GET['applicant_type'];
    insertDrafts($connection, $applicationType, $applicantName, $formID);
?>