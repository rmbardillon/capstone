<?php

function getPWDData($connection) {
    $data = [];
    $username = $_SESSION['username'];
    $user_type = "PWD";
    $sql = "SELECT APPLICANT_TYPE, TRANSACTION_TYPE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, BARANGAY, ADDRESS, GENDER, MARITAL_STATUS, DATE_OF_BIRTH, PLACE_OF_BIRTH, EMAIL, TELEPHONE_NUMBER, RELIGION, JOB, HAS_PENSION, TYPE, AMOUNT 
    FROM person 
    JOIN name ON person.PERSON_ID = name.PERSON_ID 
    JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID 
    JOIN gender ON person.PERSON_ID = gender.PERSON_ID 
    JOIN marital_status ON person.PERSON_ID = marital_status.PERSON_ID 
    JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID 
    JOIN user_account ON person.PERSON_ID = user_account.PERSON_ID 
    JOIN telephone ON person.PERSON_ID = telephone.PERSON_ID 
    JOIN religion ON person.PERSON_ID = religion.PERSON_ID 
    JOIN job ON person.PERSON_ID = job.PERSON_ID 
    JOIN pension ON person.PERSON_ID = pension.PERSON_ID 
    JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID 
    JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID WHERE USERNAME = ? AND APPLICANT_TYPE = ?";
    $stmt = $connection->prepare($sql);

    if (!$stmt) {
        header("location: ../error.html?error=stmterror");
        exit();
    }
    $stmt->bind_param("ss", $username, $user_type);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0){
        while($row = $result->fetch_assoc()) {
            array_push($data, $row);
        }
        return $data;
    } else{
        return $data;
    }

    $stmt->close();
    $connection->close();

}

function getSoloParentData($connection) {
    $data = [];
    $username = $_SESSION['username'];
    $sql = "SELECT APPLICANT_TYPE, TRANSACTION_TYPE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, BARANGAY, ADDRESS, GENDER, DATE_OF_BIRTH, PLACE_OF_BIRTH, EMAIL, TELEPHONE_NUMBER, JOB, EDUCATIONAL_ATTAINMENT, COMPANY, MONTHLY_INCOME, TOTAL_FAMILY_INCOME, CLASSIFICATION_CIRCUMSTANCES, NEEDS_PROBLEMS, FAMILY_RESOURCES
    FROM person 
    JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
    JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
    JOIN gender ON person.PERSON_ID = gender.PERSON_ID AND gender.IS_DELETED = 'N'
    JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
    JOIN user_account ON person.PERSON_ID = user_account.PERSON_ID AND user_account.IS_DELETED = 'N'
    JOIN telephone ON person.PERSON_ID = telephone.PERSON_ID AND telephone.IS_DELETED = 'N'
    JOIN job ON person.PERSON_ID = job.PERSON_ID AND job.IS_DELETED = 'N'
    JOIN company ON person.PERSON_ID = company.PERSON_ID AND company.IS_DELETED = 'N'
    JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
    JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
    JOIN educational_attainment ON person.PERSON_ID = educational_attainment.PERSON_ID AND educational_attainment.IS_DELETED = 'N'
    JOIN income ON person.PERSON_ID = income.PERSON_ID AND income.IS_DELETED = 'N'
    JOIN solo_parent_long_text ON person.PERSON_ID = solo_parent_long_text.PERSON_ID AND solo_parent_long_text.IS_DELETED = 'N'
    WHERE USERNAME = ? AND APPLICANT_TYPE = 'Solo Parent' AND person.IS_DELETED = 'N';";
    $stmt = $connection->prepare($sql);

    if (!$stmt) {
        header("location: ../error.html?error=stmterror");
        exit();
    }
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0){
        while($row = $result->fetch_assoc()) {
            array_push($data, $row);
        }
        return $data;
    } else{
        return $data;
    }

    $stmt->close();
    $connection->close();

}

function getFamilyMemberData($connection) {
    $data = [];
    $userData = $_SESSION['userData'];
    $sql = "SELECT LAST_NAME AS CHILD_LAST_NAME, FIRST_NAME AS CHILD_FIRST_NAME, MIDDLE_NAME AS CHILD_MIDDLE_NAME, SUFFIX AS CHILD_SUFFIX, DATE_OF_BIRTH AS CHILD_DOB, MARITAL_STATUS AS FAMILY_MARITAL_STATUS, EDUCATIONAL_ATTAINMENT, MONTHLY_INCOME, RELATIONSHIP_TYPE
    FROM person
    JOIN name ON person.PERSON_ID = name.PERSON_ID
    JOIN relationship ON person.PERSON_ID = relationship.PERSON_ID
    JOIN marital_status ON person.PERSON_ID = marital_status.PERSON_ID
    JOIN educational_attainment ON person.PERSON_ID = educational_attainment.PERSON_ID
    JOIN income ON person.PERSON_ID = income.PERSON_ID
    WHERE relationship.RELATIONSHIP_TYPE = 'Family Member'
    AND relationship.APPLICANT_ID = ?
    AND person.IS_DELETED = 'N'
    AND name.IS_DELETED = 'N'
    AND educational_attainment.IS_DELETED = 'N'
    AND income.IS_DELETED = 'N'
    AND marital_status.IS_DELETED = 'N';";
    $stmt = $connection->prepare($sql);

    if (!$stmt) {
        header("location: ../error.html?error=stmterror");
        exit();
    }
    $stmt->bind_param("s", $userData['PERSON_ID']);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0){
        while($row = $result->fetch_assoc()) {
            array_push($data, $row);
        }
        return $data;
    } else{
        return $data;
    }

    $stmt->close();
    $connection->close();
}

