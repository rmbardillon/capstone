<?php 
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';
    require_once 'sql.inc.php';

    if(isset($_POST['soloParentRenew'])) {
        $formControlNumber = $_POST['formControlNumber'];
        $status = "PENDING";
        $applicationType = "Renewal";
        $personId = $_POST['person_id'];
        $id_number = $_POST['username'];
        $applicantType = "Solo Parent";
        $surname = $_POST['surname'];
        $firstName = $_POST['firstName'];
        $middlename = $_POST['middlename'];
        $suffix = $_POST['suffix'];
        $soloParentDOB = $_POST['soloParentDOB'];
        $age = $_POST['age'];
        $placeOfBirth = $_POST['placeOfBirth'];
        $gender = $_POST['gender'];
        $barangayId = $_POST['address_id'];
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
        $childID = $_POST['child_id'];
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
            // insertPerson($connection, $personId, $soloParentDOB, $email);
            updatePersonEmail($connection, $personId, $email);
            // insertApplicant($connection, $personId, $applicantType, $id_number, $placeOfBirth, $formControlNumber);
            updateApplicant($connection, $personId, $formControlNumber);
            // insertTransactionType($connection, $personId, $applicationType, $id_number);
            updateTransactionType($connection, $personId, $applicationType, $status);
            // insertName($connection, $personId, $firstName, $middlename, $surname, $suffix);
            updateName($connection, $personId, $firstName, $middleName, $surname, $suffix);
            // insertAddress($connection, $barangayId, $barangay, $address);
            updateAddress($connection, $barangayId, $barangay, $address);
            // insertPersonAddress($connection, $personId, $barangayId);
            // insertGender($connection, $personId, $gender);
            // insertEducationalAttainment($connection, $personId, $educationalAttainment);
            updateEducationalAttainment($connection, $personId, $educationalAttainment);
            // insertCompany($connection, $personId, $company);
            updateCompany($connection, $personId, $company);
            // insertIncome($connection, $personId, $monthlyIncome, $totalFamilyIncome);
            updateIncome($connection, $personId, $monthlyIncome, $totalFamilyIncome);
            // insertTelephone($connection, $personId, $telephone);
            updateTelephone($connection, $personId, $telephone);
            if($job == "Other") {
                // insertJob($connection, $personId, NULL, $otherOccupation);
                updateJob($connection, $personId, NULL, $otherOccupation);
            } else {
                updateJob($connection, $personId, $job, NULL);
            }
            if (count($childFirstName) >= 1) {
                for ($i=0; $i < count($childFirstName); $i++) {
                    $childId = $childID[$i];
                    // insertPerson($connection, $childId, $soloParentChildDOB[$i], NULL);
                    updateName($connection, $childId, $childFirstName[$i], $childMiddleName[$i], $childLastName[$i], $childSuffix[$i]);
                    updateMaritalStatus($connection, $childId, $maritalStatus[$i]);
                    updateEducationalAttainment($connection, $childId, $childEducationalAttainment[$i]);
                    if($childOccupation[$i] == "Other") {
                        updateJob($connection, $childId, NULL, $otherChildOccupation);
                    } else {
                        updateJob($connection, $childId, $childOccupation[$i], NULL);
                    }
                    updateIncome($connection, $childId, $childIncome[$i], NULL);
                    // insertRelationship($connection, $personId, $childId, $childRelationship[$i]);
                }
            }
            updateSoloParentLongText($connection, $personId, $soloParentClassification, $soloParentNeeds, $soloParentFamilyResources);
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
        header("location: ../home.html?success=true");
        exit();
    } else if (isset($_POST['pwdRenew'])) {
        $formControlNumber = $_POST['formControlNumber'];
        $status = "PENDING";
        $applicationType = "Renewal";
        $personId = $_POST['person_id'];
        $id_number = $_POST['username'];
        $applicantType = "Solo Parent";
        $surname = $_POST['surname'];
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
        $barangayId = $_POST['address_id'];
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
        $fatherId = $_POST['father_id'];
        $fatherSurname = $_POST['fatherSurname'];
        $fatherFirstName = $_POST['fatherFirstName'];
        $fatherMiddleName = $_POST['fatherMiddlename'];
        $fatherSuffix = $_POST['fatherSuffix'];
        $motherId = $_POST['mother_id'];
        $motherSurname = $_POST['motherSurname'];
        $motherFirstName = $_POST['motherFirstName'];
        $motherMiddleName = $_POST['motherMiddlename'];
        $motherSuffix = $_POST['motherSuffix'];
        $guardianId = $_POST['guardian_id'];
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
            // insertPerson($connection, $personId, $pwdDOB, $emailAddress);
            updatePersonEmail($connection, $personId, $emailAddress);
            // insertApplicant($connection, $personId, $applicantType, $id_number, NULL, $formControlNumber);
            updateApplicant($connection, $personId, $formControlNumber);
            // insertTransactionType($connection, $personId, $applicationType, $id_number);
            updateTransactionType($connection, $personId, $applicationType, $status);
            // insertPreviousAddress($connection, $personId, $old_region, $old_province, $old_city, $old_barangay, $previousAddress);
            // insertName($connection, $personId, $firstName, $middlename, $surname, $suffix);
            updateName($connection, $personId, $firstName, $middlename, $surname, $suffix);
            // insertAddress($connection, $barangayId, $barangay, $address);
            updateAddress($connection, $barangayId, $barangay, $address);
            // insertPersonAddress($connection, $personId, $barangayId);
            // insertLandline($connection, $personId, $landline);
            updateLandline($connection, $personId, $landline);
            updateTelephone($connection, $personId, $mobileNumber);
            updateGender($connection, $personId, $gender);
            updateReligion($connection, $personId, $religion);
            updateMaritalStatus($connection, $personId, $maritalStatus);
            // insertBloodType($connection, $personId, $bloodType);
            updateEducationalAttainment($connection, $personId, $educationalAttainment);
            updateGovernmentMembership($connection, $personId, $isActiveVoter, $is4psMember);
            updateEmploymentStatus($connection, $personId, $employmentStatus, $categoryOfEmployment, $natureOfEmployment);
            if($employmentStatus == "Employed" || $employmentStatus == "Self-employed") {
                if($occupation == "Other") {
                    updateJob($connection, $personId, NULL, $otherOccupation);
                } else {
                    updateJob($connection, $personId, $occupation, NULL);
                }
                updateIncome($connection, $personId, $income, NULL);
            } else {
                updateJob($connection, $personId, NULL, NULL);
                updateIncome($connection, $personId, NULL, NULL);
            }
            updateOrganization($connection, $personId, $organization, $organizationContactPerson, $organizationOfficeAddress, $organizationTelephoneNumber);
            updateIdReferenceNumber($connection, $personId, $SSSNo, $GSISNo, $PSNNo, $isPhilhealthMember, $philhealthNumber);

            // insertPerson($connection, $fatherId, NULL, NULL);
            updateName($connection, $fatherId, $fatherFirstName, $fatherMiddleName, $fatherSurname, $fatherSuffix);
            // insertRelationship($connection, $personId, $fatherId, "Father");
            // insertPerson($connection, $motherId, NULL, NULL);
            updateName($connection, $motherId, $motherFirstName, $motherMiddleName, $motherSurname, $motherSuffix);
            // insertRelationship($connection, $personId, $motherId, "Mother");
            if (!empty($guardianFirstName)) {
                // insertPerson($connection, $guardianId, NULL, NULL);
                updateName($connection, $guardianId, $guardianFirstName, $guardianMiddleName, $guardianSurname, $guardianSuffix);
                // insertRelationship($connection, $personId, $guardianId, "Guardian");
                updateTelephone($connection, $guardianId, $guardianContactNumber);
            }
            updatePWDDisease($connection, $personId, $typeOfDisability, $medicalCondition, $causeOfDisability, $inborn, $acquired, $statusOfDisability);
            updatePWDPhysician($connection, $personId, $physicianName, $physicianLicence);
            updatePWDApplicationAccomplisher($connection, $personId, $accomplishedBy, $accomplisherName);
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
        header("location: ../home.html?success=true");
        exit();
    } else {
        header("Location: ../home.html?error=invalidaccess");
        exit();
    }
?>