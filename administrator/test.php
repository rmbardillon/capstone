<?php

$id_number = "SC" . substr(microtime(true), -6);

// echo($id_number);
function generateUniqueNumbers() {
    $numbers = array();
    while (count($numbers) < 6) {
        $random = mt_rand(1, 999999);
        if (!in_array($random, $numbers)) {
            $numbers[] = $random;
        }
    }
    return $numbers;
}

$unique_numbers = generateUniqueNumbers();
echo($unique_numbers[0]);
