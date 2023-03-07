<?php
    require_once'functions.inc.php';
    require_once'sql.inc.php';
    require_once'dbh.inc.php';
    $applicationType = $_GET['application_type'];
    $personID = $_GET['person_id'];
    $event_id = $_GET['event_id'];
    if($applicationType == "PWD") {
        $applicationType = "PWD";
    } else if($applicationType == "seniorCitizen"){
        $applicationType = "Senior Citizen";
    } else {
        $applicationType = "Solo Parent";
    }
    insertClaimedBenefits($connection, $personID, $applicationType, $event_id);
?>