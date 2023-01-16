<?php

session_start();
unset($_SESSION['admin-data']);
header("location: ../../login/index.html");
exit();