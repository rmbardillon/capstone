<?php
    require_once 'pdf/autoload.inc.php';
   

    use Dompdf\Dompdf;
    use Dompdf\Options;

    
    $options = new Options;
    $options -> setChroot (__DIR__);
    $pdf = new Dompdf($options);
    
    $pdf->loadHtmlFile("test.html");
    $pdf->setPaper('A4','landscape');
    $pdf->render();
    $pdf->stream('document', array('Attachment' => 0));

?>