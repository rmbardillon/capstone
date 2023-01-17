<?php

    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;

function email($senderName, $subject, $senderEmail, $receiverName, $receiverEmail, $message) {
    require 'PHPMailer/src/Exception.php';
    require 'PHPMailer/src/PHPMailer.php';
    require 'PHPMailer/src/SMTP.php';

    $mail = new PHPMailer(true);
    // $mail->SMTPDebug = 3;
    $mail->isSMTP();
    $mail->Host = "smtp.gmail.com";
    $mail->SMTPAuth = true;
    $mail->Username = "populationmanagementsystem@gmail.com";
    $mail->Password = "ntllidrufjiuujll";
    $mail->SMTPSecure = "tls";
    $mail->Port = "587";
    $mail->From = $senderEmail;
    $mail->FromName = $senderName;
    $mail->addAddress($receiverEmail, $receiverName);
    $mail->isHTML(true);
    $mail->Subject = $subject;
    $mail->Body = $message;
    $mail->AltBody = "This is the plain text version of email content";
    if (!$mail->send()) {
        echo "Email failed";
        exit();
    }
}

function ageCalculator($dob){
    if(!empty($dob)){
        $birthdate = new DateTime($dob);
        $today   = new DateTime('today');
        $age = $birthdate->diff($today)->y;
        return $age;
    }else{
        return 0;
    }
}

function usernameExists($connection, $username){
    $sql = "SELECT * FROM administrator WHERE username=?";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../admin-add-administrator.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "s", $username);
    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        return $row;
    } 
    else {
        $result = false;
        return $result;
    }

    mysqli_stmt_close($stmt);
}

function userExists($connection, $firstName, $lastName) {
    $sql = "SELECT * FROM administrator WHERE first_name=? and last_name=?";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../add-administrator.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "ss", $firstName, $lastName);
    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        return true;
    } 
    else {
        return false;
    }
    mysqli_stmt_close($stmt);
}

function invalidEmail($email) {
    $result;
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $result = true;
    }
    else {
        $result = false;
    }
    return $result;
}

function emailExists($connection, $email) { 
    $sql = "SELECT * FROM administrator WHERE email=?";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../admin-add-administrator.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "s", $email);
    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        return $row;
    } 
    else {
        $result = false;
        return $result;
    }

    mysqli_stmt_close($stmt);
}

function passwordMatch($password, $confirmPassword) {
    $result;
    if ($password !== $confirmPassword) {
        $result = true;
    }
    else {
        $result = false;
    }
    return $result;
}

function loginCredentialsExists($connection, $username, $email) {
    $sql = "SELECT * FROM administrator WHERE username=? or email=?";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../admin-add-administrator.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "ss", $username, $email);
    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        return $row;
    } 
    else {
        $result = false;
        return $result;
    }

    mysqli_stmt_close($stmt);
}

function loginUser($connection, $username, $password){
    $loginCredentialsExists = loginCredentialsExists($connection, $username, $username);
    if ($loginCredentialsExists === false) {
        header("location: ../../login/admin.html?error=wrongaccount");
        exit();
    }
    $passwordhashed = $loginCredentialsExists['password'];
    $checkPassword = password_verify($password, $passwordhashed);

    if ($checkPassword === false) {
        header("location: ../../login/admin.html?error=wrongpassword");
        exit();
    }
    else if($checkPassword === true) {
        session_start();
        $adminData = $_SESSION['admin-data'] = $loginCredentialsExists;
        header("location: ../dashboard.html");
        exit();
    }
}

function insertAdmin($connection, $firstName, $lastName, $adminType, $barangay, $username, $email, $password){
    $sql = "INSERT INTO administrator (admin_type, barangay, username, first_name, last_name, email, password) VALUES (?, ?, ?, ?, ?, ?, ?);";
    $stmt = $connection->prepare($sql);

    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    mysqli_stmt_bind_param($stmt, "sssssss", $adminType, $barangay, $username, $firstName, $lastName, $email, $hashedPassword);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    header("location: ../administrator-list.html?error=none&username=".$username);
    exit();
}

function getUserData($connection, $table, $where, $condition) {
    $data = [];
    if (empty($where)) {
        $sql = "SELECT * FROM $table";
    } else {
        $sql = "SELECT * FROM $table WHERE $where = '$condition'";
    } 
    
    $result = $connection->query($sql);

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            array_push($data, $row);
        }
    }
    return $data;
}

function getUserDataPerBarangay($connection, $table, $where, $condition, $where2, $condition2) {
    $data = [];

    $sql = "SELECT * FROM $table WHERE $where = '$condition' AND $where2 = '$condition2'";
    
    $result = $connection->query($sql);

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            array_push($data, $row);
        }
    }
    return $data;
}

