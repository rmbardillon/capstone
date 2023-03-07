<?php

require_once 'dbh.inc.php';
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    
    $sql = "DELETE FROM security_questions WHERE ADMINISTRATOR_ID=?";
    $stmt = $connection->prepare($sql);

    mysqli_stmt_bind_param($stmt, "s", $id);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);

    $sql = "DELETE FROM administrator WHERE id=?";
    $stmt = $connection->prepare($sql);

    mysqli_stmt_bind_param($stmt, "s", $id);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    header("location: ../administrator-list.html?deleted=success");
    exit();
}