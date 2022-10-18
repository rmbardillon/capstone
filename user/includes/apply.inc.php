<?php

if (isset($_POST['sr_citizen_birthday_cash_gift'])) {
    session_start();
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';
    
    $username = $_SESSION['username'];
    $last_name = $_POST['huling-pangalan'];
    $name = $_POST ['pangalan'];
    $middle_name = $_POST ['gitnang-pangalan'];
    $osca_id_number = $_POST ['osca'];
    $address = $_POST ['num-tirahan'];
    $barangay = $_POST ['barangay'];
    $date_of_birth = $_POST ['kapanganakan'];
    $contact_number = $_POST ['telepono'];

    
    insertSeniorCitizenBirthdayCashGift($connection, $username, $last_name, $name, $middle_name, $osca_id_number, $address, $barangay, $date_of_birth, $contact_number);

} else if(isset($_POST['sr_citizen_birthday_cash_incentive'])) {
    session_start();
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';

    $username = $_SESSION['username'];
    $last_name = $_POST['huling-pangalan'];
    $first_name = $_POST ['pangalan'];
    $middle_name = $_POST ['gitnang-pangalan'];
    $osca_id_number = $_POST ['osca'];
    $address = $_POST ['num-tirahan'];
    $barangay = $_POST ['barangay'];
    $date_of_birth = $_POST ['kapanganakan'];
    $contact_number = $_POST ['telepono'];

    insertSeniorCitizenBirthdayCashIncentive($connection, $username, $last_name, $first_name, $middle_name, $osca_id_number, $address, $barangay,$date_of_birth, $contact_number);

} else {
        header("location: ../registration.html");
        exit();
}