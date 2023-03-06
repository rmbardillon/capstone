<?php
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';
    require_once 'sql.inc.php';

    function checker($array, $key, $comparison) {
        foreach($array as $value) {
            if($value[$key] == $comparison) {
                return true;
            }
        }
        return false;
    }

    $formID = $_GET['form_name'];
    $applicantName = $_GET['applicant_name'];
    $applicationType = $_GET['applicant_type'];
    $drafts = getDrafts($connection);
    if(!empty($drafts)){
        if(checker($drafts, 'DRAFT_ID', $formID) == false) {
            insertDrafts($connection, $applicationType, $applicantName, $formID);
        }
    } else {
        insertDrafts($connection, $applicationType, $applicantName, $formID);
    }
    header("location: ../drafts.html");
    exit();
?>