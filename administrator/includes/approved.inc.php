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
    $status = "APPROVED";
    $sql = "UPDATE transaction_type SET STATUS=?,DATE_UPDATED=CURDATE(),UPDATED_BY=? WHERE PERSON_ID='$PERSON_ID'";
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

} else if (isset($_POST['pwdReject'])) {
    $PERSON_ID = $_POST['person_id'];
    $status = "REJECTED";
    $sql = "UPDATE transaction_type SET STATUS=?,DATE_UPDATED=CURDATE(),UPDATED_BY=? WHERE PERSON_ID='$PERSON_ID'";
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
} else if (isset($_POST['srCitizenApprove'])) {
    $PERSON_ID = $_POST['person_id'];
    $userData = getSeniorCitizenData($connection, $PERSON_ID);
    $id_number = $userData[0]['CITIZEN_ID'];
    $applicantType = $_POST['APPLICANT_TYPE'];
    $status = "APPROVED";
    $sql = "UPDATE transaction_type SET STATUS=?,DATE_UPDATED=CURDATE(),UPDATED_BY=? WHERE PERSON_ID='$PERSON_ID'";
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

} else if (isset($_POST['srCitizenReject'])) {
    $PERSON_ID = $_POST['person_id'];
    $status = "REJECTED";
    $sql = "UPDATE transaction_type SET STATUS=?,DATE_UPDATED=CURDATE(),UPDATED_BY=? WHERE PERSON_ID='$PERSON_ID'";
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
} else if (isset($_POST['soloParentApprove'])) {
    $PERSON_ID = $_POST['person_id'];
    $userData = getSoloParentData($connection, $PERSON_ID);
    $id_number = $userData[0]['CITIZEN_ID'];
    $applicantType = $_POST['APPLICANT_TYPE'];
    $status = "APPROVED";
    $sql = "UPDATE transaction_type SET STATUS=?,DATE_UPDATED=CURDATE(),UPDATED_BY=? WHERE PERSON_ID='$PERSON_ID'";
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
} else if (isset($_POST['soloParentReject'])) {
    $PERSON_ID = $_POST['person_id'];
    $status = "REJECTED";
    $sql = "UPDATE transaction_type SET STATUS=?,DATE_UPDATED=CURDATE(),UPDATED_BY=? WHERE PERSON_ID='$PERSON_ID'";
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
}