function addAnnouncement($connection, $title, $for, $where, $message) {
    $sql = "INSERT INTO announcement (title, announcement_for, barangay, message) VALUES (?, ?, ?, ?);";
    $stmt = $connection->prepare($sql);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../announcement.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "ssss", $title, $for, $where, $message);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    header("location: ../announcement.html?error=none");
    exit();
}

function updateAnnouncement($connection, $title, $for, $where, $message, $id) {
    $sql = "UPDATE announcement SET title = ?, announcement_for = ?, barangay = ?, message = ? WHERE id = ?;";
    $stmt = $connection->prepare($sql);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../announcement.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "sssss", $title, $for, $where, $message, $id);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    header("location: ../announcement.html?error=none");
    exit();
}

function profileExisting($connection, $username, $email){
    $sql = "SELECT * FROM media WHERE username=? OR username=?";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../profile.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "ss", $username, $email);
    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        return $row;
    } 
    else {
        $result = false;
        return $result;
    }

    mysqli_stmt_close($stmt);
}

function insertProfile($connection, $username, $fileName, $fileTmpName, $fileDestination) {
    $profileExists = profileExisting($connection, $username, $username);
    if (!$profileExists) {
        move_uploaded_file($fileTmpName, $fileDestination);
        $sql = "INSERT INTO media(username, image_location) VALUES (?, ?);";
        $stmt = mysqli_stmt_init($connection);
        if (!mysqli_stmt_prepare($stmt, $sql)) {
            header("location: ../profile.html?error=stmterror");
            exit();
        }
        mysqli_stmt_bind_param($stmt, "ss", $username, $fileName);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_close($stmt);
    } else {
        move_uploaded_file($fileTmpName, $fileDestination);
        unlink("../uploads/".$profileExists["image_location"]);
        $sql = "UPDATE media SET
        image_location = ?
        WHERE username = ?;";
        $stmt = mysqli_stmt_init($connection);
        if (!mysqli_stmt_prepare($stmt, $sql)) {
            header("location: ../profile.html?error=stmterror");
            exit();
        }
        mysqli_stmt_bind_param($stmt, "ss", $fileName, $username);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_close($stmt);
    }
}

function updateProfile($connection, $username, $firstName, $lastName, $barangay, $email) {
    $sql = "UPDATE administrator SET first_name = ?, last_name = ?, barangay = ?, email = ? WHERE username = ?;";
    $stmt = $connection->prepare($sql);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../profile.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "sssss", $firstName, $lastName, $barangay, $email, $username);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    header("location: ../profile.html?error=none");
    exit();
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

function generateRandomPassword() {
    $uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    $lowercase = "abcdefghijklmnopqrstuvwxyz";
    $numbers = "0123456789";
    $special_characters = "!@#$%^&*()_-+=";
    $all = $uppercase . $lowercase . $numbers . $special_characters;
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

function insertPreviousAddress($connection, $personId, $region, $province, $city, $barangay, $previousAddress) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO previous_address (PREVIOUS_ADDRESS_ID, PERSON_ID, REGION, PROVINCE, CITY, BARANGAY, PREVIOUS_ADDRESScol, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ssssss", $personId, $region, $province, $city, $barangay, $previousAddress);

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
    $stmt = $connection->prepare("INSERT INTO pwd_disease (PWD_DISEASE_ID, PERSON_ID, TYPE_OF_DISABILITY, MEDICAL_CONDITION/DIAGNOSIS, CAUSE_OF_DISABILITY, CONGENITAL_INBORN, ACQUIRED, STATUS_OF_DISABILITY, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, ?, ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

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

function insertPWDPhysician($connection, $personId, $pwdPhysicianName, $physicianLicenseNumber, $accomplishedBy) {
    // Prepare the SQL query
    global $isDeleted;
    global $getActiveUser;
    $stmt = $connection->prepare("INSERT INTO pwd_physician (PWD_PHYSICIAN_ID, PERSON_ID, PWD_PHYSICIAN_NAME, PHYSICIAN_LICENSE_NUMBER, ACCOMPLISHED_BY, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

    // Bind the values to the placeholders
    $stmt->bind_param("ssss", $personId, $pwdPhysicianName, $physicianLicenseNumber, $accomplishedBy);

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
    $stmt = $connection->prepare("INSERT INTO solo_parent_long_text (SOLO_PARENT_LONG_TEXT_ID, PERSON_ID, CLASSIFICATION_CIRCUMSTANCES, NEEDS_PROBLEMS, FAMILY_RESOURCES, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, ?, ?, CURDATE(), CURDATE(), 'N', $getActiveUser)");

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
    $stmt = $connection->prepare("INSERT INTO transaction_type (TRANSACTION_TYPE_ID, PERSON_ID, TRANSACTION_TYPE, DATE_CREATED, DATE_UPDATED, IS_DELETED, UPDATED_BY) VALUES (LEFT(REPLACE(UUID(),'-',''),16), ?, ?, CURDATE(), CURDATE(), '$isDeleted', '$getActiveUser')");

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