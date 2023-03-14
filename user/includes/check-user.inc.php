<?php
require_once 'dbh.inc.php';
require_once 'sql.inc.php';
// Get the data from AJAX
$first_name = $_POST['first_name'];
$last_name = $_POST['last_name'];
$birthday = $_POST['birthday'];
$barangay = $_POST['barangay'];

echo checkUser($connection, $first_name, $last_name, $birthday, $barangay);

?>
