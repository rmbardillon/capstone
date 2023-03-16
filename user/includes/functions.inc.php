<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

function insertUser($connection, $firstName, $middleName, $lastName, $suffix, $username, $email, $barangay, $vkey, $password){
    $message = "You have received this email because you sign up for an account in our website. Please click the link below to verify your account. <br><br><a href='http://localhost/capstone/user/includes/verify.inc.php?vkey=$vkey'>Click here to verify email</a>";
    $sql = "INSERT INTO user (username, last_name, suffix, first_name, middle_name, email, barangay, vkey, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    $stmt = $connection->prepare($sql);

    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    mysqli_stmt_bind_param($stmt, "sssssssss", $username, $lastName, $suffix, $firstName, $middleName, $email, $barangay, $vkey, $hashedPassword);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    email("CSWDO Santa Rosa", "Email verification", "populationmanagementsystem@gmail.com", "$firstName $middleName $lastName", $email, $message);
    header("location: ../verify.html");
    exit();
}

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

function userExists($connection, $firstName, $middleName, $lastName) {
    $sql = "SELECT * FROM user WHERE first_name=? and middle_name=? and last_name=?";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../sign-up.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "sss", $firstName, $middleName, $lastName);
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

function usernameExists($connection, $username){
    $sql = "SELECT * FROM user WHERE username=?";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../create-account.html?error=stmterror");
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

function emailExists($connection, $email) { 
    $sql = "SELECT * FROM user WHERE email=?";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../create-account.html?error=stmterror");
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

function loginCredentialsExists($connection, $username, $email) {
    $sql = "SELECT * FROM user_account WHERE USERNAME=?";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../index.html?error=stmterror");
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

function updateLoginAttempt($connection, $loginAttempts, $id) {
    $sql = "UPDATE user_account SET LOGIN_ATTEMPTS = ? WHERE PERSON_ID = ?;";
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

    mysqli_stmt_bind_param($stmt, "ss", $loginAttempts, $id);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
}

function updateAccountStatus($connection, $isLocked, $id) {
    $sql = "UPDATE user_account SET IS_LOCKED = ? WHERE PERSON_ID = ?;";
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

    mysqli_stmt_bind_param($stmt, "ss", $isLocked, $id);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
}

function loginUser($connection, $username, $password){
    $loginCredentialsExists = loginCredentialsExists($connection, $username, $username);
    if ($loginCredentialsExists === false) {
        header("location: ../../login/citizen.html?error=error");
        exit();
    }
    if ($loginCredentialsExists['IS_LOCKED'] === 1) {
        header("location: ../../login/citizen.html?error=accountlocked");
        exit();
    }
    
    $passwordhashed = $loginCredentialsExists['PASSWORD'];
    $checkPassword = password_verify($password, $passwordhashed);

    if ($checkPassword === false) {
        $loginAttempts = $loginCredentialsExists['LOGIN_ATTEMPTS'] + 1;
        updateLoginAttempt($connection, $loginAttempts, $loginCredentialsExists['PERSON_ID']);
        $loginCredentialsExists = loginCredentialsExists($connection, $username, $username);
        if($loginCredentialsExists['LOGIN_ATTEMPTS'] == 3) {
            updateAccountStatus($connection, 1, $loginCredentialsExists['PERSON_ID']);
            header("location: ../../login/citizen.html?error=accountlocked");
            exit();
        }
        header("location: ../../login/citizen.html?login_attempts=$loginAttempts");
        exit();
    }
    else if($checkPassword === true) {
        session_start();
        updateLoginAttempt($connection, 0, $loginCredentialsExists['PERSON_ID']);
        $_SESSION['isNearingExpiration'] = $isNearingExpiration = checkExpiration($connection, $loginCredentialsExists['PERSON_ID']);
        $_SESSION['username'] = $loginCredentialsExists['USERNAME'];
        $_SESSION['userData'] = $loginCredentialsExists;
        if($isNearingExpiration != false) {
            header("location: ../home.html?warning=true&expirationDate=".$_SESSION['isNearingExpiration']['EXPIRATION_DATE']);
            exit();
        }
        header("location: ../home.html");
        exit();
    }
}

function checkExpiration($connection, $person_id) {
    $sql = "SELECT *
            FROM issued_id
            WHERE EXPIRATION_DATE > CURRENT_DATE() AND EXPIRATION_DATE < DATE_ADD(CURRENT_DATE(), INTERVAL 1 MONTH) AND PERSON_ID = ?;";

    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../index.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "s", $person_id);
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

function changePassword($connection, $oldPassword, $newPassword, $confirmPassword) {
    session_start();
    $username = $_SESSION['username'];
    $loginCredentialsExists = loginCredentialsExists($connection, $username, $username);
    $passwordhashed = $loginCredentialsExists['PASSWORD'];
    $checkPassword = password_verify($oldPassword, $passwordhashed);

    if ($checkPassword === false) {
        header("location: ../change-password.html?error=wrongpassword");
        exit();
    } else {
        if ($confirmPassword != $newPassword) {
            header("location: ../change-password.html?error=passwordcheck");
            exit();
        } else {
            $sql = "UPDATE user_account SET PASSWORD=? WHERE USERNAME=?";
            $stmt = $connection->prepare($sql);

            $hashedPassword = password_hash($confirmPassword, PASSWORD_DEFAULT);

            mysqli_stmt_bind_param($stmt, "ss", $hashedPassword, $username);
            mysqli_stmt_execute($stmt); 
            mysqli_stmt_close($stmt);
            header("location: ../change-password.html?success=passwordchanged");
            exit();
        }
    }
}

function insertPWDData($connection, $username, $registrationType, $transferID, $changeInfoID, $pwdNumber, $dateApplied, $pwdLastName, $pwdFirstName, $pwdMiddleName, $pwdSuffix, $typeOfDisability, $medicalCondition,
                $causeOfDisability, $congenitalInborn, $acquired, $statusOfDisability, $address, $barangay, $landline, $mobileNumber, $email, $dateOfBirth, $sex, $religion, $civilStatus,
                $educationalAttainment, $isVoter, $employmentStatus, $income, $categoryOfEmployment, $natureOfEmployment, $occupation, $otherOccupation, $is4PsBeneficiary, $bloodType,
                $organizationAffiliated, $contactPerson, $officeAddress, $telNumber, $sssNumber, $gsisNumber, $psnNumber, $philHealthNumber, $philHealthMemberType, $fatherLastName, 
                $fatherFirstName, $fatherMiddleName, $motherLastName, $motherFirstName, $motherMiddleName, $guardianLastName, $guardianFirstName, $guardianMiddleName, $guardianRelationship,
                $guardianContactNumber, $accomplishedBy, $nameOfAccomplisher, $nameOfPhysician, $licenseNumber, $status, $columnName) {
    $sql = "INSERT INTO pwd_data(username, registration_type, transfer_id, change_info_id, pwd_number, date_applied, pwd_last_name, pwd_first_name, pwd_middle_name, pwd_suffix, 
    type_of_disability, medical_condition, cause_of_disability, congenital_inborn, acquired, status_of_disability, houseno_street_subdivision_address, barangay, 
    landline, mobile_number, email, date_of_birth, sex, religion, civil_status, educational_attainment, is_voter, 
    employment_status, income, category_of_employment, nature_of_employment, occupation, other_occupation, is_4ps_beneficiary, blood_type, organization_affiliated, 
    contact_person, office_address, office_telephone_number, sss_number, gsis_number, psn_number, philhealth_number, philhealth_member_type, father_last_name, 
    father_first_name, father_middle_name, mother_last_name, mother_first_name, mother_middle_name, guardian_last_name, guardian_first_name, guardian_middle_name, 
    guardian_relationship, guardian_contact_number, accomplished_by, name_of_accomplisher, name_of_physician, license_number, status) 
    VALUES  (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 
             ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 
             ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
             ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
             ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
             ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../home.html?error=stmterror");
        exit();
    }
    mysqli_stmt_bind_param($stmt, "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss", $username, $registrationType, $transferID, $changeInfoID, $pwdNumber, $dateApplied, $pwdLastName, $pwdFirstName, $pwdMiddleName, 
                $pwdSuffix, $typeOfDisability, $medicalCondition, $causeOfDisability, $congenitalInborn, $acquired, $statusOfDisability, $address, $barangay, $landline, $mobileNumber, $email, 
                $dateOfBirth, $sex, $religion, $civilStatus, $educationalAttainment, $isVoter, $employmentStatus, $income, $categoryOfEmployment, $natureOfEmployment, $occupation, 
                $otherOccupation, $is4PsBeneficiary, $bloodType, $organizationAffiliated, $contactPerson, $officeAddress, $telNumber, $sssNumber, $gsisNumber, $psnNumber, 
                $philHealthNumber, $philHealthMemberType, $fatherLastName, $fatherFirstName, $fatherMiddleName, $motherLastName, $motherFirstName, $motherMiddleName, 
                $guardianLastName, $guardianFirstName, $guardianMiddleName, $guardianRelationship, $guardianContactNumber, $accomplishedBy, $nameOfAccomplisher, $nameOfPhysician, $licenseNumber, $status);

    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
    updateUserData($connection, $username, $columnName);
    header("location: ../home.html?error=none");
    exit();
}

function updatePWDData($connection, $username, $registrationType, $transferID, $changeInfoID, $pwdNumber, $dateApplied, $pwdLastName, $pwdFirstName, $pwdMiddleName, $pwdSuffix, $typeOfDisability, $medicalCondition,
                $causeOfDisability, $congenitalInborn, $acquired, $statusOfDisability, $address, $barangay, $landline, $mobileNumber, $email, $dateOfBirth, $sex, $religion, $civilStatus,
                $educationalAttainment, $isVoter, $employmentStatus, $income, $categoryOfEmployment, $natureOfEmployment, $occupation, $otherOccupation, $is4PsBeneficiary, $bloodType,
                $organizationAffiliated, $contactPerson, $officeAddress, $telNumber, $sssNumber, $gsisNumber, $psnNumber, $philHealthNumber, $philHealthMemberType, $fatherLastName, 
                $fatherFirstName, $fatherMiddleName, $motherLastName, $motherFirstName, $motherMiddleName, $guardianLastName, $guardianFirstName, $guardianMiddleName, $guardianRelationship,
                $guardianContactNumber, $accomplishedBy, $nameOfAccomplisher, $nameOfPhysician, $licenseNumber, $status, $columnName) {
    $sql = "UPDATE pwd_data SET registration_type = ?, transfer_id = ?, change_info_id = ?, pwd_number = ?, date_applied = ?, pwd_last_name = ?, pwd_first_name = ?, pwd_middle_name = ?, pwd_suffix = ?, 
    type_of_disability = ?, medical_condition = ?, cause_of_disability = ?, congenital_inborn = ?, acquired = ?, status_of_disability = ?, houseno_street_subdivision_address = ?, barangay = ?, 
    landline = ?, mobile_number = ?, email = ?, date_of_birth = ?, sex = ?, religion = ?, civil_status = ?, educational_attainment = ?, is_voter = ?, 
    employment_status = ?, income = ?, category_of_employment = ?, nature_of_employment = ?, occupation = ?, other_occupation = ?, is_4ps_beneficiary = ?, blood_type = ?, organization_affiliated = ?, 
    contact_person = ?, office_address = ?, office_telephone_number = ?, sss_number = ?, gsis_number = ?, psn_number = ?, philhealth_number = ?, philhealth_member_type = ?, father_last_name = ?, 
    father_first_name = ?, father_middle_name = ?, mother_last_name = ?, mother_first_name = ?, mother_middle_name = ?, guardian_last_name = ?, guardian_first_name = ?, guardian_middle_name = ?, 
    guardian_relationship = ?, guardian_contact_number = ?, accomplished_by = ?, name_of_accomplisher = ?, name_of_physician = ?, license_number = ?, status = ? WHERE username = ?;";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../home.html?error=stmterror");
        exit();
    }
    mysqli_stmt_bind_param($stmt, "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss", $registrationType, $transferID, $changeInfoID, $pwdNumber, $dateApplied, $pwdLastName, $pwdFirstName, $pwdMiddleName, 
                $pwdSuffix, $typeOfDisability, $medicalCondition, $causeOfDisability, $congenitalInborn, $acquired, $statusOfDisability, $address, $barangay, $landline, $mobileNumber, $email, 
                $dateOfBirth, $sex, $religion, $civilStatus, $educationalAttainment, $isVoter, $employmentStatus, $income, $categoryOfEmployment, $natureOfEmployment, $occupation, 
                $otherOccupation, $is4PsBeneficiary, $bloodType, $organizationAffiliated, $contactPerson, $officeAddress, $telNumber, $sssNumber, $gsisNumber, $psnNumber, 
                $philHealthNumber, $philHealthMemberType, $fatherLastName, $fatherFirstName, $fatherMiddleName, $motherLastName, $motherFirstName, $motherMiddleName, 
                $guardianLastName, $guardianFirstName, $guardianMiddleName, $guardianRelationship, $guardianContactNumber, $accomplishedBy, $nameOfAccomplisher, $nameOfPhysician, $licenseNumber, $status, $username);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
    updateUserData($connection, $username, $columnName);
    header("location: ../home.html?error=none");
    exit();
}

