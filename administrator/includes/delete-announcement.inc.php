<?php

require_once 'dbh.inc.php';
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $sql = "DELETE FROM announcement WHERE id=?";
    $stmt = $connection->prepare($sql);

    mysqli_stmt_bind_param($stmt, "s", $id);
    mysqli_stmt_execute($stmt); 
    mysqli_stmt_close($stmt);
    header("location: ../announcement.html?deleted=success");
    exit();
}