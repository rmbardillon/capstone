<?php

session_start();
unset($_SESSION['admin-data']);
header("location: ../index.html");
exit();