function insertSoloParentData($connection, $username, $solo_parent_name, $age, $sex, $date_of_birth, $place_of_birth, $address, $barangay, 
                            $educ_attainment, $occupation, $income, $fam_income, $tenurial, $religion, $contact_number, $marital_status, $classification_incidence,
                            $classification_when, $problems, $family_resources, $date_applied, $family_composition_name, $family_composition_relationship, $family_composition_age, 
                         $family_composition_civil_status, $family_composition_educ_attainment, $family_composition_occupation, $family_composition_monthly_income, $combinedArray, $columnName) {
    $sql = "INSERT INTO solo_parent_data(username, solo_parent_name, age, sex, date_of_birth, place_of_birth, address, barangay, educ_attainment, occupation, 
    income, fam_income, tenurial, religion, contact_number, marital_status, classification_incidence, classification_when, problems, family_resources, 
    date_applied) 
    VALUES  (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
            ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../home.html?error=stmterror");
        exit();
    }
    mysqli_stmt_bind_param($stmt, "sssssssssssssssssssss", $username, $solo_parent_name, $age, $sex, $date_of_birth, $place_of_birth, $address, $barangay, 
                         $educ_attainment, $occupation, $income, $fam_income, $tenurial, $religion, $contact_number, $marital_status, $classification_incidence,
                         $classification_when, $problems, $family_resources, $date_applied);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
    for ($i=0; $i < count($family_composition_name); $i++) {
        $sql = "INSERT INTO solo_parent_family_composition(username, name, relationship, age, civil_status, educ_attainment, occupation, monthly_income) VALUES (?,?,?,?,?,?,?,?);";
        $stmt = $connection->prepare($sql);
        mysqli_stmt_bind_param($stmt, "ssssssss", $username, $family_composition_name[$i], $family_composition_relationship[$i], $family_composition_age[$i], $family_composition_civil_status[$i], $family_composition_educ_attainment[$i], $family_composition_occupation[$i], $family_composition_monthly_income[$i]);
        mysqli_stmt_execute($stmt); 
        mysqli_stmt_close($stmt);
    }
    updateUserData($connection, $username, $columnName);
    header("location: ../home.html?error=none");
    exit();
}

