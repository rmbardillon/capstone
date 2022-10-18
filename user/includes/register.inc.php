<?php

if (isset($_POST['pwd-register'])) {
    session_start();
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';
    
    $username = $_SESSION['username'];
    $registrationType = $_POST['idType'];
    $transferID = $_POST['textTransfer'];
    $changeInfoID = $_POST['textChangeInfo'];
    if (!empty($_POST['pwdNumber1']) and !empty($_POST['pwdNumber2'])) {
        $pwdNumber = "0434280".$_POST['pwdNumber1'].$_POST['pwdNumber2'];
    } else {
        $pwdNumber = NULL;
    }
    $dateApplied = date('Y-m-d', strtotime($_POST['dateApplied']));
    $pwdLastName = $_POST['lastName'];
    $pwdFirstName = $_POST['firstName'];
    $pwdMiddleName = $_POST['middleName'];
    $pwdSuffix = $_POST['suffix'];
    if (isset($_POST['typeOfDisability'])) {
        $str = $_POST['typeOfDisability'];
        $typeOfDisability = implode (",", $str);
    } else {
        $typeOfDisability = NULL;
    }
    if (!empty($_POST['medicalCondition'])) {
        $medicalCondition = $_POST['medicalCondition'];
    } else {
        $medicalCondition = NULL;
    }
    $causeOfDisabilityArray = array();
    if(isset($_POST['congenital']) ){
        if (sizeOf($_POST['congenital']) > 0) {
            array_push($causeOfDisabilityArray, "Congenital/Inborn");
        }
    }
    if (isset($_POST['acquired'])) {
        if (sizeOf($_POST['acquired']) > 0) {
            array_push($causeOfDisabilityArray, "Acquired");
        }
    }
    $causeOfDisability = implode (",", $causeOfDisabilityArray);

    if (isset($_POST['congenital'])) {
        $str = $_POST['congenital'];
        $congenitalInborn = implode (",", $str);
    } else {
        $congenitalInborn = NULL;
    }
    if (isset($_POST['acquired'])) {
        $str = $_POST['acquired'];
        $acquired = implode (",", $str);
    } else {
        $acquired = NULL;
    }
    $statusOfDisability = $_POST['statusOfDisability'];
    if (!empty($_POST['address'])) {
        $address = $_POST['address'];
    } else {
        $address = NULL;
    }
    $barangay = $_POST['barangay'];
    if (!empty($_POST['landline'])) {
        $landline = $_POST['landline'];
    } else {
        $landline = NULL;
    }
    if (!empty($_POST['mobileNumber'])) {
        $mobileNumber = $_POST['mobileNumber'];
    } else {
        $mobileNumber = NULL;
    }
    $email = $_POST['email'];
    $dateOfBirth = date('Y-m-d', strtotime($_POST['dob']));
    $sex = $_POST['sex'];
    $religion = $_POST['religion'];
    $civilStatus = $_POST['civilStatus'];
    $educationalAttainment = $_POST['educationalAttainment'];
    $isVoter = $_POST['isVoter'];
    $employmentStatus = $_POST['employmentStatus'];
    if (isset($_POST['income'])) {
        $income = $_POST['income'];
    } else {
        $income = "0.00";
    }
    if (isset($_POST['categoryOfEmployment'])) {
        $categoryOfEmployment = $_POST['categoryOfEmployment'];
    } else {
        $categoryOfEmployment = NULL;
    }
    if (isset($_POST['natureOfEmployment'])) {
        $natureOfEmployment = $_POST['natureOfEmployment'];
    } else {
        $natureOfEmployment = NULL;
    }
    if (isset($_POST['occupation'])) {
        $occupation = $_POST['occupation'];
    } else {
        $occupation = NULL;
    }
    if (!empty($_POST['otherOccupation'])) {
        $otherOccupation = $_POST['otherOccupation'];
    } else {
        $otherOccupation = NULL;
    }
    $is4PsBeneficiary = $_POST['4psBeneficiary'];
    if (isset($_POST['bloodType'])) {
        $bloodType = $_POST['bloodType'];
    } else {
        $bloodType = NULL;
    }
    if (!empty($_POST['organization'])) {
        $organizationAffiliated = $_POST['organization'];
    } else {
        $organizationAffiliated = NULL;
    }
    if (!empty($_POST['contactPerson'])) {
        $contactPerson = $_POST['contactPerson'];
    } else {
        $contactPerson = NULL;
    }
    if (!empty($_POST['officeAddress'])) {
        $officeAddress = $_POST['officeAddress'];
    } else {
        $officeAddress = NULL;
    }
    if (!empty($_POST['telNumber'])) {
        $telNumber = $_POST['telNumber'];
    } else {
        $telNumber = NULL;
    }
    if (!empty($_POST['sssNumber'])) {
        $sssNumber = $_POST['sssNumber'];
    } else {
        $sssNumber = NULL;
    }
    if (!empty($_POST['gsisNumber'])) {
        $gsisNumber = $_POST['gsisNumber'];
    } else {
        $gsisNumber = NULL;
    }
    if (!empty($_POST['psnNumber'])) {
        $psnNumber = $_POST['psnNumber'];
    } else {
        $psnNumber = NULL;
    }
    if (!empty($_POST['philHealthNumber'])) {
        $philHealthNumber = $_POST['philHealthNumber'];
    } else {
        $philHealthNumber = NULL;
    }
    if (isset($_POST['philHealthMemberType'])) {
        $philHealthMemberType = $_POST['philHealthMemberType'];
    } else {
        $philHealthMemberType = NULL;
    }
    if (!empty($_POST['fatherLastName'])) {
        $fatherLastName = $_POST['fatherLastName'];
    } else {
        $fatherLastName = NULL;
    }
    if (!empty($_POST['fatherFirstName'])) {
        $fatherFirstName = $_POST['fatherFirstName'];
    } else {
        $fatherFirstName = NULL;
    }
    if (!empty($_POST['fatherMiddleName'])) {
        $fatherMiddleName = $_POST['fatherMiddleName'];
    } else {
        $fatherMiddleName = NULL;
    }
    if (!empty($_POST['motherLastName'])) {
        $motherLastName = $_POST['motherLastName'];
    } else {
        $motherLastName = NULL;
    }
    if (!empty($_POST['motherFirstName'])) {
        $motherFirstName = $_POST['motherFirstName'];
    } else {
        $motherFirstName = NULL;
    }
    if (!empty($_POST['motherMiddleName'])) {
        $motherMiddleName = $_POST['motherMiddleName'];
    } else {
        $motherMiddleName = NULL;
    }
    if (!empty($_POST['guardianLastName'])) {
        $guardianLastName = $_POST['guardianLastName'];
    } else {
        $guardianLastName = NULL;
    }
    if (!empty($_POST['guardianFirstName'])) {
        $guardianFirstName = $_POST['guardianFirstName'];
    } else {
        $guardianFirstName = NULL;
    }
    if (!empty($_POST['guardianMiddleName'])) {
        $guardianMiddleName = $_POST['guardianMiddleName'];
    } else {
        $guardianMiddleName = NULL;
    }
    if (!empty($_POST['guardianRelationship'])) {
        $guardianRelationship = $_POST['guardianRelationship'];
    } else {
        $guardianRelationship = NULL;
    }
    if (!empty($_POST['guardianContactNumber'])) {
        $guardianContactNumber = $_POST['guardianContactNumber'];
    } else {
        $guardianContactNumber = NULL;
    }
    $accomplishedBy = $_POST['accomplishedBy'];
    $nameOfAccomplisher = $_POST['nameOfAccomplisher'];
    $nameOfPhysician = $_POST['nameOfPhysician'];
    $licenseNumber = $_POST['licenseNumber'];
    $status = "Pending";
    $columnName = "is_pwd";
    $image = $_FILES['file'];

    if ($image['name'] != "") {
        $fileName = $image['name'];
        $fileTmpName = $image['tmp_name'];
        $fileSize = $image['size'];
        $fileError = $image['error'];
        $fileType = $image['type'];
        $fileExt = explode('.', $fileName);
        $fileActualExt = strtolower(end($fileExt));
        $allowed = array('jpg', 'jpeg', 'png', '');

        if (in_array($fileActualExt, $allowed)) {
            if ($fileError === 0) {
                $newFileName = uniqid('', true).".".$fileActualExt;
                $fileDestination = "../uploads/".$newFileName;
                $_SESSION['profileDestination'] = $fileDestination;
                insertProfile($connection, $username, $newFileName, $fileTmpName, $fileDestination);
            } else {
                header("location: ../profile.html?error=therewasanerror");
                exit();
            }
        } else {
            header("location: ../profile.html?error=filenotallowed");
            exit();
        }
    } 
    insertPWDData($connection, $username, $registrationType, $transferID, $changeInfoID, $pwdNumber, $dateApplied, $pwdLastName, $pwdFirstName, $pwdMiddleName, $pwdSuffix, $typeOfDisability, $medicalCondition,
                $causeOfDisability, $congenitalInborn, $acquired, $statusOfDisability, $address, $barangay, $landline, $mobileNumber, $email, $dateOfBirth, $sex, $religion, $civilStatus,
                $educationalAttainment, $isVoter, $employmentStatus, $income, $categoryOfEmployment, $natureOfEmployment, $occupation, $otherOccupation, $is4PsBeneficiary, $bloodType,
                $organizationAffiliated, $contactPerson, $officeAddress, $telNumber, $sssNumber, $gsisNumber, $psnNumber, $philHealthNumber, $philHealthMemberType, $fatherLastName, 
                $fatherFirstName, $fatherMiddleName, $motherLastName, $motherFirstName, $motherMiddleName, $guardianLastName, $guardianFirstName, $guardianMiddleName, $guardianRelationship,
                $guardianContactNumber, $accomplishedBy, $nameOfAccomplisher, $nameOfPhysician, $licenseNumber, $status, $columnName);

} 
else if (isset($_POST['pwd-update'])) {
    session_start();
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';
    
    $username = $_SESSION['username'];
    $registrationType = $_POST['idType'];
    $transferID = $_POST['textTransfer'];
    $changeInfoID = $_POST['textChangeInfo'];
    if (!empty($_POST['pwdNumber1']) and !empty($_POST['pwdNumber2'])) {
        $pwdNumber = "0434280".$_POST['pwdNumber1'].$_POST['pwdNumber2'];
    } else {
        $pwdNumber = NULL;
    }
    $dateApplied = date('Y-m-d', strtotime($_POST['dateApplied']));
    $pwdLastName = $_SESSION['last_name'];
    $pwdFirstName = $_SESSION['first_name'];
    $pwdMiddleName = $_SESSION['middle_name'];
    $pwdSuffix = $_SESSION['suffix'];
    if (isset($_POST['typeOfDisability'])) {
        $str = $_POST['typeOfDisability'];
        $typeOfDisability = implode (",", $str);
    } else {
        $typeOfDisability = NULL;
    }
    if (!empty($_POST['medicalCondition'])) {
        $medicalCondition = $_POST['medicalCondition'];
    } else {
        $medicalCondition = NULL;
    }
    $causeOfDisabilityArray = array();
    if(isset($_POST['congenital']) ){
        if (sizeOf($_POST['congenital']) > 0) {
            array_push($causeOfDisabilityArray, "Congenital/Inborn");
        }
    }
    if (isset($_POST['acquired'])) {
        if (sizeOf($_POST['acquired']) > 0) {
            array_push($causeOfDisabilityArray, "Acquired");
        }
    }
    $causeOfDisability = implode (",", $causeOfDisabilityArray);

    if (isset($_POST['congenital'])) {
        $str = $_POST['congenital'];
        $congenitalInborn = implode (",", $str);
    } else {
        $congenitalInborn = NULL;
    }
    if (isset($_POST['acquired'])) {
        $str = $_POST['acquired'];
        $acquired = implode (",", $str);
    } else {
        $acquired = NULL;
    }
    $statusOfDisability = $_POST['statusOfDisability'];
    if (!empty($_POST['address'])) {
        $address = $_POST['address'];
    } else {
        $address = NULL;
    }
    $barangay = $_POST['barangay'];
    if (!empty($_POST['landline'])) {
        $landline = $_POST['landline'];
    } else {
        $landline = NULL;
    }
    if (!empty($_POST['mobileNumber'])) {
        $mobileNumber = $_POST['mobileNumber'];
    } else {
        $mobileNumber = NULL;
    }
    $email = $_SESSION['email'];
    $dateOfBirth = date('Y-m-d', strtotime($_POST['dob']));
    $sex = $_POST['sex'];
    $religion = $_POST['religion'];
    $civilStatus = $_POST['civilStatus'];
    $educationalAttainment = $_POST['educationalAttainment'];
    $isVoter = $_POST['isVoter'];
    $employmentStatus = $_POST['employmentStatus'];
    if (isset($_POST['income'])) {
        $income = $_POST['income'];
    } else {
        $income = NULL;
    }
    if (isset($_POST['categoryOfEmployment'])) {
        $categoryOfEmployment = $_POST['categoryOfEmployment'];
    } else {
        $categoryOfEmployment = NULL;
    }
    if (isset($_POST['natureOfEmployment'])) {
        $natureOfEmployment = $_POST['natureOfEmployment'];
    } else {
        $natureOfEmployment = NULL;
    }
    if (isset($_POST['occupation'])) {
        $occupation = $_POST['occupation'];
    } else {
        $occupation = NULL;
    }
    if (!empty($_POST['otherOccupation'])) {
        $otherOccupation = $_POST['otherOccupation'];
    } else {
        $otherOccupation = NULL;
    }
    $is4PsBeneficiary = $_POST['4psBeneficiary'];
    if (isset($_POST['bloodType'])) {
        $bloodType = $_POST['bloodType'];
    } else {
        $bloodType = NULL;
    }
    if (!empty($_POST['organization'])) {
        $organizationAffiliated = $_POST['organization'];
    } else {
        $organizationAffiliated = NULL;
    }
    if (!empty($_POST['contactPerson'])) {
        $contactPerson = $_POST['contactPerson'];
    } else {
        $contactPerson = NULL;
    }
    if (!empty($_POST['officeAddress'])) {
        $officeAddress = $_POST['officeAddress'];
    } else {
        $officeAddress = NULL;
    }
    if (!empty($_POST['telNumber'])) {
        $telNumber = $_POST['telNumber'];
    } else {
        $telNumber = NULL;
    }
    if (!empty($_POST['sssNumber'])) {
        $sssNumber = $_POST['sssNumber'];
    } else {
        $sssNumber = NULL;
    }
    if (!empty($_POST['gsisNumber'])) {
        $gsisNumber = $_POST['gsisNumber'];
    } else {
        $gsisNumber = NULL;
    }
    if (!empty($_POST['psnNumber'])) {
        $psnNumber = $_POST['psnNumber'];
    } else {
        $psnNumber = NULL;
    }
    if (!empty($_POST['philHealthNumber'])) {
        $philHealthNumber = $_POST['philHealthNumber'];
    } else {
        $philHealthNumber = NULL;
    }
    if (isset($_POST['philHealthMemberType'])) {
        $philHealthMemberType = $_POST['philHealthMemberType'];
    } else {
        $philHealthMemberType = NULL;
    }
    if (!empty($_POST['fatherLastName'])) {
        $fatherLastName = $_POST['fatherLastName'];
    } else {
        $fatherLastName = NULL;
    }
    if (!empty($_POST['fatherFirstName'])) {
        $fatherFirstName = $_POST['fatherFirstName'];
    } else {
        $fatherFirstName = NULL;
    }
    if (!empty($_POST['fatherMiddleName'])) {
        $fatherMiddleName = $_POST['fatherMiddleName'];
    } else {
        $fatherMiddleName = NULL;
    }
    if (!empty($_POST['motherLastName'])) {
        $motherLastName = $_POST['motherLastName'];
    } else {
        $motherLastName = NULL;
    }
    if (!empty($_POST['motherFirstName'])) {
        $motherFirstName = $_POST['motherFirstName'];
    } else {
        $motherFirstName = NULL;
    }
    if (!empty($_POST['motherMiddleName'])) {
        $motherMiddleName = $_POST['motherMiddleName'];
    } else {
        $motherMiddleName = NULL;
    }
    if (!empty($_POST['guardianLastName'])) {
        $guardianLastName = $_POST['guardianLastName'];
    } else {
        $guardianLastName = NULL;
    }
    if (!empty($_POST['guardianFirstName'])) {
        $guardianFirstName = $_POST['guardianFirstName'];
    } else {
        $guardianFirstName = NULL;
    }
    if (!empty($_POST['guardianMiddleName'])) {
        $guardianMiddleName = $_POST['guardianMiddleName'];
    } else {
        $guardianMiddleName = NULL;
    }
    if (!empty($_POST['guardianRelationship'])) {
        $guardianRelationship = $_POST['guardianRelationship'];
    } else {
        $guardianRelationship = NULL;
    }
    if (!empty($_POST['guardianContactNumber'])) {
        $guardianContactNumber = $_POST['guardianContactNumber'];
    } else {
        $guardianContactNumber = NULL;
    }
    $accomplishedBy = $_POST['accomplishedBy'];
    $nameOfAccomplisher = $_POST['nameOfAccomplisher'];
    $nameOfPhysician = $_POST['nameOfPhysician'];
    $licenseNumber = $_POST['licenseNumber'];
    $status = "Pending";
    $columnName = "is_pwd";
    $image = $_FILES['file'];

    if ($image['name'] != "") {
        $fileName = $image['name'];
        $fileTmpName = $image['tmp_name'];
        $fileSize = $image['size'];
        $fileError = $image['error'];
        $fileType = $image['type'];
        $fileExt = explode('.', $fileName);
        $fileActualExt = strtolower(end($fileExt));
        $allowed = array('jpg', 'jpeg', 'png', '');

        if (in_array($fileActualExt, $allowed)) {
            if ($fileError === 0) {
                $newFileName = uniqid('', true).".".$fileActualExt;
                $fileDestination = "../uploads/".$newFileName;
                $_SESSION['profileDestination'] = $fileDestination;
                insertProfile($connection, $username, $newFileName, $fileTmpName, $fileDestination);
            } else {
                header("location: ../profile.html?error=therewasanerror");
                exit();
            }
        } else {
            header("location: ../profile.html?error=filenotallowed");
            exit();
        }
    }
    updatePWDData($connection, $username, $registrationType, $transferID, $changeInfoID, $pwdNumber, $dateApplied, $pwdLastName, $pwdFirstName, $pwdMiddleName, $pwdSuffix, $typeOfDisability, $medicalCondition,
                $causeOfDisability, $congenitalInborn, $acquired, $statusOfDisability, $address, $barangay, $landline, $mobileNumber, $email, $dateOfBirth, $sex, $religion, $civilStatus,
                $educationalAttainment, $isVoter, $employmentStatus, $income, $categoryOfEmployment, $natureOfEmployment, $occupation, $otherOccupation, $is4PsBeneficiary, $bloodType,
                $organizationAffiliated, $contactPerson, $officeAddress, $telNumber, $sssNumber, $gsisNumber, $psnNumber, $philHealthNumber, $philHealthMemberType, $fatherLastName, 
                $fatherFirstName, $fatherMiddleName, $motherLastName, $motherFirstName, $motherMiddleName, $guardianLastName, $guardianFirstName, $guardianMiddleName, $guardianRelationship,
                $guardianContactNumber, $accomplishedBy, $nameOfAccomplisher, $nameOfPhysician, $licenseNumber, $status, $columnName);

} 
else if(isset($_POST['senior-citizen-register'])) {
    session_start();
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';

    $username = $_SESSION['username'];
    $registration_type = $_POST['typeOfApplication'];
    $lostNumber = $_POST['lostNumber'];
    $sr_citizen_num = $_POST['IDnum'];
    $sr_citizen_first_name = $_POST['FName'];
    $sr_citizen_middle_name = $_POST['MName'];
    $sr_citizen_last_name = $_POST['LName'];
    $sr_citizen_suffix = $_POST['suffix'];
    $barangay = $_POST['barangay'];
    $tirahan = $_POST['tirahan'];
    $sex = $_POST['sex'];
    $marital_status = $_POST['status'];
    $edad = $_POST['edad'];
    $date_of_birth = $_POST['srCitizenDOB'];
    $lugar_ng_kapanganakan = $_POST['birthplace'];
    $telepono = $_POST['telepono'];
    $relihiyon = $_POST['relihiyon'];
    $hanapbuhay = $_POST['hanapbuhay'];
    $pensyon = $_POST['pensyon'];
    $saan = $_POST['saan'];
    $magkano = $_POST['magkano'];
    $pangalan_ng_asawa = $_POST['asawa'];
    $edad_asawa = $_POST['edad-asawa'];
    $ilan_ang_anak = $_POST['anak'];
    $kasama = $_POST['kasama'];
    $columnName = "is_sr_citizen";
    $status = "Pending";
    $family_composition_name = $_POST['relativeName'];
    $family_composition_age = $_POST['relativeAge'];
    $family_composition_address = $_POST['relativeAddress'];
    $family_composition_contact = $_POST['relativeContact'];

    insertSeniorCitizenData($connection, $username, $registration_type, $lostNumber, $sr_citizen_num, $sr_citizen_first_name, $sr_citizen_middle_name, $sr_citizen_last_name, 
                            $sr_citizen_suffix, $barangay, $tirahan, $sex, $marital_status, $edad, $date_of_birth, $lugar_ng_kapanganakan, $telepono, $relihiyon, $hanapbuhay, $pensyon, 
                            $saan, $magkano, $pangalan_ng_asawa, $edad_asawa, $ilan_ang_anak, $kasama, $columnName, $family_composition_name, $family_composition_age, $family_composition_address,
                            $family_composition_contact, $status);

} 
else if(isset($_POST['senior-citizen-update'])) {
    session_start();
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';

    $username = $_SESSION['username'];
    $registration_type = $_POST['typeOfApplication'];
    $lostNumber = $_POST['lostNumber'];
    $sr_citizen_num = $_POST['IDnum'];
    $sr_citizen_first_name = $_POST['FName'];
    $sr_citizen_middle_name = $_POST['MName'];
    $sr_citizen_last_name = $_POST['LName'];
    $sr_citizen_suffix = $_POST['suffix'];
    $barangay = $_POST['barangay'];
    $tirahan = $_POST['tirahan'];
    $sex = $_POST['sex'];
    $marital_status = $_POST['status'];
    $edad = $_POST['edad'];
    $date_of_birth = $_POST['srCitizenDOB'];
    $lugar_ng_kapanganakan = $_POST['birthplace'];
    $telepono = $_POST['telepono'];
    $relihiyon = $_POST['relihiyon'];
    $hanapbuhay = $_POST['hanapbuhay'];
    $pensyon = $_POST['pensyon'];
    $saan = $_POST['saan'];
    $magkano = $_POST['magkano'];
    $pangalan_ng_asawa = $_POST['asawa'];
    $edad_asawa = $_POST['edad-asawa'];
    $ilan_ang_anak = $_POST['anak'];
    $kasama = $_POST['kasama'];
    $columnName = "is_sr_citizen";
    $status = "Pending";
    $id = $_POST['id'];
    $family_composition_name = $_POST['relativeName'];
    $family_composition_age = $_POST['relativeAge'];
    $family_composition_address = $_POST['relativeAddress'];
    $family_composition_contact = $_POST['relativeContact'];

    updateSeniorCitizenData($connection, $username, $registration_type, $lostNumber, $sr_citizen_num, $sr_citizen_first_name, $sr_citizen_middle_name, $sr_citizen_last_name, 
                            $sr_citizen_suffix, $barangay, $tirahan, $sex, $marital_status, $edad, $date_of_birth, $lugar_ng_kapanganakan, $telepono, $relihiyon, $hanapbuhay, $pensyon, 
                            $saan, $magkano, $pangalan_ng_asawa, $edad_asawa, $ilan_ang_anak, $kasama, $columnName, $family_composition_name, $family_composition_age, $family_composition_address,
                            $family_composition_contact, $status, $id);

} 
else if(isset($_POST['solo-parent-register'])) {
    session_start();
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';
    
    $username = $_SESSION['username'];
    $solo_parent_name = $_POST['name'];
    $age = $_POST['age'];
    $sex = $_POST['sex'];
    $date_of_birth = date('Y-m-d', strtotime($_POST['birth']));
    $place_of_birth = $_POST['birthplace'];
    $address = $_POST['soloParentAddress'];
    $barangay = $_POST['soloParentBarangay'];
    $educ_attainment = $_POST['educational'];
    $occupation = $_POST['occupation'];
    $income = $_POST['income'];
    $fam_income = $_POST['famincome'];
    $tenurial = $_POST['tenurial'];
    $religion = $_POST['soloParentReligion'];
    $contact_number = $_POST['contact'];
    $marital_status = $_POST['marital-status'];
    $classification_incidence = $_POST['incidence'];
    $classification_when = $_POST['when'];
    $problems = $_POST ['problem'];
    $family_resources = $_POST['resources'];
    $date_applied = date('Y-m-d', strtotime($_POST['date']));

    $family_composition_name = $_POST['family-composition-name'];
    $family_composition_relationship = $_POST['family-composition-relationship'];
    $family_composition_age = $_POST['family-composition-age'];
    $family_composition_civil_status = $_POST['family-composition-civil-status'];
    $family_composition_educ_attainment = $_POST['family-composition-educ-attainment'];
    $family_composition_occupation = $_POST['family-composition-occupation'];
    $family_composition_monthly_income = $_POST['family-composition-monthly-income'];
    $combinedArray = array_merge($family_composition_name, $family_composition_relationship, $family_composition_age, $family_composition_civil_status, $family_composition_educ_attainment, $family_composition_occupation, $family_composition_monthly_income);
    $columnName = "is_solo_parent";

    insertSoloParentData($connection, $username, $solo_parent_name, $age, $sex, $date_of_birth, $place_of_birth, $address, $barangay, 
                        $educ_attainment, $occupation, $income, $fam_income, $tenurial, $religion, $contact_number, $marital_status, $classification_incidence,
                        $classification_when, $problems, $family_resources, $date_applied, $family_composition_name, $family_composition_relationship, $family_composition_age, $family_composition_civil_status, $family_composition_educ_attainment, $family_composition_occupation, 
                        $family_composition_monthly_income, $combinedArray, $columnName);
}
else if(isset($_POST['solo-parent-update'])) {
    session_start();
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';
    
    $username = $_SESSION['username'];
    $solo_parent_name = $_POST['name'];
    $age = $_POST['age'];
    $sex = $_POST['sex'];
    $date_of_birth = date('Y-m-d', strtotime($_POST['birth']));
    $place_of_birth = $_POST['birthplace'];
    $address = $_POST['soloParentAddress'];
    $barangay = $_POST['soloParentBarangay'];
    $educ_attainment = $_POST['educational'];
    $occupation = $_POST['occupation'];
    $income = $_POST['income'];
    $fam_income = $_POST['famincome'];
    $tenurial = $_POST['tenurial'];
    $religion = $_POST['soloParentReligion'];
    $contact_number = $_POST['contact'];
    $marital_status = $_POST['marital-status'];
    $classification_incidence = $_POST['incidence'];
    $classification_when = $_POST['when'];
    $problems = $_POST ['problem'];
    $family_resources = $_POST['resources'];
    $date_applied = date('Y-m-d', strtotime($_POST['date']));
    $id = $_POST['id'];

    $family_composition_name = $_POST['family-composition-name'];
    $family_composition_relationship = $_POST['family-composition-relationship'];
    $family_composition_age = $_POST['family-composition-age'];
    $family_composition_civil_status = $_POST['family-composition-civil-status'];
    $family_composition_educ_attainment = $_POST['family-composition-educ-attainment'];
    $family_composition_occupation = $_POST['family-composition-occupation'];
    $family_composition_monthly_income = $_POST['family-composition-monthly-income'];
    $combinedArray = array_merge($family_composition_name, $family_composition_relationship, $family_composition_age, $family_composition_civil_status, $family_composition_educ_attainment, $family_composition_occupation, $family_composition_monthly_income);
    $columnName = "is_solo_parent";

    updateSoloParentData($connection, $username, $solo_parent_name, $age, $sex, $date_of_birth, $place_of_birth, $address, $barangay, 
                        $educ_attainment, $occupation, $income, $fam_income, $tenurial, $religion, $contact_number, $marital_status, $classification_incidence,
                        $classification_when, $problems, $family_resources, $date_applied, $family_composition_name, $family_composition_relationship, $family_composition_age, $family_composition_civil_status, $family_composition_educ_attainment, $family_composition_occupation, 
                        $family_composition_monthly_income, $combinedArray, $columnName, $id);
}
?>