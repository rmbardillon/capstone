<?php
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';

if (isset($_POST['add-announcement-submit'])) {
    $title = $_POST['announcement'];
    $for = $_POST['announcementFor']; 
    $where = $_POST['barangay']; 
    $from = $_POST['from'];
    $date = $_POST['announcementDate']; 
    $message = $_POST['announcementMessage'];

    addAnnouncement($connection, $title, $for, $where, $message, $date, $from);
} else if(isset($_POST['update-announcement-submit'])) {
    $id = $_GET['edit'];
    $title = $_POST['announcement'];
    $for = $_POST['announcementFor']; 
    $from = $_POST['from'];
    $where = $_POST['barangay']; 
    $date = $_POST['announcementDate']; 
    $message = $_POST['announcementMessage'];

    updateAnnouncement($connection, $title, $for, $from, $where, $message, $id, $date);
}