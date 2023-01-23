<?php
// GET PWD DATA
function getPWDData($connection, $username) {
    $data = [];
    if(!empty($username)) {
        $sql = "SELECT APPLICANT_TYPE, TRANSACTION_TYPE, REGION, CITY, PROVINCE, previous_address.BARANGAY, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, address.BARANGAY, ADDRESS, LANDLINE_NUMBER, telephone.TELEPHONE_NUMBER, EMAIL, DATE_OF_BIRTH, GENDER, RELIGION, MARITAL_STATUS, BLOOD_TYPE, EDUCATIONAL_ATTAINMENT, IS_ACTIVE_VOTER, IS_4PS_MEMBER, EMPLOYMENT_STATUS, CATEGORY_OF_EMPLOYMENT, NATURE_OF_EMPLOYMENT, JOB, MONTHLY_INCOME, ORGANIZATION_AFFILIATED, CONTACT_PERSON, OFFICE_ADDRESS, organization.TELEPHONE_NUMBER, SSS_NUMBER, GSIS_NUMBER,PSN_NUMBER, IS_PHILHEALTH_MEMBER, PHILHEALTH_NUMBER, TYPE_OF_DISABILITY, MEDICAL_CONDITION, CAUSE_OF_DISABILITY, CONGENITAL_INBORN, ACQUIRED, STATUS_OF_DISABILITY, PWD_PHYSICIAN_NAME, PHYSICIAN_LICENSE_NUMBER, ACCOMPLISHED_BY, ACCOMPLISHER_NAME, transaction_type.DATE_UPDATED, STATUS
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
        JOIN gender ON person.PERSON_ID = gender.PERSON_ID AND gender.IS_DELETED = 'N'
        JOIN religion ON person.PERSON_ID = religion.PERSON_ID AND religion.IS_DELETED = 'N'
        JOIN marital_status ON person.PERSON_ID = marital_status.PERSON_ID AND marital_status.IS_DELETED = 'N'
        JOIN blood_type ON person.PERSON_ID = blood_type.PERSON_ID AND blood_type.IS_DELETED = 'N'
        JOIN educational_attainment ON person.PERSON_ID = educational_attainment.PERSON_ID AND educational_attainment.IS_DELETED = 'N'
        JOIN government_membership ON person.PERSON_ID = government_membership.PERSON_ID AND government_membership.IS_DELETED = 'N'
        JOIN employment_status ON person.PERSON_ID = employment_status.PERSON_ID AND employment_status.IS_DELETED = 'N'
        JOIN job ON person.PERSON_ID = job.PERSON_ID AND job.IS_DELETED = 'N'
        JOIN income ON person.PERSON_ID = income.PERSON_ID AND income.IS_DELETED = 'N'
        JOIN organization ON person.PERSON_ID = organization.PERSON_ID AND organization.IS_DELETED = 'N'
        JOIN id_reference_number ON person.PERSON_ID = id_reference_number.PERSON_ID AND id_reference_number.IS_DELETED = 'N'
        JOIN pwd_disease ON person.PERSON_ID = pwd_disease.PERSON_ID AND pwd_disease.IS_DELETED = 'N'
        JOIN pwd_physician ON person.PERSON_ID = pwd_physician.PERSON_ID AND pwd_physician.IS_DELETED = 'N'
        JOIN pwd_application_accomplisher ON person.PERSON_ID = pwd_application_accomplisher.PERSON_ID AND pwd_application_accomplisher.IS_DELETED = 'N'
        WHERE USERNAME = ? AND APPLICANT_TYPE = 'PWD' AND person.IS_DELETED = 'N'";
    } else {
        $sql = "SELECT APPLICANT_TYPE, TRANSACTION_TYPE, REGION, CITY, PROVINCE, previous_address.BARANGAY, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, address.BARANGAY, ADDRESS, LANDLINE_NUMBER, telephone.TELEPHONE_NUMBER, EMAIL, DATE_OF_BIRTH, GENDER, RELIGION, MARITAL_STATUS, BLOOD_TYPE, EDUCATIONAL_ATTAINMENT, IS_ACTIVE_VOTER, IS_4PS_MEMBER, EMPLOYMENT_STATUS, CATEGORY_OF_EMPLOYMENT, NATURE_OF_EMPLOYMENT, JOB, MONTHLY_INCOME, ORGANIZATION_AFFILIATED, CONTACT_PERSON, OFFICE_ADDRESS, organization.TELEPHONE_NUMBER, SSS_NUMBER, GSIS_NUMBER,PSN_NUMBER, IS_PHILHEALTH_MEMBER, PHILHEALTH_NUMBER, TYPE_OF_DISABILITY, MEDICAL_CONDITION, CAUSE_OF_DISABILITY, CONGENITAL_INBORN, ACQUIRED, STATUS_OF_DISABILITY, PWD_PHYSICIAN_NAME, PHYSICIAN_LICENSE_NUMBER, ACCOMPLISHED_BY, ACCOMPLISHER_NAME, transaction_type.DATE_UPDATED, STATUS
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
        JOIN gender ON person.PERSON_ID = gender.PERSON_ID AND gender.IS_DELETED = 'N'
        JOIN religion ON person.PERSON_ID = religion.PERSON_ID AND religion.IS_DELETED = 'N'
        JOIN marital_status ON person.PERSON_ID = marital_status.PERSON_ID AND marital_status.IS_DELETED = 'N'
        JOIN blood_type ON person.PERSON_ID = blood_type.PERSON_ID AND blood_type.IS_DELETED = 'N'
        JOIN educational_attainment ON person.PERSON_ID = educational_attainment.PERSON_ID AND educational_attainment.IS_DELETED = 'N'
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
    $stmt = $connection->prepare($sql);

    if (!$stmt) {
        header("location: ../error.html?error=stmterror");
        exit();
    }
    if(!empty($username)) {
        $stmt->bind_param("s", $username);
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

function getFatherData($connection) {
    $data = [];
    $userData = $_SESSION['userData'];
    $sql = "SELECT LAST_NAME, FIRST_NAME, MIDDLE_NAME, SUFFIX, RELATIONSHIP_TYPE
    FROM person
    JOIN name ON person.PERSON_ID = name.PERSON_ID
    JOIN relationship ON person.PERSON_ID = relationship.PERSON_ID
    WHERE relationship.RELATIONSHIP_TYPE = 'Father'
    AND relationship.APPLICANT_ID = ?
    AND person.IS_DELETED = 'N'
    AND name.IS_DELETED = 'N'";
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

function getMotherData($connection) {
    $data = [];
    $userData = $_SESSION['userData'];
    $sql = "SELECT LAST_NAME, FIRST_NAME, MIDDLE_NAME, SUFFIX, RELATIONSHIP_TYPE
    FROM person
    JOIN name ON person.PERSON_ID = name.PERSON_ID
    JOIN relationship ON person.PERSON_ID = relationship.PERSON_ID
    WHERE relationship.RELATIONSHIP_TYPE = 'Mother'
    AND relationship.APPLICANT_ID = ?
    AND person.IS_DELETED = 'N'
    AND name.IS_DELETED = 'N'";
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

function getGuardianData($connection) {
    $data = [];
    $userData = $_SESSION['userData'];
    $sql = "SELECT LAST_NAME, FIRST_NAME, MIDDLE_NAME, SUFFIX, RELATIONSHIP_TYPE
    FROM person
    JOIN name ON person.PERSON_ID = name.PERSON_ID
    JOIN relationship ON person.PERSON_ID = relationship.PERSON_ID
    WHERE relationship.RELATIONSHIP_TYPE != 'Father' AND relationship.RELATIONSHIP_TYPE != 'Mother'
    AND relationship.APPLICANT_ID = ?
    AND person.IS_DELETED = 'N'
    AND name.IS_DELETED = 'N'";
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
// GET SOLO PARENT DATA
function getSoloParentData($connection, $username) {
    $data = [];
    if(!empty($username)) {
        $sql = "SELECT APPLICANT_TYPE, TRANSACTION_TYPE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, BARANGAY, ADDRESS, GENDER, DATE_OF_BIRTH, PLACE_OF_BIRTH, EMAIL, TELEPHONE_NUMBER, JOB, EDUCATIONAL_ATTAINMENT, COMPANY, MONTHLY_INCOME, TOTAL_FAMILY_INCOME, CLASSIFICATION_CIRCUMSTANCES, NEEDS_PROBLEMS, FAMILY_RESOURCES, transaction_type.DATE_UPDATED, STATUS
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
    } else {
        $sql = "SELECT APPLICANT_TYPE, TRANSACTION_TYPE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, BARANGAY, ADDRESS, GENDER, DATE_OF_BIRTH, PLACE_OF_BIRTH, EMAIL, TELEPHONE_NUMBER, JOB, EDUCATIONAL_ATTAINMENT, COMPANY, MONTHLY_INCOME, TOTAL_FAMILY_INCOME, CLASSIFICATION_CIRCUMSTANCES, NEEDS_PROBLEMS, FAMILY_RESOURCES, transaction_type.DATE_UPDATED, STATUS
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
        WHERE APPLICANT_TYPE = 'Solo Parent' AND person.IS_DELETED = 'N';";
    }
    $stmt = $connection->prepare($sql);

    if (!$stmt) {
        header("location: ../error.html?error=stmterror");
        exit();
    }
    if(!empty($username)) {
        $stmt->bind_param("s", $username);
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
// GET SR CITIZEN DATA
function getSeniorCitizenData($connection, $username) {
    $data = [];
    if(!empty($username)) {
        $sql = "SELECT APPLICANT_TYPE, TRANSACTION_TYPE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, BARANGAY, ADDRESS, GENDER, MARITAL_STATUS, DATE_OF_BIRTH, PLACE_OF_BIRTH, EMAIL, TELEPHONE_NUMBER, RELIGION, JOB, HAS_PENSION, TYPE, AMOUNT, STATUS, transaction_type.DATE_UPDATED
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
    } else {
        $sql = "SELECT APPLICANT_TYPE, TRANSACTION_TYPE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, BARANGAY, ADDRESS, GENDER, MARITAL_STATUS, DATE_OF_BIRTH, PLACE_OF_BIRTH, EMAIL, TELEPHONE_NUMBER, RELIGION, JOB, HAS_PENSION, TYPE, AMOUNT, STATUS, transaction_type.DATE_UPDATED
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
        WHERE APPLICANT_TYPE = 'Senior Citizen' AND person.IS_DELETED = 'N'";
    }
    $stmt = $connection->prepare($sql);

    if (!$stmt) {
        header("location: ../error.html?error=stmterror");
        exit();
    }
    if(!empty($username)) {
        $stmt->bind_param("s", $username);
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

// GET APPLICATIONS
function getPWDStatus($connection, $status) {
    $data = [];
    $sql = "SELECT person.PERSON_ID, APPLICANT_TYPE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, address.BARANGAY, ADDRESS, DATE_OF_BIRTH, MONTHLY_INCOME, STATUS
    FROM person 
    JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
    JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
    JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
    JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
    JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
    JOIN income ON person.PERSON_ID = income.PERSON_ID AND income.IS_DELETED = 'N'
    WHERE APPLICANT_TYPE = 'PWD' AND STATUS = '$status' AND person.IS_DELETED = 'N'";
    $stmt = $connection->prepare($sql);

    if (!$stmt) {
        header("location: ../error.html?error=stmterror");
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

function getSoloParentStatus($connection, $status) {
    $data = [];
    $sql = "SELECT person.PERSON_ID, APPLICANT_TYPE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, address.BARANGAY, ADDRESS, DATE_OF_BIRTH, MONTHLY_INCOME, STATUS
    FROM person 
    JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
    JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
    JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
    JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
    JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
    JOIN income ON person.PERSON_ID = income.PERSON_ID AND income.IS_DELETED = 'N'
    WHERE APPLICANT_TYPE = 'Solo Parent' AND STATUS = '$status' AND person.IS_DELETED = 'N'";
    $stmt = $connection->prepare($sql);

    if (!$stmt) {
        header("location: ../error.html?error=stmterror");
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

function getSeniorCitizenStatus($connection, $status) {
    $data = [];
    $sql = "SELECT person.PERSON_ID, APPLICANT_TYPE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, address.BARANGAY, ADDRESS, DATE_OF_BIRTH, MONTHLY_INCOME, STATUS
    FROM person 
    JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
    JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
    JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
    JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
    JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
    JOIN income ON person.PERSON_ID = income.PERSON_ID AND income.IS_DELETED = 'N'
    WHERE APPLICANT_TYPE = 'Senior Citizen' AND STATUS = '$status' AND person.IS_DELETED = 'N'";
    $stmt = $connection->prepare($sql);

    if (!$stmt) {
        header("location: ../error.html?error=stmterror");
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
    $sql = "SELECT person.PERSON_ID, APPLICANT_TYPE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, address.BARANGAY, ADDRESS, DATE_OF_BIRTH, MONTHLY_INCOME, STATUS, transaction_type.DATE_UPDATED
    FROM person 
    JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
    JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
    JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
    JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
    JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
    JOIN income ON person.PERSON_ID = income.PERSON_ID AND income.IS_DELETED = 'N'
    WHERE APPLICANT_TYPE = 'PWD' AND address.BARANGAY = '$barangay' AND person.IS_DELETED = 'N'";
    $stmt = $connection->prepare($sql);

    if (!$stmt) {
        header("location: ../error.html?error=stmterror");
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
    $sql = "SELECT person.PERSON_ID, APPLICANT_TYPE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, address.BARANGAY, ADDRESS, DATE_OF_BIRTH, MONTHLY_INCOME, STATUS, transaction_type.DATE_UPDATED
    FROM person 
    JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
    JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
    JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
    JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
    JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
    JOIN income ON person.PERSON_ID = income.PERSON_ID AND income.IS_DELETED = 'N'
    WHERE APPLICANT_TYPE = 'Solo Parent' AND address.BARANGAY = '$barangay' AND person.IS_DELETED = 'N'";
    $stmt = $connection->prepare($sql);

    if (!$stmt) {
        header("location: ../error.html?error=stmterror");
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
    $sql = "SELECT person.PERSON_ID, APPLICANT_TYPE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, address.BARANGAY, ADDRESS, DATE_OF_BIRTH, MONTHLY_INCOME, STATUS, transaction_type.DATE_UPDATED
    FROM person 
    JOIN applicant ON person.PERSON_ID = applicant.APPLICANT_ID
    JOIN transaction_type ON person.PERSON_ID = transaction_type.PERSON_ID AND transaction_type.IS_DELETED = 'N'
    JOIN name ON person.PERSON_ID = name.PERSON_ID AND name.IS_DELETED = 'N'
    JOIN person_address ON person.PERSON_ID = person_address.PERSON_ID
    JOIN address ON person_address.ADDRESS_ID = address.ADDRESS_ID AND address.IS_DELETED = 'N'
    JOIN income ON person.PERSON_ID = income.PERSON_ID AND income.IS_DELETED = 'N'
    WHERE APPLICANT_TYPE = 'Senior Citizen' AND address.BARANGAY = '$barangay' AND person.IS_DELETED = 'N'";
    $stmt = $connection->prepare($sql);

    if (!$stmt) {
        header("location: ../error.html?error=stmterror");
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
    $all = $uppercase . $lowercase . $numbers;
    $password = "";
    $password .= substr($uppercase, rand(0, strlen($uppercase) - 1), 1);
    $password .= substr($lowercase, rand(0, strlen($lowercase) - 1), 1);
    $password .= substr($numbers, rand(0, strlen($numbers) - 1), 1);
    for ($i = 0; $i < 5; $i++) {
        $password .= substr($all, rand(0, strlen($all) - 1), 1);
    }
    return $password;
}

function insertPerson($connection, $personId, $dateOfBirth) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO person (PERSON_ID, DATE_OF_BIRTH, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES ('$personId', ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("s", $dateOfBirth);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertApplicant($connection, $applicantId, $applicantType, $citizenId, $placeOfBirth) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO applicant (APPLICANT_ID, APPLICANT_TYPE, CITIZEN_ID, PLACE_OF_BIRTH) VALUES (?, ?, ?, ?)");

    // Bind the values to the placeholders
    $stmt->bind_param("ssss", $applicantId, $applicantType, $citizenId, $placeOfBirth);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertAddress($connection, $barangayId, $barangay, $address) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO address (ADDRESS_ID, BARANGAY, ADDRESS, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES ('$barangayId', ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $barangay, $address);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
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
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertBloodType($connection, $personId, $bloodType) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO blood_type (BLOOD_TYPE_ID, PERSON_ID, BLOOD_TYPE, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $bloodType);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertCompany($connection, $personId, $company) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO company (COMPANY_ID, PERSON_ID, COMPANY, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $company);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertEducationalAttainment($connection, $personId, $educationalAttainment) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO educational_attainment (EDUCATIONAL_ATTAINMENT_ID, PERSON_ID, EDUCATIONAL_ATTAINMENT, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $educationalAttainment);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertEmploymentStatus($connection, $personId, $employmentStatus, $categoryOfEmployment, $natureOfEmployment) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO employment_status (EMPLOYMENT_STATUS_ID, PERSON_ID, EMPLOYMENT_STATUS, CATEGORY_OF_EMPLOYMENT, NATURE_OF_EMPLOYMENT, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ssss", $personId, $employmentStatus, $categoryOfEmployment, $natureOfEmployment);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertGender($connection, $personId, $gender) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO gender (GENDER_ID, PERSON_ID, GENDER, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $gender);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertGovernmentMembership($connection, $personId, $isActiveVoter, $is4psMember) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO government_membership (GOVERNMENT_MEMBERSHIP_ID, PERSON_ID, IS_ACTIVE_VOTER, IS_4PS_MEMBER, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sss", $personId, $isActiveVoter, $is4psMember);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertIdReferenceNumber($connection, $personId, $sssNumber, $gsisNumber, $psnNumber, $isPhilhealthMember, $philhealthNumber) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO id_reference_number (ID_REFERENCE_NUMBER_ID, PERSON_ID, SSS_NUMBER, GSIS_NUMBER, PSN_NUMBER, IS_PHILHEALTH_MEMBER, PHILHEALTH_NUMBER, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ssssss", $personId, $sssNumber, $gsisNumber, $psnNumber, $isPhilhealthMember, $philhealthNumber);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertIncome($connection, $personId, $monthlyIncome, $totalFamilyIncome) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO income (INCOME_ID, PERSON_ID, MONTHLY_INCOME, TOTAL_FAMILY_INCOME, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sis", $personId, $monthlyIncome, $totalFamilyIncome);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertJob($connection, $personId, $job) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO job (JOB_ID, PERSON_ID, JOB, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $job);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertMaritalStatus($connection, $personId, $maritalStatus) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO marital_status (MARITAL_STATUS_ID, PERSON_ID, MARITAL_STATUS, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $maritalStatus);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertName($connection, $personId, $firstName, $middleName, $lastName, $suffix) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO name (NAME_ID, PERSON_ID, FIRST_NAME, MIDDLE_NAME, LAST_NAME, SUFFIX, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sssss", $personId, $firstName, $middleName, $lastName, $suffix);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertOrganization($connection, $personId, $organizationAffiliated, $contactPerson, $officeAddress, $telephoneNumber) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO organization (ORGANIZATION_ID, PERSON_ID, ORGANIZATION_AFFILIATED, CONTACT_PERSON, OFFICE_ADDRESS, TELEPHONE_NUMBER, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sssss", $personId, $organizationAffiliated, $contactPerson, $officeAddress, $telephoneNumber);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertPension($connection, $personId, $hasPension, $type, $amount) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO pension (PENSION_ID, PERSON_ID, HAS_PENSION, TYPE, AMOUNT, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sssd", $personId, $hasPension, $type, $amount);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertPreviousAddress($connection, $personId, $region, $province, $city, $barangay) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO previous_address (PREVIOUS_ADDRESS_ID, PERSON_ID, REGION, PROVINCE, CITY, BARANGAY, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sssss", $personId, $region, $province, $city, $barangay);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertPWDDisease($connection, $personId, $typeOfDisability, $medicalCondition, $causeOfDisability, $congenitalInborn, $acquired, $statusOfDisability) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO pwd_disease (PWD_DISEASE_ID, PERSON_ID, TYPE_OF_DISABILITY, MEDICAL_CONDITION, CAUSE_OF_DISABILITY, CONGENITAL_INBORN, ACQUIRED, STATUS_OF_DISABILITY, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, ?, ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sssssss", $personId, $typeOfDisability, $medicalCondition, $causeOfDisability, $congenitalInborn, $acquired, $statusOfDisability);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertPWDPhysician($connection, $personId, $pwdPhysicianName, $physicianLicenseNumber) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO pwd_physician (PWD_PHYSICIAN_ID, PERSON_ID, PWD_PHYSICIAN_NAME, PHYSICIAN_LICENSE_NUMBER, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sss", $personId, $pwdPhysicianName, $physicianLicenseNumber);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
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
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertReligion($connection, $personId, $religion) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO religion (RELIGION_ID, PERSON_ID, RELIGION, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $religion);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertSoloParentLongText($connection, $personId, $classificationCircumstances, $needsProblems, $familyResources) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO solo_parent_long_text (SOLO_PARENT_LONG_TEXT_ID, PERSON_ID, CLASSIFICATION_CIRCUMSTANCES, NEEDS_PROBLEMS, FAMILY_RESOURCES, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, CURDATE(), CURDATE(), 'N', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ssss", $personId, $classificationCircumstances, $needsProblems, $familyResources);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();
}

function insertTelephone($connection, $personId, $telephoneNumber) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO telephone (TELEPHONE_ID, PERSON_ID, TELEPHONE_NUMBER, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");
    
    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $telephoneNumber);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();

}

function insertLandline($connection, $personId, $landline) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO landline (LANDLINE_ID, PERSON_ID, LANDLINE_NUMBER, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");
    
    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $landline);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();

}

function insertUserAccount($connection, $id_number, $applicantType, $personId, $email, $username) {
    // Generate a random password
    $password = generateRandomPassword();
    $passwordHashed = password_hash($password, PASSWORD_DEFAULT);
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO user_account (USER_ACCOUNT_ID, PERSON_ID, EMAIL, USERNAME, PASSWORD, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (? , ?, ?, ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sssss", $id_number, $personId, $email, $id_number, $passwordHashed);

    // Execute the query
    if($stmt->execute() === TRUE){
        header("location: ../success.html?username=$username&password=$password");
        exit();
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();

}

function insertTransactionType($connection, $personId, $transactionType) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO transaction_type (TRANSACTION_TYPE_ID, PERSON_ID, TRANSACTION_TYPE, STATUS, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, 'PENDING', CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ss", $personId, $transactionType);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();

}

function insertPWDApplicationAccomplisher($connection, $personId, $accomplishedBy, $accomplisherName) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO pwd_application_accomplisher (PWD_APLICATION_ACCOMPLISHER_ID, PERSON_ID, ACCOMPLISHED_BY, ACCOMPLISHER_NAME, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("sss", $personId, $accomplishedBy, $accomplisherName);

    // Execute the query
    if($stmt->execute() === TRUE){
        echo "Successfully inserted";
    } else {
        echo "Error: " . $stmt . "<br>" . $connection->error;
    }

    // Close the statement
    $stmt->close();

}