function updateSoloParentData($connection, $username, $solo_parent_name, $age, $sex, $date_of_birth, $place_of_birth, $address, $barangay, 
                            $educ_attainment, $occupation, $income, $fam_income, $tenurial, $religion, $contact_number, $marital_status, $classification_incidence,
                            $classification_when, $problems, $family_resources, $date_applied, $family_composition_name, $family_composition_relationship, $family_composition_age, 
                         $family_composition_civil_status, $family_composition_educ_attainment, $family_composition_occupation, $family_composition_monthly_income, $combinedArray, 
                         $columnName, $id) {
    $presentID = implode(',', $id);
    $sql = "DELETE FROM solo_parent_family_composition WHERE id NOT IN($presentID) AND username = '$username'";
    mysqli_query($connection, $sql);
    for ($i=0; $i < count($family_composition_name); $i++) {
        $sql = "REPLACE INTO solo_parent_family_composition(id, username, name, relationship, age, civil_status, educ_attainment, occupation, monthly_income) VALUES (?,?,?,?,?,?,?,?,?);";
        $stmt = $connection->prepare($sql);
        if (!mysqli_stmt_prepare($stmt, $sql)) {
            header("location: ../home.html?error=stmterror");
            exit();
        }
        mysqli_stmt_bind_param($stmt, "sssssssss", $id[$i], $username, $family_composition_name[$i], $family_composition_relationship[$i], $family_composition_age[$i], $family_composition_civil_status[$i], $family_composition_educ_attainment[$i], $family_composition_occupation[$i], $family_composition_monthly_income[$i]);
        if (mysqli_stmt_execute($stmt)) {
            echo("Success $i");
        } 
        mysqli_stmt_close($stmt);
    }
    $sql = "UPDATE solo_parent_data SET solo_parent_name = ?, age = ?, sex = ?, date_of_birth = ?, place_of_birth = ?, address = ?, barangay = ?, educ_attainment = ?, occupation = ?, 
    income = ?, fam_income = ?, tenurial = ?, religion = ?, contact_number = ?, marital_status = ?, classification_incidence = ?, classification_when = ?, problems = ?, family_resources = ?, 
    date_applied = ? WHERE username = ?;";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../home.html?error=stmterror");
        exit();
    }
    mysqli_stmt_bind_param($stmt, "sssssssssssssssssssss", $solo_parent_name, $age, $sex, $date_of_birth, $place_of_birth, $address, $barangay, 
                         $educ_attainment, $occupation, $income, $fam_income, $tenurial, $religion, $contact_number, $marital_status, $classification_incidence,
                         $classification_when, $problems, $family_resources, $date_applied, $username);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
    header("location: ../home.html?error=none");
    exit();
}

