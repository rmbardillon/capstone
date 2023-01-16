<?php

session_start();
unset($_SESSION['username']);
header("location: ../../login/citizen.html");
exit();