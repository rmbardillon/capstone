<?php
    session_start();
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';
    // Senior Citizen
    if(isset($_POST['srCitizenSubmit'])) {
        $personId = generateUUID();
        $spouseId = generateUUID();
        $applicantType = "Senior Citizen";
        $id_number = "SC-" . generateSrID()[0];
        $applicationType = $_POST['applicationType'];
        $barangayId = generateUUID();
        $IDNumber = $_POST['IDNumber'];
        $surname = $_POST['surname'];
        $firstName = $_POST['firstName'];
        $middlename = $_POST['middlename'];
        $suffix = $_POST['suffix'];
        $barangay = $_POST['barangay'];
        $address = $_POST['address'];
        $gender = $_POST['gender'];
        $maritalStatus = $_POST['maritalStatus'];
        $email = $_POST['email'];
        $srCitizenDOB = $_POST['srCitizenDOB'];
        $placeOfBirth = $_POST['placeOfBirth'];
        $telephone = $_POST['telephone'];
        $religion = $_POST['religion'];
        $job = $_POST['job'];
        $hasPension = $_POST['hasPension'];
        $whatPension = $_POST['whatPension'];
        $howMuchPension = $_POST['howMuchPension'];
        $spouseLastName = $_POST['spouseLastName'];
        $spouseFirstName = $_POST['spouseFirstName'];
        $spouseMiddleName = $_POST['spouseMiddlename'];
        $spouseSuffix = $_POST['spouseSuffix'];
        $spouseDOB = $_POST['spouseDOB'];
        $spouseRelationshipType = "Spouse";
        $noOfChildren = $_POST['noOfChildren'];
        $childRelationshipType = "Child";
        $childLastName = $_POST['childLastName'];
        $childFirstName = $_POST['childFirstName'];
        $childMiddleName = $_POST['childMiddlename'];
        $childSuffix = $_POST['childSuffix'];
        $childDOB = $_POST['srCitizenChildDOB'];
        $childTelephone = $_POST['childTelephone'];
        $childBarangay = $_POST['childBarangay'];
        $childAddress = $_POST['childAddress'];

        insertPerson($connection, $personId, $srCitizenDOB);
        insertApplicant($connection, $personId, $applicantType, $id_number, $placeOfBirth);
        insertTransactionType($connection, $personId, $applicationType);
        insertName($connection, $personId, $firstName, $middlename, $surname, $suffix);
        insertAddress($connection, $barangayId, $barangay, $address);
        insertPersonAddress($connection, $personId, $barangayId);
        insertGender($connection, $personId, $gender);
        insertMaritalStatus($connection, $personId, $maritalStatus);
        insertTelephone($connection, $personId, $telephone);
        insertReligion($connection, $personId, $religion);
        insertJob($connection, $personId, $job);
        insertPension($connection, $personId, $hasPension, $whatPension, $howMuchPension);
        insertPerson($connection, $spouseId, $spouseDOB);
        insertName($connection, $spouseId, $spouseFirstName, $spouseMiddleName, $spouseLastName, $spouseSuffix);
        insertRelationship($connection, $personId, $spouseId, $spouseRelationshipType);
        if (count($childFirstName) > 1) {
            for ($i=0; $i < count($childFirstName); $i++) {
                $childId = generateUUID();
                $childBarangayId = generateUUID();
                insertPerson($connection, $childId, $childDOB[$i]);
                insertName($connection, $childId, $childFirstName[$i], $childMiddleName[$i], $childLastName[$i], $childSuffix[$i]);
                insertTelephone($connection, $childId, $childTelephone[$i]);
                insertAddress($connection, $childBarangayId, $childBarangay[$i], $childAddress[$i]);
                insertPersonAddress($connection, $childId, $childBarangayId);
                insertRelationship($connection, $personId, $childId, $childRelationshipType);
            }
        }
        insertUserAccount($connection, $id_number, $applicantType, $personId, $email, $id_number);
    }
    // Solo Parent
    if(isset($_POST['soloParentSubmit'])) {
        $applicationType = "New Application";
        $personId = generateUUID();
        $id_number = date("Y") . "-" . generateSoloParentID()[0];
        $applicantType = "Solo Parent";
        $surname = $_POST['surname'];
        $firstName = $_POST['firstName'];
        $middlename = $_POST['middlename'];
        $suffix = $_POST['suffix'];
        $soloParentDOB = $_POST['soloParentDOB'];
        $age = $_POST['age'];
        $placeOfBirth = $_POST['placeOfBirth'];
        $gender = $_POST['gender'];
        $barangayId = generateUUID();
        $barangay = $_POST['barangay'];
        $address = $_POST['address'];
        $educationalAttainment = $_POST['educationalAttainment'];
        $job = $_POST['job'];
        $company = $_POST['company'];
        $monthlyIncome = $_POST['monthlyIncome'];
        $totalFamilyIncome = $_POST['totalFamilyIncome'];
        $telephone = $_POST['telephone'];
        $email = $_POST['email'];
        $childRelationshipType = "Family Member";
        $childLastName = $_POST['childLastName'];
        $childFirstName = $_POST['childFirstName'];
        $childMiddleName = $_POST['childMiddleName'];
        $childSuffix = $_POST['childSuffix'];
        $soloParentChildDOB = $_POST['soloParentChildDOB'];
        $maritalStatus = $_POST['maritalStatus'];
        $childEducationalAttainment = $_POST['childEducationalAttainment'];
        $childIncome = $_POST['childIncome'];

        $soloParentClassification = $_POST['soloParentClassification'];
        $soloParentNeeds = $_POST['soloParentNeeds'];
        $soloParentFamilyResources = $_POST['soloParentFamilyResources'];

        insertPerson($connection, $personId, $soloParentDOB);
        insertApplicant($connection, $personId, $applicantType, $id_number, $placeOfBirth);
        insertTransactionType($connection, $personId, $applicationType);
        insertName($connection, $personId, $firstName, $middleName, $surname, $suffix);
        insertAddress($connection, $barangayId, $barangay, $address);
        insertPersonAddress($connection, $personId, $barangayId);
        insertGender($connection, $personId, $gender);
        insertEducationalAttainment($connection, $personId, $educationalAttainment);
        insertCompany($connection, $personId, $company);
        insertIncome($connection, $personId, $monthlyIncome, $totalFamilyIncome);
        insertTelephone($connection, $personId, $telephone);
        insertJob($connection, $personId, $job);
        if (count($childFirstName) > 1) {
            for ($i=0; $i < count($childFirstName); $i++) {
                $childId = generateUUID();
                $childBarangayId = generateUUID();
                insertPerson($connection, $childId, $soloParentChildDOB[$i]);
                insertName($connection, $childId, $childFirstName[$i], $childMiddleName[$i], $childLastName[$i], $childSuffix[$i]);
                insertMaritalStatus($connection, $childId, $maritalStatus);
                insertEducationalAttainment($connection, $childId, $childEducationalAttainment);
                insertIncome($connection, $childId, $childIncome, NULL);
                insertRelationship($connection, $personId, $childId, $childRelationshipType);
            }
        }
        insertSoloParentLongText($connection, $personId, $soloParentClassification, $soloParentNeeds, $soloParentFamilyResources);
        insertUserAccount($connection, $id_number, $applicantType, $personId, $email, $id_number);
    }
    // Person with Disability
    if (isset($_POST['pwdSubmit'])) {
        $timestamp = microtime(true);
        $timestamp = substr($timestamp, -4);
        $id_number =  "043428023-" . $timestamp;
        $personId = generateUUID();
        $applicationType = $_POST['applicationType'];
        $applicantType = "PWD";
        $old_region = $_POST['region_text'];
        $old_province = $_POST['province_text'];
        $old_city = $_POST['city_text'];
        $old_barangay = $_POST['barangay_text'];
        $surname = $_POST['surname'];
        $firstName = $_POST['firstName'];
        $middlename = $_POST['middlename'];
        $suffix = $_POST['suffix'];
        $address = $_POST['address'];
        $barangayId = generateUUID();
        $barangay = $_POST['barangay'];
        $landline = $_POST['landline'];
        $mobileNumber = $_POST['mobileNumber'];
        $emailAddress = $_POST['emailAddress'];
        $pwdDOB = $_POST['pwdDOB'];
        $gender = $_POST['gender'];
        $religion = $_POST['religion'];
        $maritalStatus = $_POST['maritalStatus'];
        $bloodType = $_POST['bloodType'];
        $educationalAttainment = $_POST['educationalAttainment'];
        $isActiveVoter = $_POST['isActiveVoter'];
        $is4psMember = $_POST['is4PS'];
        $employmentStatus = $_POST['employmentStatus'];
        $categoryOfEmployment = $_POST['categoryOfEmployment'];
        $natureOfEmployment = $_POST['natureOfEmployment'];
        $occupation = $_POST['occupation'];
        $otherOccupation = $_POST['otherOccupation'];
        $income = $_POST['income'];
        $organization = $_POST['organization'];
        $organizationContactPerson = $_POST['organizationContactPerson'];
        $organizationOfficeAddress = $_POST['organizationOfficeAddress'];
        $organizationTelephoneNumber = $_POST['organizationTelephoneNumber'];
        $SSSNo = $_POST['SSSNo'];
        $GSISNo = $_POST['GSISNo'];
        $PSNNo = $_POST['PSNNo'];
        $isPhilhealthMember = $_POST['isPhilhealthMember'];
        $philhealthNumber = $_POST['philhealthNumber'];
        $fatherId = generateUUID();
        $fatherSurname = $_POST['fatherSurname'];
        $fatherFirstName = $_POST['fatherFirstName'];
        $fatherMiddleName = $_POST['fatherMiddlename'];
        $fatherSuffix = $_POST['fatherSuffix'];
        $motherId = generateUUID();
        $motherSurname = $_POST['motherSurname'];
        $motherFirstName = $_POST['motherFirstName'];
        $motherMiddleName = $_POST['motherMiddlename'];
        $motherSuffix = $_POST['motherSuffix'];
        $guardianId = generateUUID();
        $guardianSurname = $_POST['guardianSurname'];
        $guardianFirstName = $_POST['guardianFirstName'];
        $guardianMiddleName = $_POST['guardianMiddlename'];
        $guardianSuffix = $_POST['guardianSuffix'];
        $guardianRelationship = $_POST['guardianRelationship'];
        $guardianContactNumber = $_POST['guardianContactNumber'];

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
        if (isset($_POST['causeOfDisability'])) {
            $str = $_POST['causeOfDisability'];
            $causeOfDisability = implode (",", $str);
        } else {
            $causeOfDisability = NULL;
        }
        if (isset($_POST['inborn'])) {
            $str = $_POST['inborn'];
            $inborn = implode (",", $str);
        } else {
            $inborn = NULL;
        }
        if (isset($_POST['acquired'])) {
            $str = $_POST['acquired'];
            $acquired = implode (",", $str);
        } else {
            $acquired = NULL;
        }
        $statusOfDisability = $_POST['statusOfDisabiity'];
        $physicianName = $_POST['physicianName'];
        $physicianLicence = $_POST['physicianLicence'];
        $accomplishedBy = $_POST['accomplishedBy'];
        if ($accomplishedBy == "Applicant") {
            $accomplisherName = $firstName . " " . $middlename . " " . $surname . " " . $suffix;
        } else if ($accomplishedBy == "Guardian") {
            $accomplisherName = $guardianFirstName . " " . $guardianMiddleName . " " . $guardianSurname . " " . $guardianSuffix;
        } else {
            $accomplisherName = $_POST['accomplisherName'];
        }

        insertPerson($connection, $personId, $pwdDOB);
        insertApplicant($connection, $personId, $applicantType, $id_number, NULL);
        insertTransactionType($connection, $personId, $applicationType);
        insertPreviousAddress($connection, $personId, $old_region, $old_province, $old_city, $old_barangay, $previousAddress);
        insertName($connection, $personId, $firstName, $middlename, $surname, $suffix);
        insertAddress($connection, $barangayId, $barangay, $address);
        insertPersonAddress($connection, $personId, $barangayId);
        insertTelephone($connection, $personId, $landline);
        insertTelephone($connection, $personId, $mobileNumber);
        insertGender($connection, $personId, $gender);
        insertReligion($connection, $personId, $religion);
        insertMaritalStatus($connection, $personId, $maritalStatus);
        insertBloodType($connection, $personId, $bloodType);
        insertEducationalAttainment($connection, $personId, $educationalAttainment);
        insertGovernmentMembership($connection, $personId, $isActiveVoter, $is4psMember);
        insertEmploymentStatus($connection, $personId, $employmentStatus, $categoryOfEmployment, $natureOfEmployment);
        insertJob($connection, $personId, $occupation);
        insertIncome($connection, $personId, $income, NULL);
        insertOrganization($connection, $personId, $organization, $organizationContactPerson, $organizationOfficeAddress, $organizationTelephoneNumber);
        insertIdReferenceNumber($connection, $personId, $SSSNo, $GSISNo, $PSNNo, $isPhilhealthMember, $philhealthNumber);
        insertPerson($connection, $fatherId, NULL);
        insertName($connection, $fatherId, $fatherFirstName, $fatherMiddleName, $fatherSurname, $fatherSuffix);
        insertRelationship($connection, $personId, $fatherId, "Father");
        insertPerson($connection, $motherId, NULL);
        insertName($connection, $motherId, $motherFirstName, $motherMiddleName, $motherSurname, $motherSuffix);
        insertRelationship($connection, $personId, $motherId, "Mother");
        insertPerson($connection, $guardianId, NULL);
        insertName($connection, $guardianId, $guardianFirstName, $guardianMiddleName, $guardianSurname, $guardianSuffix);
        insertRelationship($connection, $personId, $guardianId, $guardianRelationship);
        insertTelephone($connection, $guardianId, $guardianContactNumber);
        insertPWDDisease($connection, $personId, $typeOfDisability, $medicalCondition, $causeOfDisability, $inborn, $acquired, $statusOfDisability);
        insertPWDPhysician($connection, $personId, $physicianName, $physicianLicence);
        insertPWDApplicationAccomplisher($connection, $personId, $accomplishedBy, $accomplisherName);
        insertUserAccount($connection, $id_number, $applicantType, $personId, $emailAddress, $id_number);
    }

?>