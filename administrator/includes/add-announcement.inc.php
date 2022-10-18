<?php
    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';

if (isset($_POST['add-announcement-submit'])) {
    $title = $_POST['announcement'];
    $for = $_POST['announcementFor']; 
    $where = $_POST['barangay']; 
    $message = $_POST['announcementMessage'];

    addAnnouncement($connection, $title, $for, $where, $message);
} else if(isset($_POST['update-announcement-submit'])) {
    $id = $_GET['edit'];
    $title = $_POST['announcement'];
    $for = $_POST['announcementFor']; 
    $where = $_POST['barangay']; 
    $message = $_POST['announcementMessage'];

    updateAnnouncement($connection, $title, $for, $where, $message, $id);
}