function insertSeniorCitizenData($connection, $username, $registration_type, $lostNumber, $sr_citizen_num, $sr_citizen_first_name, $sr_citizen_middle_name, $sr_citizen_last_name, 
                                $sr_citizen_suffix, $barangay, $tirahan, $sex, $marital_status, $edad, $date_of_birth, $lugar_ng_kapanganakan, $telepono, $relihiyon, $hanapbuhay, $pensyon, 
                                $saan, $magkano, $pangalan_ng_asawa, $edad_asawa, $ilan_ang_anak, $kasama, $columnName, $family_composition_name, $family_composition_age, $family_composition_address,
                                $family_composition_contact, $status) {
    $sql = "INSERT INTO senior_citizen_data(username, registration_type, lost_number, sr_citizen_num, sr_citizen_first_name, sr_citizen_middle_name, sr_citizen_last_name, 
    sr_citizen_suffix, barangay, tirahan, sex, marital_status, edad, date_of_birth, lugar_ng_kapanganakan, telepono, relihiyon, hanapbuhay, pensyon, saan, 
    magkano, pangalan_ng_asawa, edad_asawa, ilan_ang_anak, kasama, status) 
    VALUES  (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
             ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 
             ?, ?, ?, ?, ?);";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../home.html?error=stmterror");
        exit();
    }
    mysqli_stmt_bind_param($stmt, "ssssssssssssssssssssssssss", $username, $registration_type, $lostNumber, $sr_citizen_num, $sr_citizen_first_name, $sr_citizen_middle_name, $sr_citizen_last_name, 
                          $sr_citizen_suffix, $barangay, $tirahan, $sex, $marital_status, $edad, $date_of_birth, $lugar_ng_kapanganakan, $telepono, $relihiyon, $hanapbuhay, $pensyon, 
                          $saan, $magkano, $pangalan_ng_asawa, $edad_asawa, $ilan_ang_anak, $kasama, $status);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
    for ($i=0; $i < count($family_composition_name); $i++) {
        $sql = "INSERT INTO senior_citizen_family_composition(username, name, age, address, contact) VALUES (?,?,?,?,?);";
        $stmt = $connection->prepare($sql);
        mysqli_stmt_bind_param($stmt, "sssss", $username, $family_composition_name[$i], $family_composition_age[$i], $family_composition_address[$i], $family_composition_contact[$i]);
        mysqli_stmt_execute($stmt); 
        mysqli_stmt_close($stmt);
    }  
    updateUserData($connection, $username, $columnName);
    header("location: ../home.html?error=none");
    exit();
}

