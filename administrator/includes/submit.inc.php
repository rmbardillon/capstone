<?php
    session_start();
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';
    require_once 'sql.inc.php';
    $applicationType = $_GET['applicantType'];
    // Senior Citizen
    if($applicationType == "Senior Citizen") {
        $formControlNumber = $_POST['formControlNumber'];
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
        $otherOccupation = $_POST['otherOccupation'];
        $hasPension = $_POST['hasPension'];
        $whatPension = $_POST['whatPension'];
        $howMuchPension = $_POST['howMuchPension'];
        $spouseLastName = $_POST['spouseLastName'];
        $spouseFirstName = $_POST['spouseFirstName'];
        $spouseMiddleName = $_POST['spouseMiddlename'];
        $spouseSuffix = $_POST['spouseSuffix'];
        $spouseDOB = $_POST['spouseDOB'];
        $spouseRelationshipType = "Spouse";
        $noOfChildren = $_POST['numberOfChildren'];
        $childRelationshipType = "Child";
        $childLastName = $_POST['childLastName'];
        $childFirstName = $_POST['childFirstName'];
        $childMiddleName = $_POST['childMiddlename'];
        $childSuffix = $_POST['childSuffix'];
        $childDOB = $_POST['srCitizenChildDOB'];
        $childTelephone = $_POST['childTelephone'];
        $childBarangay = $_POST['childBarangay'];
        $childAddress = $_POST['childAddress'];
        try {
            // Begin transaction
            $connection->begin_transaction();

            // Call your functions to insert data
            insertPerson($connection, $personId, $srCitizenDOB, $email);
            insertApplicant($connection, $personId, $applicantType, $id_number, $placeOfBirth, $formControlNumber);
            insertTransactionType($connection, $personId, $applicationType, $id_number);
            insertName($connection, $personId, $firstName, $middlename, $surname, $suffix);
            insertAddress($connection, $barangayId, $barangay, $address);
            insertPersonAddress($connection, $personId, $barangayId);
            insertGender($connection, $personId, $gender);
            insertMaritalStatus($connection, $personId, $maritalStatus);
            insertTelephone($connection, $personId, $telephone);
            insertReligion($connection, $personId, $religion);
            if($job == "Other") {
                insertJob($connection, $personId, NULL, $otherOccupation);
            } else {
                insertJob($connection, $personId, $job, NULL);
            }
            insertPension($connection, $personId, $hasPension, $whatPension, $howMuchPension);
            if (!empty($spouseFirstName)) {
                insertPerson($connection, $spouseId, $spouseDOB, NULL);
                insertName($connection, $spouseId, $spouseFirstName, $spouseMiddleName, $spouseLastName, $spouseSuffix);
                insertRelationship($connection, $personId, $spouseId, $spouseRelationshipType);
            }
            if (!empty($childFirstName)) {
                if (count($childFirstName) >= 1) {
                    for ($i=0; $i < count($childFirstName); $i++) {
                        $childId = generateUUID();
                        $childBarangayId = generateUUID();
                        insertPerson($connection, $childId, $childDOB[$i], NULL);
                        insertName($connection, $childId, $childFirstName[$i], $childMiddleName[$i], $childLastName[$i], $childSuffix[$i]);
                        insertTelephone($connection, $childId, $childTelephone[$i]);
                        insertAddress($connection, $childBarangayId, $childBarangay[$i], $childAddress[$i]);
                        insertPersonAddress($connection, $childId, $childBarangayId);
                        insertRelationship($connection, $personId, $childId, $childRelationshipType);
                    }
                }
            }
            // Commit the transaction
            $connection->commit();
            echo "All queries executed successfully";
        } catch (Exception $e) {
            // Rollback the transaction in case of any errors
            $connection->rollback();
            $errorMessage =  "Error: " . $e->getMessage();
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
        return "Success";
    }
    // Solo Parent
    if($applicationType == "Solo Parent") {
        $formControlNumber = $_POST['formControlNumber'];
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
        $otherOccupation = $_POST['otherOccupation'];
        $company = $_POST['company'];
        $monthlyIncome = $_POST['monthlyIncome'];
        $totalFamilyIncome = $_POST['totalFamilyIncome'];
        $telephone = $_POST['telephone'];
        $email = $_POST['email'];
        $childLastName = $_POST['childLastName'];
        $childFirstName = $_POST['childFirstName'];
        $childMiddleName = $_POST['childMiddleName'];
        $childSuffix = $_POST['childSuffix'];
        $childRelationship = $_POST['soloParentChildRelationship'];
        $soloParentChildDOB = $_POST['soloParentChildDOB'];
        $maritalStatus = $_POST['maritalStatus'];
        $childEducationalAttainment = $_POST['childEducationalAttainment'];
        $childOccupation = $_POST['childOccupation'];
        $otherChildOccupation = $_POST['otherChildOccupation'];
        $childIncome = $_POST['childIncome'];

        $soloParentClassification = $_POST['soloParentClassification'];
        if (isset($_POST['soloParentClassification'])) {
            $str = $_POST['soloParentClassification'];
            $soloParentClassification = implode (",", $str);
        } else {
            $soloParentClassification = NULL;
        }
        $soloParentNeeds = $_POST['soloParentNeeds'];
        $soloParentFamilyResources = $_POST['soloParentFamilyResources'];
        try {
            // Begin transaction
            $connection->begin_transaction();

            // Call your functions to insert data
            insertPerson($connection, $personId, $soloParentDOB, $email);
            insertApplicant($connection, $personId, $applicantType, $id_number, $placeOfBirth, $formControlNumber);
            insertTransactionType($connection, $personId, $applicationType, $id_number);
            insertName($connection, $personId, $firstName, $middlename, $surname, $suffix);
            insertAddress($connection, $barangayId, $barangay, $address);
            insertPersonAddress($connection, $personId, $barangayId);
            insertGender($connection, $personId, $gender);
            insertEducationalAttainment($connection, $personId, $educationalAttainment);
            insertCompany($connection, $personId, $company);
            insertIncome($connection, $personId, $monthlyIncome, $totalFamilyIncome);
            insertTelephone($connection, $personId, $telephone);
            if($job == "Other") {
                insertJob($connection, $personId, NULL, $otherOccupation);
            } else {
                insertJob($connection, $personId, $job, NULL);
            }
            if (count($childFirstName) >= 1) {
                for ($i=0; $i < count($childFirstName); $i++) {
                    $childId = generateUUID();
                    $childBarangayId = generateUUID();
                    insertPerson($connection, $childId, $soloParentChildDOB[$i], NULL);
                    insertName($connection, $childId, $childFirstName[$i], $childMiddleName[$i], $childLastName[$i], $childSuffix[$i]);
                    insertMaritalStatus($connection, $childId, $maritalStatus[$i]);
                    insertEducationalAttainment($connection, $childId, $childEducationalAttainment[$i]);
                    if($childOccupation[$i] == "Other") {
                        insertJob($connection, $childId, NULL, $otherChildOccupation);
                    } else {
                        insertJob($connection, $childId, $childOccupation[$i], NULL);
                    }
                    insertIncome($connection, $childId, $childIncome[$i], NULL);
                    insertRelationship($connection, $personId, $childId, $childRelationship[$i]);
                }
            }
            insertSoloParentLongText($connection, $personId, $soloParentClassification, $soloParentNeeds, $soloParentFamilyResources);
            // Commit the transaction
            $connection->commit();
            echo "All queries executed successfully";
        } catch (Exception $e) {
            // Rollback the transaction in case of any errors
            $connection->rollback();
            $errorMessage =  "Error: " . $e->getMessage();
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
        return "Success";
    }
    // Person with Disability
    if ($applicationType == "PWD") {
        $formControlNumber = $_POST['formControlNumber'];
        $timestamp = microtime(true);
        $timestamp = substr($timestamp, -4);
        $id_number =  "043428023-" . generatePWDID()[0];
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
        if (isset($_POST['inborn'])) {
            $str = $_POST['inborn'];
            $inborn = implode (",", $str);
            $causeOfDisability = "CONGENITAL/INBORN";
        } else {
            $inborn = NULL;
        }
        if (isset($_POST['acquired'])) {
            $str = $_POST['acquired'];
            $acquired = implode (",", $str);
            $causeOfDisability = "ACQUIRED";
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
        try {
            // Begin transaction
            $connection->begin_transaction();

            // Call your functions to insert data
            insertPerson($connection, $personId, $pwdDOB, $emailAddress);
            insertApplicant($connection, $personId, $applicantType, $id_number, NULL, $formControlNumber);
            insertTransactionType($connection, $personId, $applicationType, $id_number);
            insertPreviousAddress($connection, $personId, $old_region, $old_province, $old_city, $old_barangay, $previousAddress);
            insertName($connection, $personId, $firstName, $middlename, $surname, $suffix);
            insertAddress($connection, $barangayId, $barangay, $address);
            insertPersonAddress($connection, $personId, $barangayId);
            insertLandline($connection, $personId, $landline);
            insertTelephone($connection, $personId, $mobileNumber);
            insertGender($connection, $personId, $gender);
            insertReligion($connection, $personId, $religion);
            insertMaritalStatus($connection, $personId, $maritalStatus);
            insertBloodType($connection, $personId, $bloodType);
            insertEducationalAttainment($connection, $personId, $educationalAttainment);
            insertGovernmentMembership($connection, $personId, $isActiveVoter, $is4psMember);
            insertEmploymentStatus($connection, $personId, $employmentStatus, $categoryOfEmployment, $natureOfEmployment);
            if($employmentStatus == "Employed" || $employmentStatus == "Self-employed") {
                if($occupation == "Other") {
                    insertJob($connection, $personId, NULL, $otherOccupation);
                } else {
                    insertJob($connection, $personId, $occupation, NULL);
                }
                insertIncome($connection, $personId, $income, NULL);
            } else {
                insertJob($connection, $personId, NULL, NULL);
                insertIncome($connection, $personId, NULL, NULL);
            }
            insertOrganization($connection, $personId, $organization, $organizationContactPerson, $organizationOfficeAddress, $organizationTelephoneNumber);
            insertIdReferenceNumber($connection, $personId, $SSSNo, $GSISNo, $PSNNo, $isPhilhealthMember, $philhealthNumber);
            insertPerson($connection, $fatherId, NULL, NULL);
            insertName($connection, $fatherId, $fatherFirstName, $fatherMiddleName, $fatherSurname, $fatherSuffix);
            insertRelationship($connection, $personId, $fatherId, "Father");
            insertPerson($connection, $motherId, NULL, NULL);
            insertName($connection, $motherId, $motherFirstName, $motherMiddleName, $motherSurname, $motherSuffix);
            insertRelationship($connection, $personId, $motherId, "Mother");
            if (!empty($guardianFirstName)) {
                insertPerson($connection, $guardianId, NULL, NULL);
                insertName($connection, $guardianId, $guardianFirstName, $guardianMiddleName, $guardianSurname, $guardianSuffix);
                insertRelationship($connection, $personId, $guardianId, "Guardian");
                insertTelephone($connection, $guardianId, $guardianContactNumber);
            }
            insertPWDDisease($connection, $personId, $typeOfDisability, $medicalCondition, $causeOfDisability, $inborn, $acquired, $statusOfDisability);
            insertPWDPhysician($connection, $personId, $physicianName, $physicianLicence);
            insertPWDApplicationAccomplisher($connection, $personId, $accomplishedBy, $accomplisherName);
            // Commit the transaction
            $connection->commit();
            echo "All queries executed successfully";
        } catch (Exception $e) {
            // Rollback the transaction in case of any errors
            $connection->rollback();
            $errorMessage =  "Error: " . $e->getMessage();
            header("location: ../error.html?error_message=" . urlencode($errorMessage));
            exit();
        }
        return "Success";
    }
?>

