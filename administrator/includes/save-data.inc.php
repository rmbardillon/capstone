<?php
    // Get the JSON data from the POST request
    $jsonData = file_get_contents('php://input');

    // Decode the JSON data
    $data = json_decode($jsonData, true);

    // Create a unique filename for the JSON file based on the form name
    $filename = '../assets/savedata/form-data-' . $data['formName'] . '.json';

    // Write the JSON data to the file
    $file = fopen($filename, 'w');
    fwrite($file, $jsonData);
    fclose($file);

    // Send a JSON response indicating success
    $response = array(
        'success' => true,
        'message' => 'Form data saved successfully'
    );
    echo json_encode($response);
?>