function updateSeniorCitizenData($connection, $username, $registration_type, $lostNumber, $sr_citizen_num, $sr_citizen_first_name, $sr_citizen_middle_name, $sr_citizen_last_name, 
                                $sr_citizen_suffix, $barangay, $tirahan, $sex, $marital_status, $edad, $date_of_birth, $lugar_ng_kapanganakan, $telepono, $relihiyon, $hanapbuhay, $pensyon, 
                                $saan, $magkano, $pangalan_ng_asawa, $edad_asawa, $ilan_ang_anak, $kasama, $columnName, $family_composition_name, $family_composition_age, $family_composition_address,
                                $family_composition_contact, $status, $id) {
    $presentID = '';
    if($family_composition_name !== NULL) {
        if ($id !== NULL) {
            $presentID = implode(',', $id);
            $sql = "DELETE FROM senior_citizen_family_composition WHERE id NOT IN($presentID) AND username = '$username'";
            mysqli_query($connection, $sql);
        }
        
        for ($i=0; $i < count($family_composition_name); $i++) {
            $sql = "REPLACE INTO senior_citizen_family_composition(id, username, name, age, address, contact) VALUES (?,?,?,?,?,?);";
            $stmt = $connection->prepare($sql);
            if (!mysqli_stmt_prepare($stmt, $sql)) {
                header("location: ../home.html?error=stmterror");
                exit();
            }
            mysqli_stmt_bind_param($stmt, "ssssss", $id[$i], $username, $family_composition_name[$i], $family_composition_age[$i], $family_composition_address[$i], $family_composition_contact[$i]);
            if (mysqli_stmt_execute($stmt)) {
                echo("Success $i");
            } 
            mysqli_stmt_close($stmt);
        }
    } else {
        $sql = "DELETE FROM senior_citizen_family_composition WHERE username = '$username'";
        mysqli_query($connection, $sql);
    }
    

    $sql = "UPDATE senior_citizen_data SET registration_type = ?, lost_number = ?, sr_citizen_num = ?, sr_citizen_first_name = ?, sr_citizen_middle_name = ?, sr_citizen_last_name = ?, 
    sr_citizen_suffix = ?, barangay = ?, tirahan = ?, sex = ?, marital_status = ?, edad = ?, date_of_birth = ?, lugar_ng_kapanganakan = ?, telepono = ?, relihiyon = ?, hanapbuhay = ?, pensyon = ?, saan = ?, 
    magkano = ?, pangalan_ng_asawa = ?, edad_asawa = ?, ilan_ang_anak = ?, kasama = ?, status = ? WHERE username = ?;";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../home.html?error=stmterror");
        exit();
    }
    mysqli_stmt_bind_param($stmt, "ssssssssssssssssssssssssss", $registration_type, $lostNumber, $sr_citizen_num, $sr_citizen_first_name, $sr_citizen_middle_name, $sr_citizen_last_name, 
                          $sr_citizen_suffix, $barangay, $tirahan, $sex, $marital_status, $edad, $date_of_birth, $lugar_ng_kapanganakan, $telepono, $relihiyon, $hanapbuhay, $pensyon, 
                          $saan, $magkano, $pangalan_ng_asawa, $edad_asawa, $ilan_ang_anak, $kasama, $status, $username);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
    header("location: ../home.html?error=none");
    exit();
}

