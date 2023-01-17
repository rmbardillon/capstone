<?php
    session_start();
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';
    // Senior Citizen
    if(isset($_POST['srCitizenSubmit'])) {
        $personId = generateUUID();
        $spouseId = generateUUID();
        $applicantType = "Senior Citizen";
        $id_number = "SC - " . generateSrID()[0];
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
        $spouseMiddleName = $_POST['spouseMiddleName'];
        $spouseSuffix = $_POST['spouseSuffix'];
        $spouseDOB = $_POST['spouseDOB'];
        $spouseRelationshipType = "Spouse";
        $noOfChildren = $_POST['noOfChildren'];
        $childRelationshipType = "Child";
        $childLastName = $_POST['childLastName'];
        $childFirstName = $_POST['childFirstName'];
        $childMiddleName = $_POST['childMiddleName'];
        $childSuffix = $_POST['childSuffix'];
        $childDOB = $_POST['srCitizenChildDOB'];
        $childTelephone = $_POST['childTelephone'];
        $childBarangay = $_POST['childBarangay'];
        $childAddress = $_POST['childAddress'];

        insertPerson($connection, $personId, $srCitizenDOB);
        insertApplicant($connection, $personId, $applicantType, $id_number, $placeOfBirth);
        insertTransactionType($connection, $personId, $applicationType);
        insertName($connection, $personId, $firstName, $middleName, $surname, $suffix);
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
        $id_number = date("Y") . " - " . generateSoloParentID()[0];
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
                insertIncome($connection, $childId, $childIncome, "0");
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
        $applicationType = $_POST['applicationType'];
        $region = $_POST['region'];
        $region_text = $_POST['region_text'];
        $province = $_POST['province'];
        $province_text = $_POST['province_text'];
        $city = $_POST['city'];
        $city_text = $_POST['city_text'];
        $barangay = $_POST['barangay'];
        $barangay_text = $_POST['barangay_text'];
        $surname = $_POST['surname'];
        $firstName = $_POST['firstName'];
        $middleName = $_POST['middleName'];
        $suffix = $_POST['suffix'];
        $address = $_POST['address'];
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
        $is4PS = $_POST['is4PS'];
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
        $fatherSurname = $_POST['fatherSurname'];
        $fatherFirstName = $_POST['fatherFirstName'];
        $fatherMiddleName = $_POST['fatherMiddleName'];
        $fatherSuffix = $_POST['fatherSuffix'];
        $motherSurname = $_POST['motherSurname'];
        $motherFirstName = $_POST['motherFirstName'];
        $motherMiddleName = $_POST['motherMiddleName'];
        $motherSuffix = $_POST['motherSuffix'];
        $guardianSurname = $_POST['guardianSurname'];
        $guardianFirstName = $_POST['guardianFirstName'];
        $guardianMiddleName = $_POST['guardianMiddleName'];
        $guardianSuffix = $_POST['guardianSuffix'];
        $guardianRelationship = $_POST['guardianRelationship'];
        $guardianContactNumber = $_POST['guardianContactNumber'];

        $typeOfDisability = $_POST['typeOfDisability'];
        $medicalCondition = $_POST['medicalCondition'];
        $causeOfDisability = $_POST['causeOfDisability'];
        $acquired = $_POST['acquired'];
        $inborn = $_POST['inborn'];
        $statusOfDisabiity = $_POST['statusOfDisabiity'];
        $physicianName = $_POST['physicianName'];
        $physicianLicence = $_POST['physicianLicence'];
        $accomplishedBy = $_POST['accomplishedBy'];
    }

?>