<?php
// GET CITIZEN COUNT
function getTotalCitizen($connection, $applicationType) {
    $sql = "SELECT COUNT(*) AS TOTAL_CITIZEN FROM applicant WHERE APPLICANT_TYPE = '$applicationType'";
    $result = mysqli_query($connection, $sql);
    $row = mysqli_fetch_assoc($result);
    return $row['TOTAL_CITIZEN'];
}

// GET PWD DATA
function getPWDData($connection, $personID) {
    $data = [];
    if(!empty($personID)) {
        $sql = "SELECT APPLICANT_TYPE, CITIZEN_ID, TRANSACTION_TYPE, REGION, CITY, PROVINCE, previous_address.BARANGAY, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, address.BARANGAY, ADDRESS, person_address.ADDRESS_ID, LANDLINE_NUMBER, telephone.TELEPHONE_NUMBER AS MOBILE_NUMBER, EMAIL, DATE_OF_BIRTH, RELIGION, BLOOD_TYPE, IS_ACTIVE_VOTER, IS_4PS_MEMBER, EMPLOYMENT_STATUS, CATEGORY_OF_EMPLOYMENT, NATURE_OF_EMPLOYMENT, JOB, OTHER_JOB, MONTHLY_INCOME, ORGANIZATION_AFFILIATED, CONTACT_PERSON, OFFICE_ADDRESS, organization.TELEPHONE_NUMBER, SSS_NUMBER, GSIS_NUMBER,PSN_NUMBER, IS_PHILHEALTH_MEMBER, PHILHEALTH_NUMBER, TYPE_OF_DISABILITY, MEDICAL_CONDITION, CAUSE_OF_DISABILITY, CONGENITAL_INBORN, ACQUIRED, STATUS_OF_DISABILITY, PWD_PHYSICIAN_NAME, PHYSICIAN_LICENSE_NUMBER, ACCOMPLISHED_BY, ACCOMPLISHER_NAME, transaction_type.DATE_UPDATED, STATUS
        FROM person 
        JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
        JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
        JOIN previous_address ON person.PERSON_ID = previous_address.PERSON_ID AND previous_address.IS_DELETED = 'N'
        JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
        JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
        JOIN landline ON person.PERSON_ID = landline.PERSON_ID AND landline.IS_DELETED = 'N'
        JOIN telephone ON person.PERSON_ID = telephone.PERSON_ID AND telephone.IS_DELETED = 'N'
        JOIN religion ON person.PERSON_ID = religion.PERSON_ID AND religion.IS_DELETED = 'N'
        JOIN blood_type ON person.PERSON_ID = blood_type.PERSON_ID AND blood_type.IS_DELETED = 'N'
        JOIN government_membership ON person.PERSON_ID = government_membership.PERSON_ID AND government_membership.IS_DELETED = 'N'
        JOIN employment_status ON person.PERSON_ID = employment_status.PERSON_ID AND employment_status.IS_DELETED = 'N'
        JOIN job ON person.PERSON_ID = job.PERSON_ID AND job.IS_DELETED = 'N'
        JOIN income ON person.PERSON_ID = income.PERSON_ID AND income.IS_DELETED = 'N'
        JOIN organization ON person.PERSON_ID = organization.PERSON_ID AND organization.IS_DELETED = 'N'
        JOIN id_reference_number ON person.PERSON_ID = id_reference_number.PERSON_ID AND id_reference_number.IS_DELETED = 'N'
        JOIN pwd_disease ON person.PERSON_ID = pwd_disease.PERSON_ID AND pwd_disease.IS_DELETED = 'N'
        JOIN pwd_physician ON person.PERSON_ID = pwd_physician.PERSON_ID AND pwd_physician.IS_DELETED = 'N'
        JOIN pwd_application_accomplisher ON person.PERSON_ID = pwd_application_accomplisher.PERSON_ID AND pwd_application_accomplisher.IS_DELETED = 'N'
        WHERE person.PERSON_ID = ? AND APPLICANT_TYPE = 'PWD' AND person.IS_DELETED = 'N'";
    } else {
        $sql = "SELECT APPLICANT_TYPE, TRANSACTION_TYPE, REGION, CITY, PROVINCE, previous_address.BARANGAY, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, address.BARANGAY, ADDRESS, LANDLINE_NUMBER, telephone.TELEPHONE_NUMBER, EMAIL, DATE_OF_BIRTH, RELIGION, BLOOD_TYPE, IS_ACTIVE_VOTER, IS_4PS_MEMBER, EMPLOYMENT_STATUS, CATEGORY_OF_EMPLOYMENT, NATURE_OF_EMPLOYMENT, JOB, MONTHLY_INCOME, ORGANIZATION_AFFILIATED, CONTACT_PERSON, OFFICE_ADDRESS, organization.TELEPHONE_NUMBER, SSS_NUMBER, GSIS_NUMBER,PSN_NUMBER, IS_PHILHEALTH_MEMBER, PHILHEALTH_NUMBER, TYPE_OF_DISABILITY, MEDICAL_CONDITION, CAUSE_OF_DISABILITY, CONGENITAL_INBORN, ACQUIRED, STATUS_OF_DISABILITY, PWD_PHYSICIAN_NAME, PHYSICIAN_LICENSE_NUMBER, ACCOMPLISHED_BY, ACCOMPLISHER_NAME, transaction_type.DATE_UPDATED, STATUS
        FROM person 
        JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
        JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
        JOIN previous_address ON person.PERSON_ID = previous_address.PERSON_ID AND previous_address.IS_DELETED = 'N'
        JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
        JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
        JOIN landline ON person.PERSON_ID = landline.PERSON_ID AND landline.IS_DELETED = 'N'
        JOIN telephone ON person.PERSON_ID = telephone.PERSON_ID AND telephone.IS_DELETED = 'N'
        JOIN user_account ON person.PERSON_ID = user_account.PERSON_ID AND user_account.IS_DELETED = 'N'
        JOIN religion ON person.PERSON_ID = religion.PERSON_ID AND religion.IS_DELETED = 'N'
        JOIN blood_type ON person.PERSON_ID = blood_type.PERSON_ID AND blood_type.IS_DELETED = 'N'
        JOIN government_membership ON person.PERSON_ID = government_membership.PERSON_ID AND government_membership.IS_DELETED = 'N'
        JOIN employment_status ON person.PERSON_ID = employment_status.PERSON_ID AND employment_status.IS_DELETED = 'N'
        JOIN job ON person.PERSON_ID = job.PERSON_ID AND job.IS_DELETED = 'N'
        JOIN income ON person.PERSON_ID = income.PERSON_ID AND income.IS_DELETED = 'N'
        JOIN organization ON person.PERSON_ID = organization.PERSON_ID AND organization.IS_DELETED = 'N'
        JOIN id_reference_number ON person.PERSON_ID = id_reference_number.PERSON_ID AND id_reference_number.IS_DELETED = 'N'
        JOIN pwd_disease ON person.PERSON_ID = pwd_disease.PERSON_ID AND pwd_disease.IS_DELETED = 'N'
        JOIN pwd_physician ON person.PERSON_ID = pwd_physician.PERSON_ID AND pwd_physician.IS_DELETED = 'N'
        JOIN pwd_application_accomplisher ON person.PERSON_ID = pwd_application_accomplisher.PERSON_ID AND pwd_application_accomplisher.IS_DELETED = 'N'
        WHERE APPLICANT_TYPE = 'PWD' AND person.IS_DELETED = 'N'";
    }
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
    if(!empty($personID)) {
        $stmt->bind_param("s", $personID);
    }
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

function getPWDGender($connection, $personID) {
    $data = [];
    $sql = "SELECT APPLICANT_TYPE, GENDER, MARITAL_STATUS, EDUCATIONAL_ATTAINMENT
    FROM person 
    JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
    JOIN gender ON person.PERSON_ID = gender.PERSON_ID AND gender.IS_DELETED = 'N'
    JOIN marital_status ON person.PERSON_ID = marital_status.PERSON_ID AND marital_status.IS_DELETED = 'N'
    JOIN educational_attainment ON person.PERSON_ID = educational_attainment.PERSON_ID AND educational_attainment.IS_DELETED = 'N'
    WHERE person.PERSON_ID = ? AND APPLICANT_TYPE = 'PWD' AND person.IS_DELETED = 'N'";

    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
    $stmt->bind_param("s", $personID);
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

function getFatherData($connection, $personID) {
    $data = [];
    $sql = "SELECT person.PERSON_ID, LAST_NAME, FIRST_NAME, MIDDLE_NAME, SUFFIX, RELATIONSHIP_TYPE
    FROM person
    JOIN name ON person.PERSON_ID = name.PERSON_ID
    JOIN relationship ON person.PERSON_ID = relationship.PERSON_ID
    WHERE relationship.RELATIONSHIP_TYPE = 'Father'
    AND relationship.APPLICANT_ID = ?
    AND person.IS_DELETED = 'N'
    AND name.IS_DELETED = 'N'";
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
    $stmt->bind_param("s", $personID);
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

function getMotherData($connection, $personID) {
    $data = [];
    $sql = "SELECT person.PERSON_ID, LAST_NAME, FIRST_NAME, MIDDLE_NAME, SUFFIX, RELATIONSHIP_TYPE
    FROM person
    JOIN name ON person.PERSON_ID = name.PERSON_ID
    JOIN relationship ON person.PERSON_ID = relationship.PERSON_ID
    WHERE relationship.RELATIONSHIP_TYPE = 'Mother'
    AND relationship.APPLICANT_ID = ?
    AND person.IS_DELETED = 'N'
    AND name.IS_DELETED = 'N'";
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
    $stmt->bind_param("s", $personID);
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

function getGuardianData($connection, $personID) {
    $data = [];
    $sql = "SELECT person.PERSON_ID, LAST_NAME, FIRST_NAME, MIDDLE_NAME, SUFFIX, RELATIONSHIP_TYPE, TELEPHONE_NUMBER
    FROM person
    JOIN name ON person.PERSON_ID = name.PERSON_ID
    JOIN relationship ON person.PERSON_ID = relationship.PERSON_ID
    JOIN telephone ON person.PERSON_ID = telephone.PERSON_ID
    WHERE relationship.RELATIONSHIP_TYPE = 'Guardian'
    AND relationship.APPLICANT_ID = ?
    AND person.IS_DELETED = 'N'
    AND name.IS_DELETED = 'N'";
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
    $stmt->bind_param("s", $personID);
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
// GET SOLO PARENT DATA
function getSoloParentData($connection, $personID) {
    $data = [];
    if(!empty($personID)) {
        $sql = "SELECT APPLICANT_TYPE, CITIZEN_ID, TRANSACTION_TYPE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, BARANGAY, ADDRESS,person_address.ADDRESS_ID, DATE_OF_BIRTH, PLACE_OF_BIRTH, EMAIL, TELEPHONE_NUMBER, JOB, COMPANY, MONTHLY_INCOME, TOTAL_FAMILY_INCOME, CLASSIFICATION_CIRCUMSTANCES, NEEDS_PROBLEMS, FAMILY_RESOURCES, transaction_type.DATE_UPDATED, STATUS
        FROM person 
        JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
        JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
        JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
        JOIN telephone ON person.PERSON_ID = telephone.PERSON_ID AND telephone.IS_DELETED = 'N'
        JOIN job ON person.PERSON_ID = job.PERSON_ID AND job.IS_DELETED = 'N'
        JOIN company ON person.PERSON_ID = company.PERSON_ID AND company.IS_DELETED = 'N'
        JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
        JOIN income ON person.PERSON_ID = income.PERSON_ID AND income.IS_DELETED = 'N'
        JOIN solo_parent_long_text ON person.PERSON_ID = solo_parent_long_text.PERSON_ID AND solo_parent_long_text.IS_DELETED = 'N'
        WHERE person.PERSON_ID = ? AND APPLICANT_TYPE = 'Solo Parent' AND person.IS_DELETED = 'N';";
    } else {
        $sql = "SELECT APPLICANT_TYPE, TRANSACTION_TYPE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, BARANGAY, ADDRESS, DATE_OF_BIRTH, PLACE_OF_BIRTH, EMAIL, TELEPHONE_NUMBER, JOB, COMPANY, MONTHLY_INCOME, TOTAL_FAMILY_INCOME, CLASSIFICATION_CIRCUMSTANCES, NEEDS_PROBLEMS, FAMILY_RESOURCES, transaction_type.DATE_UPDATED, STATUS
        FROM person 
        JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
        JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
        JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
        JOIN user_account ON person.PERSON_ID = user_account.PERSON_ID AND user_account.IS_DELETED = 'N'
        JOIN telephone ON person.PERSON_ID = telephone.PERSON_ID AND telephone.IS_DELETED = 'N'
        JOIN job ON person.PERSON_ID = job.PERSON_ID AND job.IS_DELETED = 'N'
        JOIN company ON person.PERSON_ID = company.PERSON_ID AND company.IS_DELETED = 'N'
        JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
        JOIN income ON person.PERSON_ID = income.PERSON_ID AND income.IS_DELETED = 'N'
        JOIN solo_parent_long_text ON person.PERSON_ID = solo_parent_long_text.PERSON_ID AND solo_parent_long_text.IS_DELETED = 'N'
        WHERE APPLICANT_TYPE = 'Solo Parent' AND person.IS_DELETED = 'N';";
    }
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
    if(!empty($personID)) {
        $stmt->bind_param("s", $personID);
    }
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

function getSoloParentGender($connection, $personID) {
    $data = [];
    $sql = "SELECT APPLICANT_TYPE, GENDER, EDUCATIONAL_ATTAINMENT
    FROM person 
    JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
    JOIN gender ON person.PERSON_ID = gender.PERSON_ID AND gender.IS_DELETED = 'N'
    JOIN educational_attainment ON person.PERSON_ID = educational_attainment.PERSON_ID AND educational_attainment.IS_DELETED = 'N'
    WHERE person.PERSON_ID = ? AND APPLICANT_TYPE = 'Solo Parent' AND person.IS_DELETED = 'N'";

    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
    $stmt->bind_param("s", $personID);
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

function getFamilyMemberData($connection, $personID) {
    $data = [];
    $sql = "SELECT person.PERSON_ID, LAST_NAME AS CHILD_LAST_NAME, FIRST_NAME AS CHILD_FIRST_NAME, MIDDLE_NAME AS CHILD_MIDDLE_NAME, SUFFIX AS CHILD_SUFFIX, DATE_OF_BIRTH AS CHILD_DOB, MARITAL_STATUS AS FAMILY_MARITAL_STATUS, EDUCATIONAL_ATTAINMENT, MONTHLY_INCOME, RELATIONSHIP_TYPE, JOB, OTHER_JOB
    FROM person
    JOIN name ON person.PERSON_ID = name.PERSON_ID
    JOIN relationship ON person.PERSON_ID = relationship.PERSON_ID
    JOIN marital_status ON person.PERSON_ID = marital_status.PERSON_ID
    JOIN educational_attainment ON person.PERSON_ID = educational_attainment.PERSON_ID
    JOIN job ON person.PERSON_ID = job.PERSON_ID
    JOIN income ON person.PERSON_ID = income.PERSON_ID
    WHERE (relationship.RELATIONSHIP_TYPE = 'Son' OR relationship.RELATIONSHIP_TYPE = 'Daughter')
    AND relationship.APPLICANT_ID = ?
    AND person.IS_DELETED = 'N'
    AND name.IS_DELETED = 'N'
    AND educational_attainment.IS_DELETED = 'N'
    AND income.IS_DELETED = 'N'
    AND marital_status.IS_DELETED = 'N'
    LIMIT 5;";
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
    $stmt->bind_param("s", $personID);
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
// GET SR CITIZEN DATA
function getSeniorCitizenData($connection, $personId) {
    $data = [];
    if(!empty($personId)) {
        $sql = "SELECT APPLICANT_TYPE, CITIZEN_ID, ID_NUMBER, TRANSACTION_TYPE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, BARANGAY, ADDRESS, DATE_OF_BIRTH, PLACE_OF_BIRTH, EMAIL, TELEPHONE_NUMBER, RELIGION, JOB, HAS_PENSION, TYPE, AMOUNT, STATUS, transaction_type.DATE_UPDATED
        FROM person 
        JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
        JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
        JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
        JOIN telephone ON person.PERSON_ID = telephone.PERSON_ID AND telephone.IS_DELETED = 'N'
        JOIN religion ON person.PERSON_ID = religion.PERSON_ID AND religion.IS_DELETED = 'N'
        JOIN job ON person.PERSON_ID = job.PERSON_ID AND job.IS_DELETED = 'N'
        JOIN pension ON person.PERSON_ID = pension.PERSON_ID AND pension.IS_DELETED = 'N'
        JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
        WHERE person.PERSON_ID = ? AND APPLICANT_TYPE = 'Senior Citizen' AND person.IS_DELETED = 'N'";
    } else {
        $sql = "SELECT APPLICANT_TYPE, TRANSACTION_TYPE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, BARANGAY, ADDRESS, DATE_OF_BIRTH, PLACE_OF_BIRTH, EMAIL, TELEPHONE_NUMBER, RELIGION, JOB, HAS_PENSION, TYPE, AMOUNT, STATUS, transaction_type.DATE_UPDATED
        FROM person 
        JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
        JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
        JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
        JOIN user_account ON person.PERSON_ID = user_account.PERSON_ID AND user_account.IS_DELETED = 'N'
        JOIN telephone ON person.PERSON_ID = telephone.PERSON_ID AND telephone.IS_DELETED = 'N'
        JOIN religion ON person.PERSON_ID = religion.PERSON_ID AND religion.IS_DELETED = 'N'
        JOIN job ON person.PERSON_ID = job.PERSON_ID AND job.IS_DELETED = 'N'
        JOIN pension ON person.PERSON_ID = pension.PERSON_ID AND pension.IS_DELETED = 'N'
        JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
        WHERE APPLICANT_TYPE = 'Senior Citizen' AND person.IS_DELETED = 'N'";
    }
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
    if(!empty($personId)) {
        $stmt->bind_param("s", $personId);
    }
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

function getSeniorCitizenGender($connection, $personId) {
    $data = [];
    $sql = "SELECT APPLICANT_TYPE, GENDER, MARITAL_STATUS
    FROM person 
    JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
    JOIN marital_status ON person.PERSON_ID = marital_status.PERSON_ID AND marital_status.IS_DELETED = 'N'
    JOIN gender ON person.PERSON_ID = gender.PERSON_ID AND gender.IS_DELETED = 'N'
    WHERE person.PERSON_ID = ? AND APPLICANT_TYPE = 'Senior Citizen' AND person.IS_DELETED = 'N'";

    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
    $stmt->bind_param("s", $personId);
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

function getSPouseData($connection, $personID) {
    $data = [];
    $sql = "SELECT LAST_NAME AS SPOUSE_LAST_NAME, FIRST_NAME SPOUSE_FIRST_NAME, MIDDLE_NAME AS SPOUSE_MIDDLE_NAME , SUFFIX AS SPOUSE_SUFFIX, DATE_OF_BIRTH AS SPOUSE_DOB
    FROM person
    JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
    WHERE name.PERSON_ID = (SELECT PERSON_ID
    FROM relationship
    WHERE RELATIONSHIP_TYPE = 'Spouse' AND relationship.APPLICANT_ID = ?) AND person.IS_DELETED = 'N'";
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
    $stmt->bind_param("s", $personID);
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

function getChildrenData($connection, $personID) {
    $data = [];
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
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
    $stmt->bind_param("s", $personID);
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

// GET APPLICATIONS
function getPWDStatus($connection, $status, $barangay) {
    $data = [];
    if(!empty($barangay)) {
        $sql = "SELECT person.PERSON_ID, applicant.APPLICANT_TYPE, CONCAT(LAST_NAME, ' ', CASE WHEN SUFFIX IS NOT NULL THEN CONCAT(' ', SUFFIX) ELSE '' END, FIRST_NAME,' ',
              CASE WHEN MIDDLE_NAME IS NOT NULL THEN CONCAT(LEFT(MIDDLE_NAME, 1), '. ') ELSE '' END) AS NAME, address.BARANGAY, ADDRESS, DATE_OF_BIRTH, STATUS, transaction_type.DATE_UPDATED, transaction_type.UPDATED_BY
        FROM person 
        JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
        JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
        JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
        JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
        WHERE applicant.APPLICANT_TYPE = 'PWD' AND STATUS = '$status' AND (address.BARANGAY = '$barangay' OR '$barangay' = 'City Hall') AND person.IS_DELETED = 'N'";
    } else {
        $sql = "SELECT person.PERSON_ID, applicant.APPLICANT_TYPE, CONCAT(LAST_NAME, ' ', CASE WHEN SUFFIX IS NOT NULL THEN CONCAT(' ', SUFFIX) ELSE '' END, FIRST_NAME,' ',
              CASE WHEN MIDDLE_NAME IS NOT NULL THEN CONCAT(LEFT(MIDDLE_NAME, 1), '. ') ELSE '' END) AS NAME, address.BARANGAY, ADDRESS, DATE_OF_BIRTH, STATUS, transaction_type.DATE_UPDATED, transaction_type.UPDATED_BY
        FROM person 
        JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
        JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
        JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
        JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
        WHERE applicant.APPLICANT_TYPE = 'PWD' AND STATUS = '$status' AND person.IS_DELETED = 'N'";
    }
    
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
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

function getSoloParentStatus($connection, $status, $barangay) {
    $data = [];
    if(!empty($barangay)) {
        $sql = "SELECT person.PERSON_ID, APPLICANT_TYPE, CONCAT(LAST_NAME, ' ', CASE WHEN SUFFIX IS NOT NULL THEN CONCAT(' ', SUFFIX) ELSE '' END, FIRST_NAME,' ',
              CASE WHEN MIDDLE_NAME IS NOT NULL THEN CONCAT(LEFT(MIDDLE_NAME, 1), '. ') ELSE '' END) AS NAME, address.BARANGAY, ADDRESS, DATE_OF_BIRTH, STATUS, transaction_type.DATE_UPDATED, transaction_type.UPDATED_BY
        FROM person 
        JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
        JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
        JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
        JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
        WHERE APPLICANT_TYPE = 'Solo Parent' AND STATUS = '$status' AND (address.BARANGAY = '$barangay' OR '$barangay' = 'City Hall') AND person.IS_DELETED = 'N'";
    } else {
        $sql = "SELECT person.PERSON_ID, applicant.APPLICANT_TYPE, CONCAT(LAST_NAME, ' ', CASE WHEN SUFFIX IS NOT NULL THEN CONCAT(' ', SUFFIX) ELSE '' END, FIRST_NAME,' ',
              CASE WHEN MIDDLE_NAME IS NOT NULL THEN CONCAT(LEFT(MIDDLE_NAME, 1), '. ') ELSE '' END) AS NAME, address.BARANGAY, ADDRESS, DATE_OF_BIRTH, STATUS, transaction_type.DATE_UPDATED, transaction_type.UPDATED_BY
        FROM person 
        JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
        JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
        JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
        JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
        WHERE applicant.APPLICANT_TYPE = 'Solo Parent' AND STATUS = '$status' AND person.IS_DELETED = 'N'";
    }
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
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

function getSeniorCitizenStatus($connection, $status, $barangay) {
    $data = [];
    if(!empty($barangay)) {
        $sql = "SELECT person.PERSON_ID, APPLICANT_TYPE, CONCAT(LAST_NAME, ' ', CASE WHEN SUFFIX IS NOT NULL THEN CONCAT(' ', SUFFIX) ELSE '' END, FIRST_NAME,' ',
              CASE WHEN MIDDLE_NAME IS NOT NULL THEN CONCAT(LEFT(MIDDLE_NAME, 1), '. ') ELSE '' END) AS NAME, address.BARANGAY, ADDRESS, DATE_OF_BIRTH, STATUS, transaction_type.DATE_UPDATED, transaction_type.UPDATED_BY
        FROM person 
        JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
        JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
        JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
        JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
        WHERE APPLICANT_TYPE = 'Senior Citizen' AND STATUS = '$status' AND (address.BARANGAY = '$barangay' OR '$barangay' = 'City Hall') AND person.IS_DELETED = 'N'";
    } else {
        $sql = "SELECT person.PERSON_ID, APPLICANT_TYPE, CONCAT(LAST_NAME, ' ', CASE WHEN SUFFIX IS NOT NULL THEN CONCAT(' ', SUFFIX) ELSE '' END, FIRST_NAME,' ',
              CASE WHEN MIDDLE_NAME IS NOT NULL THEN CONCAT(LEFT(MIDDLE_NAME, 1), '. ') ELSE '' END) AS NAME, address.BARANGAY, ADDRESS, DATE_OF_BIRTH, STATUS, transaction_type.DATE_UPDATED, transaction_type.UPDATED_BY
        FROM person 
        JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
        JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
        JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
        JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
        WHERE APPLICANT_TYPE = 'Senior Citizen' AND STATUS = '$status' AND person.IS_DELETED = 'N'";
    }
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
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

// Insert Files
function uploadFile($connection, $file, $personId, $docType) {
    $fileName = $file['name'];
    $fileTmpName = $file['tmp_name'];
    $fileType = $file['type'];
    $fileSize = $file['size'];
    $fileError = $file['error'];

    // Check if file was uploaded successfully
    if ($fileError === UPLOAD_ERR_OK) {
        // Create a unique name for the file
        $newFileName = $docType . uniqid('', true) . '.' . pathinfo($fileName, PATHINFO_EXTENSION);

        // Move the file to the documents folder
        $uploadPath = '../../administrator/documents/' . $newFileName;
        if (move_uploaded_file($fileTmpName, $uploadPath)) {
            // Prepare the SQL query
            global $isDeleted;
            global $getActiveUser;
            $stmt = $connection->prepare("INSERT INTO document (DOCUMENT_ID, PERSON_ID, LOCATION, NAME, TYPE, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), '$personId', '$uploadPath', '$newFileName', '$fileType', '$getActiveUser')");
            // Execute the query
            if(!$stmt->execute() === TRUE){
                $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
                header("location: ../error.html?error_message=" . urlencode($errorMessage));
                exit();
            }

            // Close the statement
            $stmt->close();

            // Return the file name
            return $newFileName;
        } else {
            // Return an error message
            return 'Error uploading file';
        }
    } else {
        // Return an error message
        return 'Error uploading file';
    }
}

// GET FILES
function getFiles($connection, $personID) {
    $data = [];
    $sql = "SELECT *
    FROM document
    WHERE PERSON_ID = ? AND IS_DELETED = 'N' ORDER BY NAME";
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
    $stmt->bind_param("s", $personID);
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

// GET ID INFORMATION
function getIDInformation($connection, $personID) {
    $data = [];
    $sql = "SELECT person.PERSON_ID, DATE_ISSUED, EXPIRATION_DATE
    FROM person 
    JOIN issued_id ON person.PERSON_ID = issued_id.PERSON_ID AND issued_id.IS_DELETED = 'N'
    WHERE person.PERSON_ID = '$personID' AND person.IS_DELETED = 'N'";    
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
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
// GET APPLICATIONS PER BARANGAY
function getPWDPerBarangay($connection, $barangay) {
    $data = [];
    if(!empty($barangay)) {
        $sql = "SELECT person.PERSON_ID, APPLICANT_TYPE, CONCAT(LAST_NAME, ' ', CASE WHEN SUFFIX IS NOT NULL THEN CONCAT(' ', SUFFIX) ELSE '' END, FIRST_NAME,' ',
              CASE WHEN MIDDLE_NAME IS NOT NULL THEN CONCAT(LEFT(MIDDLE_NAME, 1), '. ') ELSE '' END) AS NAME, address.BARANGAY, ADDRESS, DATE_OF_BIRTH, STATUS, transaction_type.DATE_UPDATED
        FROM person 
        JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
        JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
        JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
        JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
        WHERE APPLICANT_TYPE = 'PWD' AND (address.BARANGAY = '$barangay' OR '$barangay' = 'City Hall') AND person.IS_DELETED = 'N'";
    } else {
        $sql = "SELECT person.PERSON_ID, APPLICANT_TYPE, CONCAT(LAST_NAME, ' ', CASE WHEN SUFFIX IS NOT NULL THEN CONCAT(' ', SUFFIX) ELSE '' END, FIRST_NAME,' ',
              CASE WHEN MIDDLE_NAME IS NOT NULL THEN CONCAT(LEFT(MIDDLE_NAME, 1), '. ') ELSE '' END) AS NAME, address.BARANGAY, ADDRESS, DATE_OF_BIRTH, STATUS, transaction_type.DATE_UPDATED
        FROM person 
        JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
        JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
        JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
        JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
        WHERE APPLICANT_TYPE = 'PWD' AND person.IS_DELETED = 'N'";
    }
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
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

function getSoloParentPerBarangay($connection, $barangay) {
    $data = [];
    if(!empty($barangay)) {
        $sql = "SELECT person.PERSON_ID, APPLICANT_TYPE, CONCAT(LAST_NAME, ' ', CASE WHEN SUFFIX IS NOT NULL THEN CONCAT(' ', SUFFIX) ELSE '' END, FIRST_NAME,' ',
              CASE WHEN MIDDLE_NAME IS NOT NULL THEN CONCAT(LEFT(MIDDLE_NAME, 1), '. ') ELSE '' END) AS NAME, address.BARANGAY, ADDRESS, DATE_OF_BIRTH, STATUS, transaction_type.DATE_UPDATED
        FROM person 
        JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
        JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
        JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
        JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
        WHERE APPLICANT_TYPE = 'Solo Parent' AND (address.BARANGAY = '$barangay' OR '$barangay' = 'City Hall') AND person.IS_DELETED = 'N'";
    } else {
        $sql = "SELECT person.PERSON_ID, APPLICANT_TYPE, CONCAT(LAST_NAME, ' ', CASE WHEN SUFFIX IS NOT NULL THEN CONCAT(' ', SUFFIX) ELSE '' END, FIRST_NAME,' ',
              CASE WHEN MIDDLE_NAME IS NOT NULL THEN CONCAT(LEFT(MIDDLE_NAME, 1), '. ') ELSE '' END) AS NAME, address.BARANGAY, ADDRESS, DATE_OF_BIRTH, STATUS, transaction_type.DATE_UPDATED
        FROM person 
        JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
        JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
        JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
        JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
        WHERE APPLICANT_TYPE = 'Solo Parent' AND person.IS_DELETED = 'N'";
    }
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
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

function getSeniorCitizenPerBarangay($connection, $barangay) {
    $data = [];
    if(!empty($barangay)) {
        $sql = "SELECT person.PERSON_ID, APPLICANT_TYPE, CONCAT(LAST_NAME, ' ', CASE WHEN SUFFIX IS NOT NULL THEN CONCAT(' ', SUFFIX) ELSE '' END, FIRST_NAME,' ',
              CASE WHEN MIDDLE_NAME IS NOT NULL THEN CONCAT(LEFT(MIDDLE_NAME, 1), '. ') ELSE '' END) AS NAME, address.BARANGAY, ADDRESS, DATE_OF_BIRTH, STATUS, transaction_type.DATE_UPDATED
        FROM person 
        JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
        JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
        JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
        JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
        WHERE APPLICANT_TYPE = 'Senior Citizen' AND (address.BARANGAY = '$barangay' OR '$barangay' = 'City Hall') AND person.IS_DELETED = 'N'";
    } else {
        $sql = "SELECT person.PERSON_ID, APPLICANT_TYPE, CONCAT(LAST_NAME, ' ', CASE WHEN SUFFIX IS NOT NULL THEN CONCAT(' ', SUFFIX) ELSE '' END, FIRST_NAME,' ',
              CASE WHEN MIDDLE_NAME IS NOT NULL THEN CONCAT(LEFT(MIDDLE_NAME, 1), '. ') ELSE '' END) AS NAME, address.BARANGAY, ADDRESS, DATE_OF_BIRTH, STATUS, transaction_type.DATE_UPDATED
        FROM person 
        JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
        JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
        JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
        JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
        WHERE APPLICANT_TYPE = 'Senior Citizen' AND person.IS_DELETED = 'N'";
    }
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
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

// GET EVENTS PER BARANGAY
function getEvents($connection, $event_id, $for, $barangay) {
    $data = [];
    if(!empty($barangay)) {
        $sql = "SELECT * FROM announcement WHERE (BARANGAY = '$barangay' OR BARANGAY = 'All') AND (ANNOUNCEMENT_FOR = '$for' OR ANNOUNCEMENT_FOR = 'All')";
    } else {
        $sql = "SELECT * FROM announcement WHERE ANNOUNCEMENT_ID = '$event_id'";
    }
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
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

function getEventsPer($connection, $event_id, $for, $barangay) {
    $data = [];
    $sql = "SELECT FIRST_NAME,MIDDLE_NAME,LAST_NAME,SUFFIX,BARANGAY,APPLICANT_TYPE,person.PERSON_ID,applicant.CITIZEN_ID,claimed_benefits.STATUS_OF_CLAIMS, STATUS
            FROM PERSON 
            JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
            JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
            JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
            JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
            JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
            LEFT JOIN claimed_benefits ON person.PERSON_ID = claimed_benefits.PERSON_ID
            WHERE
            STATUS = 'APPROVED' AND
            (BARANGAY = '$barangay' OR '$barangay' = 'All') AND 
            (APPLICANT_TYPE = '$for' OR '$for' = 'All') AND 
            ('$barangay' = 'All' OR ('$for' != 'PWD' AND '$for' != 'Senior citizen' AND '$for' != 'Solo parent') OR (BARANGAY = 'All' AND ('$for' = 'PWD' OR '$for' = 'Senior citizen' OR '$for' = 'Solo parent')));";
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
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

// GET APPLICANT DATA
function getApplicantData($connection, $username, $userType) {
    $data = [];
    $username = $_SESSION['username'];
    $sql = "SELECT p.PERSON_ID, a.APPLICANT_TYPE, t.TRANSACTION_TYPE, n.FIRST_NAME, n.MIDDLE_NAME, n.LAST_NAME, n.SUFFIX, ad.BARANGAY, ad.ADDRESS, p.EMAIL, p.DATE_OF_BIRTH, t.DATE_UPDATED, t.UPDATED_BY, t.STATUS, i.EXPIRATION_DATE
    FROM person p
    JOIN applicant a ON p.PERSON_ID = a.APPLICANT_ID
    LEFT JOIN issued_id i ON p.PERSON_ID = i.PERSON_ID
    LEFT JOIN (
    SELECT PERSON_ID, MAX(EXPIRATION_DATE) AS MAX_EXPIRATION_DATE
    FROM issued_id
    GROUP BY PERSON_ID
    ) i2 ON i.PERSON_ID = i2.PERSON_ID AND i.EXPIRATION_DATE = i2.MAX_EXPIRATION_DATE
    JOIN transaction_type t ON p.PERSON_ID = t.PERSON_ID AND t.IS_DELETED = 'N'
    JOIN name n ON p.PERSON_ID = n.PERSON_ID AND n.IS_DELETED = 'N'
    JOIN person_address pa ON p.PERSON_ID = pa.PERSON_ID
    JOIN address ad ON pa.ADDRESS_ID = ad.ADDRESS_ID AND ad.IS_DELETED = 'N'
    JOIN user_account u ON p.PERSON_ID = u.PERSON_ID AND u.IS_DELETED = 'N'
    WHERE u.USERNAME = ? AND a.APPLICANT_TYPE = ? AND p.IS_DELETED = 'N'
    ";
    $stmt = $connection->prepare($sql);

    if (!$stmt) {
        header("location: ../error.html?error=stmterror");
        exit();
    }
    $stmt->bind_param("ss", $username, $userType);
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

// Get Print ID
function getPrintID($connection, $type) {
    $data = [];
    $sql = "SELECT transaction_type.PERSON_ID, CONCAT(FIRST_NAME, ' ', LAST_NAME) AS NAME, APPLICANT_TYPE 
    FROM transaction_type 
    JOIN name ON transaction_type.PERSON_ID = name.PERSON_ID
    JOIN applicant ON transaction_type.PERSON_ID = applicant.APPLICANT_ID
    WHERE transaction_type IN ('New Application', 'NEW ID', 'BAGO') AND APPLICANT_TYPE = '$type' AND STATUS = 'APPROVED' AND transaction_type.IS_DELETED = 'N';";
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
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

function getIDData($connection, $person_id) {
    $data = [];
    $sql = "SELECT transaction_type.PERSON_ID, CONCAT(FIRST_NAME, ' ', MIDDLE_NAME, ' ', LAST_NAME) AS NAME, APPLICANT_TYPE, USERNAME
    FROM transaction_type 
    JOIN name ON transaction_type.PERSON_ID = name.PERSON_ID
    JOIN applicant ON transaction_type.PERSON_ID = applicant.APPLICANT_ID
    JOIN user_account ON transaction_type.PERSON_ID = user_account.PERSON_ID
    WHERE transaction_type IN ('New Application', 'NEW ID', 'BAGO') AND transaction_type.PERSON_ID = '$person_id' AND STATUS = 'APPROVED' AND transaction_type.IS_DELETED = 'N';";
    
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
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

// Get Remarks
function getRemarks($connection, $person_id) {
    $data = [];
    $sql = "SELECT REMARKS
    FROM transaction_type 
    WHERE PERSON_ID='$person_id' AND IS_DELETED = 'N';";
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
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

// GET DRAFTS
function getDrafts($connection, $barangay, $administratorType) {
    $data = [];
    if (!empty($barangay)) {
        $sql = "SELECT * FROM draft WHERE IS_DELETED = 'N' AND (APPLICANT_BARANGAY = '$barangay' OR '$barangay' = 'City Hall') AND (APPLICATION_TYPE = '$administratorType' OR '$administratorType' = 'Main');";
    } else {
        $sql = "SELECT * FROM draft WHERE IS_DELETED = 'N';";
    }
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
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

// Get Security Questions
function getSecurityQuestions($connection, $person_id) {
    $data = [];
    $sql = "SELECT *
    FROM security_questions 
    WHERE PERSON_ID='$person_id';";
    try {
        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
    
    } catch (Exception $e) {
        $errorMessage =  "Error: " . $e->getMessage();
        header("location: error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
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

// Inserting User Data

$isDeleted =  'N';
if (isset($_SESSION['admin-data'])) {
    $getActiveUser = $_SESSION['admin-data']['username'];
}

function generateUUID() {
    $uuid = sprintf( '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
            mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ),
            mt_rand( 0, 0xffff ),
            mt_rand( 0, 0x0fff ) | 0x4000,
            mt_rand( 0, 0x3fff ) | 0x8000,
            mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff )
        );
    $output = substr(str_replace("-","",$uuid),0,16);
    return $output;
}

function generateSrID() {
    $numbers = array();
    while (count($numbers) < 6) {
        $random = mt_rand(1, 999999);
        if (!in_array($random, $numbers)) {
            $numbers[] = $random;
        }
    }
    return $numbers;
}

function generateSoloParentID() {
    $numbers = array();
    while (count($numbers) < 5) {
        $random = mt_rand(1, 99999);
        if (!in_array($random, $numbers)) {
            $numbers[] = $random;
        }
    }
    return $numbers;
}

function generatePWDID() {
    $numbers = array();
    while (count($numbers) < 4) {
        $random = mt_rand(1, 9999);
        if (!in_array($random, $numbers)) {
            $numbers[] = $random;
        }
    }
    return $numbers;
}

function generateRandomPassword() {
    $uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    $lowercase = "abcdefghijklmnopqrstuvwxyz";
    $numbers = "0123456789";
    $symbols = "!@$%^&*()_+-={}[]|\\:;\"'<>,.?/";
    $all = $uppercase . $lowercase . $numbers . $symbols;
    $password = "";
    $password .= substr($uppercase, rand(0, strlen($uppercase) - 1), 1);
    $password .= substr($lowercase, rand(0, strlen($lowercase) - 1), 1);
    $password .= substr($numbers, rand(0, strlen($numbers) - 1), 1);
    $password .= substr($symbols, rand(0, strlen($symbols) - 1), 1);
    for ($i = 0; $i < 4; $i++) {
        $password .= substr($all, rand(0, strlen($all) - 1), 1);
    }
    return $password;
}

function insertPerson($connection, $personId, $dateOfBirth, $email) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO person (PERSON_ID, DATE_OF_BIRTH, EMAIL, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES ('$personId', ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $dateOfBirth, $email);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

function insertApplicant($connection, $applicantId, $applicantType, $citizenId, $placeOfBirth, $formControlNumber) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO applicant (APPLICANT_ID, FORM_CONTROL_NUMBER, APPLICANT_TYPE, CITIZEN_ID, PLACE_OF_BIRTH) VALUES (?, ?, ?, ?, ?)");

    // Bind the values to the placeholders
    $stmt->bind_param("sssss", $applicantId, $formControlNumber, $applicantType, $citizenId, $placeOfBirth);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertAddress($connection, $barangayId, $barangay, $address) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO address (ADDRESS_ID, BARANGAY, ADDRESS, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES ('$barangayId', ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $barangay, $address);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertPersonAddress($connection, $personId, $addressId) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO person_address (PERSON_ADDRESS_ID, PERSON_ID, ADDRESS_ID) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?)");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $addressId);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertBloodType($connection, $personId, $bloodType) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO blood_type (BLOOD_TYPE_ID, PERSON_ID, BLOOD_TYPE, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $bloodType);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertCompany($connection, $personId, $company) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO company (COMPANY_ID, PERSON_ID, COMPANY, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $company);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertEducationalAttainment($connection, $personId, $educationalAttainment) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO educational_attainment (EDUCATIONAL_ATTAINMENT_ID, PERSON_ID, EDUCATIONAL_ATTAINMENT, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $educationalAttainment);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertEmploymentStatus($connection, $personId, $employmentStatus, $categoryOfEmployment, $natureOfEmployment) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO employment_status (EMPLOYMENT_STATUS_ID, PERSON_ID, EMPLOYMENT_STATUS, CATEGORY_OF_EMPLOYMENT, NATURE_OF_EMPLOYMENT, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ssss", $personId, $employmentStatus, $categoryOfEmployment, $natureOfEmployment);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertGender($connection, $personId, $gender) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO gender (GENDER_ID, PERSON_ID, GENDER, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $gender);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertGovernmentMembership($connection, $personId, $isActiveVoter, $is4psMember) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO government_membership (GOVERNMENT_MEMBERSHIP_ID, PERSON_ID, IS_ACTIVE_VOTER, IS_4PS_MEMBER, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sss", $personId, $isActiveVoter, $is4psMember);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertIdReferenceNumber($connection, $personId, $sssNumber, $gsisNumber, $psnNumber, $isPhilhealthMember, $philhealthNumber) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO id_reference_number (ID_REFERENCE_NUMBER_ID, PERSON_ID, SSS_NUMBER, GSIS_NUMBER, PSN_NUMBER, IS_PHILHEALTH_MEMBER, PHILHEALTH_NUMBER, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ssssss", $personId, $sssNumber, $gsisNumber, $psnNumber, $isPhilhealthMember, $philhealthNumber);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertIncome($connection, $personId, $monthlyIncome, $totalFamilyIncome) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO income (INCOME_ID, PERSON_ID, MONTHLY_INCOME, TOTAL_FAMILY_INCOME, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sis", $personId, $monthlyIncome, $totalFamilyIncome);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertJob($connection, $personId, $job, $otherJob) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO job (JOB_ID, PERSON_ID, JOB, OTHER_JOB, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sss", $personId, $job, $otherJob);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertMaritalStatus($connection, $personId, $maritalStatus) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO marital_status (MARITAL_STATUS_ID, PERSON_ID, MARITAL_STATUS, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $maritalStatus);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertName($connection, $personId, $firstName, $middleName, $lastName, $suffix) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO name (NAME_ID, PERSON_ID, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sssss", $personId, $firstName, $middleName, $lastName, $suffix);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertOrganization($connection, $personId, $organizationAffiliated, $contactPerson, $officeAddress, $telephoneNumber) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO organization (ORGANIZATION_ID, PERSON_ID, ORGANIZATION_AFFILIATED, CONTACT_PERSON, OFFICE_ADDRESS, TELEPHONE_NUMBER, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sssss", $personId, $organizationAffiliated, $contactPerson, $officeAddress, $telephoneNumber);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertPension($connection, $personId, $hasPension, $type, $amount) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO pension (PENSION_ID, PERSON_ID, HAS_PENSION, TYPE, AMOUNT, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sssd", $personId, $hasPension, $type, $amount);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertPreviousAddress($connection, $personId, $region, $province, $city, $barangay) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO previous_address (PREVIOUS_ADDRESS_ID, PERSON_ID, REGION, PROVINCE, CITY, BARANGAY, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sssss", $personId, $region, $province, $city, $barangay);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertPWDDisease($connection, $personId, $typeOfDisability, $medicalCondition, $causeOfDisability, $congenitalInborn, $acquired, $statusOfDisability) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO pwd_disease (PWD_DISEASE_ID, PERSON_ID, TYPE_OF_DISABILITY, MEDICAL_CONDITION, CAUSE_OF_DISABILITY, CONGENITAL_INBORN, ACQUIRED, STATUS_OF_DISABILITY, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, ?, ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sssssss", $personId, $typeOfDisability, $medicalCondition, $causeOfDisability, $congenitalInborn, $acquired, $statusOfDisability);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertPWDPhysician($connection, $personId, $pwdPhysicianName, $physicianLicenseNumber) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO pwd_physician (PWD_PHYSICIAN_ID, PERSON_ID, PWD_PHYSICIAN_NAME, PHYSICIAN_LICENSE_NUMBER, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sss", $personId, $pwdPhysicianName, $physicianLicenseNumber);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertRelationship($connection, $applicantId, $personId, $relationshipType) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO relationship (RELATIONSHIP_ID, APPLICANT_ID, PERSON_ID, RELATIONSHIP_TYPE) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?)");

    // Bind the values to the placeholders
    $stmt->bind_param("sss", $applicantId, $personId, $relationshipType);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertReligion($connection, $personId, $religion) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO religion (RELIGION_ID, PERSON_ID, RELIGION, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $religion);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertSoloParentLongText($connection, $personId, $classificationCircumstances, $needsProblems, $familyResources) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO solo_parent_long_text (SOLO_PARENT_LONG_TEXT_ID, PERSON_ID, CLASSIFICATION_CIRCUMSTANCES, NEEDS_PROBLEMS, FAMILY_RESOURCES, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, NOW(), NOW(), 'N', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ssss", $personId, $classificationCircumstances, $needsProblems, $familyResources);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();
}

function insertTelephone($connection, $personId, $telephoneNumber) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO telephone (TELEPHONE_ID, PERSON_ID, TELEPHONE_NUMBER, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");
    
    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $telephoneNumber);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();

}

function insertLandline($connection, $personId, $landline) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO landline (LANDLINE_ID, PERSON_ID, LANDLINE_NUMBER, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");
    
    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $landline);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();

}

function insertUserAccount($connection, $id_number, $applicantType, $personId, $username) {
    // Generate a random password
    $password = generateRandomPassword();
    $passwordHashed = password_hash($password, PASSWORD_DEFAULT);
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO user_account (USER_ACCOUNT_ID, PERSON_ID, USERNAME, PASSWORD, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (?, ?, ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ssss", $id_number, $personId, $id_number, $passwordHashed);

    // Execute the query
    if($stmt->execute() === TRUE){
        header("location: ../success.html?username=$username&password=$password");
        exit();
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();

}

function insertTransactionType($connection, $personId, $transactionType, $IDNumber) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO transaction_type (TRANSACTION_TYPE_ID, PERSON_ID, TRANSACTION_TYPE, ID_NUMBER, STATUS, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, 'PENDING', NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sss", $personId, $transactionType, $IDNumber);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();

}

function insertPWDApplicationAccomplisher($connection, $personId, $accomplishedBy, $accomplisherName) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO pwd_application_accomplisher (PWD_APLICATION_ACCOMPLISHER_ID, PERSON_ID, ACCOMPLISHED_BY, ACCOMPLISHER_NAME, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sss", $personId, $accomplishedBy, $accomplisherName);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
    }

    // Close the statement
    $stmt->close();

}

function insertIssuedId($connection, $personId, $applicantType, $currentDate, $expirationDate, $adminUsername) {
    // Prepare the SQL query
    global $isDeleted;
    $stmt = $connection->prepare("INSERT INTO issued_id (ISSUED_ID_ID , PERSON_ID, APPLICANT_TYPE, DATE_ISSUED, EXPIRATION_DATE, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, NOW(), NOW(), '$isDeleted', '$adminUsername')");

    // Bind the values to the placeholders
    $stmt->bind_param("ssss", $personId, $applicantType, $currentDate, $expirationDate);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

function insertClaimedBenefits($connection, $personId, $applicantType, $event_id) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $status = "CLAIMED";
    $stmt = $connection->prepare("INSERT INTO claimed_benefits (CLAIMED_BENEFITS_ID , PERSON_ID, APPLICATION_TYPE, STATUS_OF_CLAIMS, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sss", $personId, $applicantType, $status);

    // Execute the query
    if($stmt->execute() === TRUE){
        header("location: ../event.html?id=$event_id");
        exit();
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

function insertDrafts($connection, $applicationType, $applicantName, $applicantBarangay, $formID) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $status = "CLAIMED";
    $stmt = $connection->prepare("INSERT INTO draft(DRAFT_ID, APPLICATION_TYPE, APPLICANT_NAME, APPLICANT_BARANGAY, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (?, ?, ?, ?, NOW(), NOW(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ssss", $formID, $applicationType, $applicantName, $applicantBarangay);

    // Execute the query
    if($stmt->execute() === TRUE){
        header("location: ../drafts.html");
        exit();
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

function insertSecurityQuestions($connection, $id, $securityQ1, $securityAnswer1, $securityQ2, $securityAnswer2,  $securityQ3, $securityAnswer3) {
    // Prepare the SQL query
    $stmt = $connection->prepare("INSERT INTO security_questions(SECURITY_QUESTIONS_ID, PERSON_ID, SECURITY_QUESTION_1, SECURITY_ANSWER_1, SECURITY_QUESTION_2, SECURITY_ANSWER_2, SECURITY_QUESTION_3, SECURITY_ANSWER_3) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, ?, ?, ?)");

    // Bind the values to the placeholders
    $stmt->bind_param("sssssss", $id, $securityQ1, $securityAnswer1, $securityQ2, $securityAnswer2, $securityQ3, $securityAnswer3);

    // Execute the query
    if($stmt->execute() === FALSE){
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();        
    }

    // Close the statement
    $stmt->close();
}

function updateSecurityQuestions($connection, $id, $securityQ1, $securityAnswer1, $securityQ2, $securityAnswer2,  $securityQ3, $securityAnswer3) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE security_questions SET SECURITY_QUESTION_1 = ?, SECURITY_ANSWER_1 = ?, SECURITY_QUESTION_2 = ?, SECURITY_ANSWER_2 = ?, SECURITY_QUESTION_3 = ?, SECURITY_ANSWER_3 = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("sssssss", $securityQ1, $securityAnswer1, $securityQ2, $securityAnswer2, $securityQ3, $securityAnswer3, $id);

    // Execute the query
    if($stmt->execute() === FALSE){
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();        
    }

    // Close the statement
    $stmt->close();
}

function updateEmail($connection, $person_id) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE person SET EMAIL = NULL WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("s", $person_id);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

function deleteUserData($connection, $person_id, $applicantType) {
    if ($applicantType == "PWD") {
        $sql = "DELETE previous_address, landline, telephone, gender, religion, marital_status, blood_type, educational_attainment, government_membership, employment_status, job, income, organization, id_reference_number, relationship, pwd_disease, pwd_physician, pwd_application_accomplisher
        FROM person
        LEFT JOIN previous_address ON person.PERSON_ID = previous_address.PERSON_ID
        LEFT JOIN landline ON person.PERSON_ID = landline.PERSON_ID
        LEFT JOIN telephone ON person.PERSON_ID = telephone.PERSON_ID
        LEFT JOIN gender ON person.PERSON_ID = gender.PERSON_ID
        LEFT JOIN religion ON person.PERSON_ID = religion.PERSON_ID
        LEFT JOIN marital_status ON person.PERSON_ID = marital_status.PERSON_ID
        LEFT JOIN blood_type ON person.PERSON_ID = blood_type.PERSON_ID
        LEFT JOIN educational_attainment ON person.PERSON_ID = educational_attainment.PERSON_ID
        LEFT JOIN government_membership ON person.PERSON_ID = government_membership.PERSON_ID
        LEFT JOIN employment_status ON person.PERSON_ID = employment_status.PERSON_ID
        LEFT JOIN job ON person.PERSON_ID = job.PERSON_ID
        LEFT JOIN income ON person.PERSON_ID = income.PERSON_ID
        LEFT JOIN organization ON person.PERSON_ID = organization.PERSON_ID
        LEFT JOIN id_reference_number ON person.PERSON_ID = id_reference_number.PERSON_ID
        LEFT JOIN relationship ON person.PERSON_ID = relationship.PERSON_ID
        LEFT JOIN pwd_disease ON person.PERSON_ID = pwd_disease.PERSON_ID
        LEFT JOIN pwd_physician ON person.PERSON_ID = pwd_physician.PERSON_ID
        LEFT JOIN pwd_application_accomplisher ON person.PERSON_ID = pwd_application_accomplisher.PERSON_ID
        WHERE person.PERSON_ID = '$person_id'";
    } else if ($applicantType == "Senior Citizen") {
        $sql = "DELETE gender, marital_status, telephone, religion, job, pension, relationship
        FROM person
        LEFT JOIN gender ON person.PERSON_ID = gender.PERSON_ID
        LEFT JOIN marital_status ON person.PERSON_ID = marital_status.PERSON_ID
        LEFT JOIN telephone ON person.PERSON_ID = telephone.PERSON_ID
        LEFT JOIN religion ON person.PERSON_ID = religion.PERSON_ID
        LEFT JOIN job ON person.PERSON_ID = job.PERSON_ID
        LEFT JOIN pension ON person.PERSON_ID = pension.PERSON_ID
        LEFT JOIN relationship ON person.PERSON_ID = relationship.PERSON_ID
        WHERE person.PERSON_ID = '$person_id'";
    } else if ($applicantType == "Solo Parent") {
        $sql = "DELETE transaction_type, name, educational_attainment, company, income, telephone, job, solo_parent_long_text
        FROM person
        LEFT JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID
        LEFT JOIN name ON person.PERSON_ID = name.PERSON_ID
        -- LEFT JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
        -- LEFT JOIN address ON person.PERSON_ID = person_address.PERSON_ID
        LEFT JOIN educational_attainment ON person.PERSON_ID = educational_attainment.PERSON_ID
        LEFT JOIN company ON person.PERSON_ID = company.PERSON_ID
        LEFT JOIN income ON person.PERSON_ID = income.PERSON_ID
        LEFT JOIN telephone ON person.PERSON_ID = telephone.PERSON_ID
        LEFT JOIN job ON person.PERSON_ID = job.PERSON_ID
        LEFT JOIN solo_parent_long_text ON person.PERSON_ID = solo_parent_long_text.PERSON_ID
        WHERE person.PERSON_ID = '$person_id'";
    }
    $stmt = $connection->prepare($sql);
    if($stmt->execute() === FALSE){
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
}

function deleteChildData($connection, $person_id, $applicantType) {
    if ($applicantType == "PWD") {
        $sql = "DELETE previous_address, landline, telephone, gender, religion, marital_status, blood_type, educational_attainment, government_membership, employment_status, job, income, organization, id_reference_number, relationship, pwd_disease, pwd_physician, pwd_application_accomplisher
        FROM person
        LEFT JOIN previous_address ON person.PERSON_ID = previous_address.PERSON_ID
        LEFT JOIN landline ON person.PERSON_ID = landline.PERSON_ID
        LEFT JOIN telephone ON person.PERSON_ID = telephone.PERSON_ID
        LEFT JOIN gender ON person.PERSON_ID = gender.PERSON_ID
        LEFT JOIN religion ON person.PERSON_ID = religion.PERSON_ID
        LEFT JOIN marital_status ON person.PERSON_ID = marital_status.PERSON_ID
        LEFT JOIN blood_type ON person.PERSON_ID = blood_type.PERSON_ID
        LEFT JOIN educational_attainment ON person.PERSON_ID = educational_attainment.PERSON_ID
        LEFT JOIN government_membership ON person.PERSON_ID = government_membership.PERSON_ID
        LEFT JOIN employment_status ON person.PERSON_ID = employment_status.PERSON_ID
        LEFT JOIN job ON person.PERSON_ID = job.PERSON_ID
        LEFT JOIN income ON person.PERSON_ID = income.PERSON_ID
        LEFT JOIN organization ON person.PERSON_ID = organization.PERSON_ID
        LEFT JOIN id_reference_number ON person.PERSON_ID = id_reference_number.PERSON_ID
        LEFT JOIN relationship ON person.PERSON_ID = relationship.PERSON_ID
        LEFT JOIN pwd_disease ON person.PERSON_ID = pwd_disease.PERSON_ID
        LEFT JOIN pwd_physician ON person.PERSON_ID = pwd_physician.PERSON_ID
        LEFT JOIN pwd_application_accomplisher ON person.PERSON_ID = pwd_application_accomplisher.PERSON_ID
        WHERE person.PERSON_ID = '$person_id'";
    } else if ($applicantType == "Senior Citizen") {
        $sql = "DELETE gender, marital_status, telephone, religion, job, pension, relationship
        FROM person
        LEFT JOIN gender ON person.PERSON_ID = gender.PERSON_ID
        LEFT JOIN marital_status ON person.PERSON_ID = marital_status.PERSON_ID
        LEFT JOIN telephone ON person.PERSON_ID = telephone.PERSON_ID
        LEFT JOIN religion ON person.PERSON_ID = religion.PERSON_ID
        LEFT JOIN job ON person.PERSON_ID = job.PERSON_ID
        LEFT JOIN pension ON person.PERSON_ID = pension.PERSON_ID
        LEFT JOIN relationship ON person.PERSON_ID = relationship.PERSON_ID
        WHERE person.PERSON_ID = '$person_id'";
    } else if ($applicantType == "Solo Parent") {
        $sql = "DELETE person, name, marital_status, educational_attainment, income, job, relationship
        FROM person
        LEFT JOIN name ON person.PERSON_ID = name.PERSON_ID
        LEFT JOIN marital_status ON person.PERSON_ID = marital_status.PERSON_ID
        LEFT JOIN educational_attainment ON person.PERSON_ID = educational_attainment.PERSON_ID
        LEFT JOIN income ON person.PERSON_ID = income.PERSON_ID
        LEFT JOIN job ON person.PERSON_ID = job.PERSON_ID
        LEFT JOIN relationship ON person.PERSON_ID = relationship.PERSON_ID
        WHERE person.PERSON_ID = '$person_id'";
    }
    $stmt = $connection->prepare($sql);
    if($stmt->execute() === FALSE){
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }
}

// Update Person Email
function updatePersonEmail($connection, $person_id, $email) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE person SET EMAIL = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("ss",$email, $person_id);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();

}

// Update Applicant
function updateApplicant($connection, $person_id, $formControlNumber) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE applicant SET FORM_CONTROL_NUMBER = ? WHERE APPLICANT_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("ss",$formControlNumber, $person_id);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update Transaction Type
function updateTransactionType($connection, $person_id, $applicationType, $status) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE transaction_type SET TRANSACTION_TYPE = ?, STATUS = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("sss",$applicationType, $status, $person_id);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update Name
function updateName($connection, $person_id, $firstName, $middleName, $lastName, $suffix) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE name SET FIRST_NAME = ?, MIDDLE_NAME = ?, LAST_NAME = ?, SUFFIX = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("sssss", $firstName, $middleName, $lastName, $suffix, $person_id);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update Address
function updateAddress($connection, $address_id, $barangay, $address) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE address SET BARANGAY = ?, ADDRESS = ? WHERE ADDRESS_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("sss",$barangay, $address, $address_id);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update Landline
function updateLandline($connection, $person_id, $landline) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE landline SET LANDLINE_NUMBER = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("ss",$landline, $person_id);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update Telephone
function updateTelephone($connection, $person_id, $telephone) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE telephone SET TELEPHONE_NUMBER = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("ss",$telephone, $person_id);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}
// Update Gender
function updateGender($connection, $person_id, $gender) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE gender SET GENDER = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("ss",$gender, $person_id);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update Religion
function updateReligion($connection, $person_id, $religion) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE religion SET RELIGION = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("ss",$religion, $person_id);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update Educational Attainment
function updateEducationalAttainment($connection, $person_id, $educationalAttainment) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE educational_attainment SET EDUCATIONAL_ATTAINMENT = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("ss",$educationalAttainment, $person_id);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update GovernmentMembership
function updateGovernmentMembership($connection, $person_id, $isActiveVoter, $is4psMember) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE government_membership SET IS_ACTIVE_VOTER = ?, IS_4PS_MEMBER = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("sss",$isActiveVoter, $is4psMember, $person_id);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update Employment Status
function updateEmploymentStatus($connection, $person_id, $employmentStatus, $categoryOfEmployment, $natureOfEmployment) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE employment_status SET EMPLOYMENT_STATUS = ?, CATEGORY_OF_EMPLOYMENT = ?, NATURE_OF_EMPLOYMENT = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("ssss",$employmentStatus, $categoryOfEmployment, $natureOfEmployment, $person_id);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update Company
function updateCompany($connection, $person_id, $company) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE company SET COMPANY = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("ss",$company, $person_id);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update Income
function updateIncome($connection, $person_id, $monthlyIncome, $totalFamilyIncome) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE income SET MONTHLY_INCOME = ?, TOTAL_FAMILY_INCOME = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("sss", $monthlyIncome, $totalFamilyIncome, $person_id);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update Job
function updateJob($connection, $person_id, $job, $otherJob) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE job SET JOB = ?, OTHER_JOB = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("sss", $job, $otherJob, $person_id);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update Marital Status
function updateMaritalStatus($connection, $person_id, $maritalStatus) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE marital_status SET MARITAL_STATUS = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $maritalStatus, $person_id);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update Solo Parent Long Text
function updateSoloParentLongText($connection, $person_id, $soloParentClassification, $soloParentNeeds, $soloParentFamilyResources) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE solo_parent_long_text SET CLASSIFICATION_CIRCUMSTANCES = ?, NEEDS_PROBLEMS = ?, FAMILY_RESOURCES = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("ssss", $soloParentClassification, $soloParentNeeds, $soloParentFamilyResources, $person_id);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update Organization
function updateOrganization($connection, $personId, $organization, $organizationContactPerson, $organizationOfficeAddress, $organizationTelephoneNumber) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE organization SET ORGANIZATION_AFFILIATED = ?, CONTACT_PERSON = ?,OFFICE_ADDRESS = ?,TELEPHONE_NUMBER = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("sssss", $organization, $organizationContactPerson, $organizationOfficeAddress, $organizationTelephoneNumber, $personId);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update ID Reference Number
function updateIdReferenceNumber($connection, $personId, $SSSNo, $GSISNo, $PSNNo, $isPhilhealthMember, $philhealthNumber) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE id_reference_number SET SSS_NUMBER = ?, GSIS_NUMBER = ?,PSN_NUMBER = ?,IS_PHILHEALTH_MEMBER = ?, PHILHEALTH_NUMBER = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("ssssss", $SSSNo, $GSISNo, $PSNNo, $isPhilhealthMember, $philhealthNumber, $personId);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update PWD Disease
function updatePWDDisease($connection, $personId, $typeOfDisability, $medicalCondition, $causeOfDisability, $inborn, $acquired, $statusOfDisability) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE pwd_disease SET TYPE_OF_DISABILITY = ?, MEDICAL_CONDITION = ?,CAUSE_OF_DISABILITY = ?,CONGENITAL_INBORN = ?, ACQUIRED = ?, STATUS_OF_DISABILITY = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("sssssss", $typeOfDisability, $medicalCondition, $causeOfDisability, $inborn, $acquired, $statusOfDisability, $personId);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update Physician
function updatePWDPhysician($connection, $personId, $physicianName, $physicianLicence) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE pwd_physician SET PWD_PHYSICIAN_NAME = ?, PHYSICIAN_LICENSE_NUMBER = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("sss", $physicianName, $physicianLicence, $personId);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}

// Update Accomplisher
function updatePWDApplicationAccomplisher($connection, $personId, $accomplishedBy, $accomplisherName) {
    // Prepare the SQL query
    $stmt = $connection->prepare("UPDATE pwd_application_accomplisher SET ACCOMPLISHED_BY = ?, ACCOMPLISHER_NAME = ? WHERE PERSON_ID = ?");

    // Bind the values to the placeholders
    $stmt->bind_param("sss", $accomplishedBy, $accomplisherName, $personId);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully updated";
    } else {
        $errorMessage =  "Error: " . $stmt . "<br>" . $connection->error;
        header("location: ../error.html?error_message=" . urlencode($errorMessage));
        exit();
    }

    // Close the statement
    $stmt->close();
}
?>