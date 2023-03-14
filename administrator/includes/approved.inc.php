<?php
    require_once'functions.inc.php';
    require_once'sql.inc.php';
    require_once'dbh.inc.php';
    session_start();
    if (isset($_POST['pwdSubmit'])) {
        $PERSON_ID = $_POST['person_id'];
        $userData = getPWDData($connection, $PERSON_ID);
        $id_number = $userData[0]['CITIZEN_ID'];
        $applicantType = $_POST['APPLICANT_TYPE'];
        $applicationType = $_POST['application_type'];
        $status = "APPROVED";
        $sql = "UPDATE transaction_type SET STATUS=?,DATE_UPDATED=NOW(),UPDATED_BY=? WHERE PERSON_ID='$PERSON_ID'";
        // Bind the values to the placeholders
        $stmt = $connection->prepare($sql);
        $stmt->bind_param("ss", $status, $_SESSION['admin-username']);
        // Execute the query
        if ($stmt->execute() === TRUE) {
            echo "Record updated successfully";
        } else {
            echo "Error updating record: " . $connection->error;
        }
        // Close the statement and the connection
        $stmt->close();
        if($applicationType == "renewal") {
            header("location: ../renewal-approved-requests.html?success=true");
            exit();
        } else {
            insertUserAccount($connection, $id_number, $applicantType, $PERSON_ID, $id_number);
        }

    } else if (isset($_POST['srCitizenApprove'])) {
        $PERSON_ID = $_POST['person_id'];
        $userData = getSeniorCitizenData($connection, $PERSON_ID);
        $id_number = $userData[0]['CITIZEN_ID'];
        $applicantType = $_POST['APPLICANT_TYPE'];
        $status = "APPROVED";
        $sql = "UPDATE transaction_type SET STATUS=?,DATE_UPDATED=NOW(),UPDATED_BY=? WHERE PERSON_ID='$PERSON_ID'";
        // Bind the values to the placeholders
        $stmt = $connection->prepare($sql);
        $stmt->bind_param("ss", $status, $_SESSION['admin-username']);
        // Execute the query
        if ($stmt->execute() === TRUE) {
            echo "Record updated successfully";
        } else {
            echo "Error updating record: " . $connection->error;
        }
        // Close the statement and the connection
        $stmt->close();
        insertUserAccount($connection, $id_number, $applicantType, $PERSON_ID, $id_number);

    } else if (isset($_POST['soloParentApprove'])) {
        $PERSON_ID = $_POST['person_id'];
        $userData = getSoloParentData($connection, $PERSON_ID);
        $id_number = $userData[0]['CITIZEN_ID'];
        $applicantType = $_POST['APPLICANT_TYPE'];
        $applicationType = $_POST['application_type'];
        $status = "APPROVED";
        $sql = "UPDATE transaction_type SET STATUS=?,DATE_UPDATED=NOW(),UPDATED_BY=? WHERE PERSON_ID='$PERSON_ID'";
        // Bind the values to the placeholders
        $stmt = $connection->prepare($sql);
        $stmt->bind_param("ss", $status, $_SESSION['admin-username']);
        // Execute the query
        if ($stmt->execute() === TRUE) {
            echo "Record updated successfully";
        } else {
            echo "Error updating record: " . $connection->error;
        }
        // Close the statement and the connection
        $stmt->close();
        if($applicationType == "renewal") {
            header("location: ../renewal-approved-requests.html?success=true");
            exit();
        } else {
            insertUserAccount($connection, $id_number, $applicantType, $PERSON_ID, $id_number);
        }
    } 

    if (isset($_POST['reject'])) {
        $PERSON_ID = $_POST['person_id'];
        $applicationType = $_POST['application_type'];
        $remarks = $_POST['reason'];
        $application_type = $_POST['applicationType'];
        $status = "REJECTED";
        $sql = "UPDATE transaction_type SET STATUS=?,REMARKS=?,DATE_UPDATED=NOW(),UPDATED_BY=? WHERE PERSON_ID='$PERSON_ID'";
        // Bind the values to the placeholders
        try {
            $stmt = $connection->prepare($sql);

            if (!$stmt) {
                $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
                header("location: ../error.html?error_message=" . urlencode($errorMessage));
                exit();
            }
        
        } catch (Exception $e) {
            $errorMessage =  "Error: " . $e->getMessage();
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
        $stmt->bind_param("sss", $status, $remarks, $_SESSION['admin-username']);
        // Execute the query
        if ($stmt->execute() === TRUE) {
            deleteUserData($connection, $PERSON_ID, $applicationType, $application_type);
        } else {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
        // Close the statement and the connection
        $stmt->close();
    }