function insertSeniorCitizenBirthdayCashGift($connection, $username, $last_name, $name, $middle_name, $osca_id_number, $address, $barangay, $date_of_birth, $contact_number) {
    $sql = "INSERT INTO sr_citizen_birthday_cash_gift(username, last_name, name, middle_name, osca_id_number, address, barangay, date_of_birth, contact_number) 
    VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../home.html?error=stmterror");
        exit();
    }
    mysqli_stmt_bind_param($stmt, "sssssssss", $username, $last_name, $name, $middle_name, $osca_id_number, $address, $barangay, $date_of_birth, $contact_number);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);

    header("location: ../home.html?error=none");
    exit();
}

function insertSeniorCitizenBirthdayCashIncentive($connection, $username, $last_name, $first_name, $middle_name, $osca_id_number, $address, $barangay,$date_of_birth, $contact_number) {
    $sql = "INSERT INTO sr_citizen_birthday_cash_incentive(username, last_name, first_name, middle_name, osca_id_number, address, barangay, date_of_birth, contact_number) 
    VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../home.html?error=stmterror");
        exit();
    }
    mysqli_stmt_bind_param($stmt, "sssssssss",$username, $last_name, $first_name, $middle_name, $osca_id_number, $address, $barangay,$date_of_birth, $contact_number);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);

    header("location: ../home.html?error=none");
    exit();
}

