<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $pdf_file = $_FILES['pdf-file'];
  $pdf_path = 'uploads/' . $pdf_file['name'];
  move_uploaded_file($pdf_file['tmp_name'], $pdf_path);
  $pdf_link = '<a href="' . $pdf_path . '" target="_blank">View PDF</a>';
  echo $pdf_link;
}
?>
