<?php 
    $personId = $_POST['person_id'];
    require_once 'dbh.inc.php';
    require_once 'sql.inc.php';
    updateIssuedID($connection, $personId);
?>