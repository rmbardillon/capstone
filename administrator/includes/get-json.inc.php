<?php
// Get the user ID from the GET request
$userId = $_GET['userId'];

// Create a unique filename for the JSON file based on the user ID
$filename = '../savedata/form-data-' . $userId . '.json';

// Check if the JSON file exists
if (file_exists($filename)) {
    // Read the JSON data from the file
    $jsonData = file_get_contents($filename);

    // Decode the JSON data
    $data = json_decode($jsonData, true);

    // Send a JSON response containing the data
    echo json_encode($data);
} else {
    // Send a JSON response indicating failure
    $response = array(
        'success' => false,
        'message' => 'Draft not found'
    );
    echo json_encode($response);
}
?>