function getSeniorCitizenData($connection) {
    $data = [];
    $username = $_SESSION['username'];
    $sql = "SELECT APPLICANT_TYPE, TRANSACTION_TYPE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, BARANGAY, ADDRESS, GENDER, MARITAL_STATUS, DATE_OF_BIRTH, PLACE_OF_BIRTH, EMAIL, TELEPHONE_NUMBER, RELIGION, JOB, HAS_PENSION, TYPE, AMOUNT 
    FROM person 
    JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
    JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
    JOIN gender ON person.PERSON_ID = gender.PERSON_ID AND gender.IS_DELETED = 'N'
    JOIN marital_status ON person.PERSON_ID = marital_status.PERSON_ID AND marital_status.IS_DELETED = 'N'
    JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
    JOIN user_account ON person.PERSON_ID = user_account.PERSON_ID AND user_account.IS_DELETED = 'N'
    JOIN telephone ON person.PERSON_ID = telephone.PERSON_ID AND telephone.IS_DELETED = 'N'
    JOIN religion ON person.PERSON_ID = religion.PERSON_ID AND religion.IS_DELETED = 'N'
    JOIN job ON person.PERSON_ID = job.PERSON_ID AND job.IS_DELETED = 'N'
    JOIN pension ON person.PERSON_ID = pension.PERSON_ID AND pension.IS_DELETED = 'N'
    JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
    JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
    WHERE USERNAME = ? AND APPLICANT_TYPE = 'Senior Citizen' AND person.IS_DELETED = 'N'";
    $stmt = $connection->prepare($sql);

    if (!$stmt) {
        header("location: ../error.html?error=stmterror");
        exit();
    }
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0){
        while($row = $result->fetch_assoc()) {
            array_push($data, $row);
        }
        return $data;
    } else{
        return $data;
    }

    $stmt->close();
    $connection->close();

}

function getSPouseData($connection) {
    $data = [];
    $userData = $_SESSION['userData'];
    $sql = "SELECT LAST_NAME AS SPOUSE_LAST_NAME, FIRST_NAME SPOUSE_FIRST_NAME, MIDDLE_NAME AS SPOUSE_MIDDLE_NAME , SUFFIX AS SPOUSE_SUFFIX, DATE_OF_BIRTH AS SPOUSE_DOB
    FROM person
    JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
    WHERE name.PERSON_ID = (SELECT PERSON_ID
    FROM relationship
    WHERE RELATIONSHIP_TYPE = 'Spouse' AND relationship.APPLICANT_ID = ?) AND person.IS_DELETED = 'N'";
    $stmt = $connection->prepare($sql);

    if (!$stmt) {
        header("location: ../error.html?error=stmterror");
        exit();
    }
    $stmt->bind_param("s", $userData['PERSON_ID']);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0){
        while($row = $result->fetch_assoc()) {
            array_push($data, $row);
        }
        return $data;
    } else{
        return $data;
    }

    $stmt->close();
    $connection->close();
}

function getChildrenData($connection) {
    $data = [];
    $userData = $_SESSION['userData'];
    $sql = "SELECT LAST_NAME AS CHILD_LAST_NAME, FIRST_NAME AS CHILD_FIRST_NAME, MIDDLE_NAME AS CHILD_MIDDLE_NAME, SUFFIX AS CHILD_SUFFIX, DATE_OF_BIRTH AS CHILD_DOB, TELEPHONE_NUMBER AS CHILD_TELEPHONE, BARANGAY, ADDRESS, RELATIONSHIP_TYPE
    FROM person
    JOIN name ON person.PERSON_ID = name.PERSON_ID
    JOIN relationship ON person.PERSON_ID = relationship.PERSON_ID
    JOIN telephone ON person.PERSON_ID = telephone.PERSON_ID
    JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
    JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID
    WHERE relationship.RELATIONSHIP_TYPE = 'Child'
    AND relationship.APPLICANT_ID = ?
    AND person.IS_DELETED = 'N'
    AND name.IS_DELETED = 'N'
    AND telephone.IS_DELETED = 'N'
    AND address.IS_DELETED = 'N';";
    $stmt = $connection->prepare($sql);

    if (!$stmt) {
        header("location: ../error.html?error=stmterror");
        exit();
    }
    $stmt->bind_param("s", $userData['PERSON_ID']);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0){
        while($row = $result->fetch_assoc()) {
            array_push($data, $row);
        }
        return $data;
    } else{
        return $data;
    }

    $stmt->close();
    $connection->close();
}