function userDataExists($connection, $username, $table) {
    $sql = "SELECT * FROM ".$table." WHERE username=?";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../home.html?error=stmterror");
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

function updateUserData($connection, $username, $columnName) {
    $answer = "Yes";
    $sql = "UPDATE user SET $columnName = ? WHERE username = ?;";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../home.html?error=stmterror");
        exit();
    }
    mysqli_stmt_bind_param($stmt, "ss", $answer, $username);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
    $_SESSION['idType'] = $columnName;
}

function profileExisting($connection, $username, $email){
    $sql = "SELECT * FROM media WHERE username=? OR username=?";
    $stmt = mysqli_stmt_init($connection);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../home.html?error=stmterror");
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
        $sql = "INSERT INTO media(USERNAME, IMAGE_LOCATION) VALUES (?, ?);";
        $stmt = mysqli_stmt_init($connection);
        if (!mysqli_stmt_prepare($stmt, $sql)) {
            header("location: ../home.html?error=stmterror");
            exit();
        }
        mysqli_stmt_bind_param($stmt, "ss", $username, $fileName);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_close($stmt);
    } else {
        move_uploaded_file($fileTmpName, $fileDestination);
        unlink("../uploads/".$profileExists["IMAGE_LOCATION"]);
        $sql = "UPDATE media SET
        IMAGE_LOCATION = ?
        WHERE USERNAME = ?;";
        $stmt = mysqli_stmt_init($connection);
        if (!mysqli_stmt_prepare($stmt, $sql)) {
            header("location: ../home.html?error=stmterror");
            exit();
        }
        mysqli_stmt_bind_param($stmt, "ss", $fileName, $username);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_close($stmt);
    }
    header("location: ../profile.html?error=none");
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

function getAnnouncements($connection, $barangay, $for, $userBirthday) {
    $data = [];
    if($for == "Senior Citizen") {
        $sql = "SELECT * FROM announcement WHERE (BARANGAY = '$barangay' OR BARANGAY = 'All') AND (ANNOUNCEMENT_FOR = '$for' OR ANNOUNCEMENT_FOR = 'All') AND ((MONTH('$userBirthday') BETWEEN 1 AND 6 AND DATE_FROM = '01') OR (MONTH('$userBirthday') BETWEEN 7 AND 12 AND DATE_FROM = '02'))";
    } else {
        $sql = "SELECT * FROM announcement WHERE (BARANGAY = '$barangay' OR BARANGAY = 'All') AND (ANNOUNCEMENT_FOR = '$for' OR ANNOUNCEMENT_FOR = 'All')";
    }
    
    $result = $connection->query($sql);

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            array_push($data, $row);
        }
    }
    return $data;
}

//password validation
function validatePassword($password) {
    $hasNumber = false;
    $hasUppercase = false;
    $hasSpecialChar = false;

    for ($i = 0; $i < strlen($password); $i++) {
        if (is_numeric($password[$i])) {
            $hasNumber = true;
        } else if (ctype_upper($password[$i])) {
            $hasUppercase = true;
        } else if (ctype_punct($password[$i])) {
            $hasSpecialChar = true;
        }
    }

    return $hasNumber && $hasUppercase && $hasSpecialChar && strlen($password) <= 64;
}
