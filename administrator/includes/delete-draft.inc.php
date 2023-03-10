<?php

require_once 'dbh.inc.php';
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $sql = "DELETE FROM draft WHERE DRAFT_ID=?";
    $stmt = $connection->prepare($sql);

    mysqli_stmt_bind_param($stmt, "s", $id);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    // Get the path to the JSON file
    $jsonFilePath = "../savedata/form-data-$id.json";

    // Delete the JSON file
    if (file_exists($jsonFilePath)) {
        unlink($jsonFilePath);
    }
    header("location: ../drafts.html?deleted=success");
    exit();
}