<?php

if (isset($_POST['pwd-approved'])) {
    require_once'dbh.inc.php';
    session_start();
    $id = $_SESSION['id'];
    $currentMonth = date("m");
    $currentDay = date("d");
    $currentYear = date("Y");
    $currentYear = (int)$currentYear + 3;
    $expirationDate = $currentYear."-".$currentMonth."-".$currentDay;

    $sql = "UPDATE pwd_data SET status = 'Approved', expiration_date = ? WHERE id = ?;";
    $stmt = $connection->prepare($sql);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../profile.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "ss", $expirationDate, $id);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    // echo($expirationDate);
    header("location: ../pending-requests.html?error=none");
    exit();
} else if (isset($_POST['pwd-reject'])) {
    require_once'dbh.inc.php';
    session_start();
    $id = $_SESSION['id'];

    $sql = "UPDATE pwd_data SET status = 'Rejected' WHERE id = ?;";
    $stmt = $connection->prepare($sql);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../profile.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "s", $id);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    header("location: ../pending-requests.html?error=none");
    exit();
} else if (isset($_POST['senior-citizen-approve'])) {
    require_once'dbh.inc.php';
    session_start();
    $id = $_SESSION['id'];
    $currentMonth = date("m");
    $currentDay = date("d");
    $currentYear = date("Y");
    $currentYear = (int)$currentYear + 3;
    $expirationDate = $currentYear."-".$currentMonth."-".$currentDay;

    $sql = "UPDATE senior_citizen_data SET status = 'Approved', expiration_date = ? WHERE id = ?;";
    $stmt = $connection->prepare($sql);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../profile.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "ss", $expirationDate, $id);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    header("location: ../pending-requests.html?error=none");
    exit();
} else if (isset($_POST['senior-citizen-reject'])) {
    require_once'dbh.inc.php';
    session_start();
    $id = $_SESSION['id'];

    $sql = "UPDATE senior_citizen_data SET status = 'Rejected' WHERE id = ?;";
    $stmt = $connection->prepare($sql);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../profile.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "s", $id);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    header("location: ../pending-requests.html?error=none");
    exit();
} else if (isset($_POST['solo-parent-approve'])) {
    require_once'dbh.inc.php';
    session_start();
    $id = $_SESSION['id'];
    $currentMonth = date("m");
    $currentDay = date("d");
    $currentYear = date("Y");
    $currentYear = (int)$currentYear + 3;
    $expirationDate = $currentYear."-".$currentMonth."-".$currentDay;

    $sql = "UPDATE solo_parent_data SET status = 'Approved', expiration_date = ? WHERE id = ?;";
    $stmt = $connection->prepare($sql);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../profile.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "ss", $expirationDate, $id);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    header("location: ../pending-requests.html?error=none");
    exit();
} else if (isset($_POST['solo-parent-reject'])) {
    require_once'dbh.inc.php';
    session_start();
    $id = $_SESSION['id'];

    $sql = "UPDATE solo_parent_data SET status = 'Rejected' WHERE id = ?;";
    $stmt = $connection->prepare($sql);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        header("location: ../profile.html?error=stmterror");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "s", $id);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    header("location: ../pending-requests.html?error=none");
    exit();
}

