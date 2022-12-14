<?php 
    
    require ('fpdf/fpdf.php');
    $pdf = new fpdf();
    $pdf -> AddPage();

    //header
    $pdf -> SetFont ('Arial', 'B',16);
    $pdf -> cell (190,20,'Aplikasyon Sa Pagsapi',0,0,'C');

    $pdf -> ln();

    //uri ng id
    $pdf -> cell (40,5,'Bago',1,0,'C');
    $pdf -> cell (50,5,'Lumipat',1,0,'C');
    $pdf -> cell (60,5,'Magpapalit',1,0,'C');
    $pdf -> cell (40,5,'Nawawala',1,0,'C');
    
    $pdf -> ln();

    $pdf -> cell (40,5,'','B',0,'l');
    $pdf -> cell (50,5,'',0,0,'l');
    $pdf -> cell (60,5,'',0,0,'l');
    $pdf -> cell (40,5,'','B',0,'r');

    //Name
    $pdf -> ln(10);

    $pdf -> cell (40,5,'First Name',0,0,'c');
    $pdf -> cell (50,5,'Middle Name',0,0,'c');
    $pdf -> cell (60,5,'Last Name',0,0,'c');
    $pdf -> cell (40,5,'Suffix',0,0,'c');

    $pdf -> ln(10);
    $name = 'zeth';
    $lastname = '123zeth';

    $pdf -> cell (40,5,$name,'B',0,'c');
    $pdf -> cell (7.25,5,'',0,0,'c');
    $pdf -> cell (40,5,$lastname,'B',0,'c');
    $pdf -> cell (7.25,5,'',0,0,'c');
    $pdf -> cell (40,5,'','B',0,'c');
    $pdf -> cell (7.25,5,'',0,0,'c');
    $pdf -> cell (40,5,'','B',0,'c');
   
    //address
    $pdf -> ln(10);
    $pdf -> cell (40,5,'Barangay',0,0,'l');
    $pdf -> cell (50,5,'',0,0,'l');
    $pdf -> cell (60,5,'',0,0,'l');
    $pdf -> cell (40,5,'Tirahan',0,0,'r');

    $pdf -> ln();

    $pdf -> cell (40,5,'','B',0,'l');
    $pdf -> cell (50,5,'',0,0,'l');
    $pdf -> cell (60,5,'',0,0,'l');
    $pdf -> cell (40,5,'','B',0,'r');

    //sex
    $pdf -> ln(10);

    $pdf -> cell (66,5,'Sex',0,0,'c');
    $pdf -> cell (66,5,'Marital Status',0,0,'c');
    $pdf -> cell (66,5,'Edad',0,0,'c');
    
    $pdf -> ln(10);

    $pdf -> cell (63,5,'','B',0,'c');
    $pdf -> cell (63,5,'','B',0,'c');
    $pdf -> cell (63,5,'','B',0,'c');

    //Date of birth
    $pdf -> ln(20);

    $pdf -> cell (15,5,'Date of Birth',0,0,'l');
    $pdf -> cell (50,5,'',0,0,'l');
    $pdf -> cell (60,5,'',0,0,'l');
    $pdf -> cell (40,5,'Lugar ng Kapanganakan',0,0,'l');

    $pdf -> ln();

    $pdf -> cell (40,5,'','B',0,'l');
    $pdf -> cell (29,5,'',0,0,'l');
    $pdf -> cell (60,5,'',0,0,'l');
    $pdf -> cell (60,5,'','B',0,'r');

    //telepono
    $pdf -> ln(20);

    $pdf -> cell (66,5,'Telepono',0,0,'c');
    $pdf -> cell (66,5,'Relihiyon',0,0,'c');
    $pdf -> cell (66,5,'Hanap Buhay',0,0,'c');
    
    $pdf -> ln(10);

    $pdf -> cell (66,5,'','B',0,'c');
    $pdf -> cell (66,5,'','B',0,'c');
    $pdf -> cell (60,5,'','B',0,'c');

    //Pensyon
    $pdf -> ln(20);

    $pdf -> cell (100,5,'May pensyon na tinatanggap',0,0,'c');
    $pdf -> cell (50,5,'saan',0,0,'c');
    $pdf -> cell (66,5,'Magkano',0,0,'c');
    
    $pdf -> ln(10);

    $pdf -> cell (66,5,'','B',0,'c');
    $pdf -> cell (66,5,'','B',0,'c');
    $pdf -> cell (60,5,'','B',0,'c');

    //pangalan ng asawa
    $pdf -> ln(20);

    $pdf -> cell (15,5,'Pangalan ng Asawa',0,0,'l');
    $pdf -> cell (50,5,'',0,0,'l');
    $pdf -> cell (60,5,'',0,0,'l');
    $pdf -> cell (40,5,'Edad ng Asawa',0,0,'l');

    $pdf -> ln();

    $pdf -> cell (40,5,'','B',0,'l');
    $pdf -> cell (29,5,'',0,0,'l');
    $pdf -> cell (60,5,'',0,0,'l');
    $pdf -> cell (60,5,'','B',0,'r');

    //ilan ang anak
    $pdf -> ln(20);

    $pdf -> cell (15,5,'Ilan ang anak (Ilagay ang 0 kung wala)',0,0,'l');
    $pdf -> cell (50,5,'',0,0,'l');
    $pdf -> cell (60,5,'',0,0,'l');
    $pdf -> cell (40,5,'Kasama sa bahay?',0,0,'l');

    $pdf -> ln();

    $pdf -> cell (40,5,'','B',0,'l');
    $pdf -> cell (29,5,'',0,0,'l');
    $pdf -> cell (60,5,'',0,0,'l');
    $pdf -> cell (60,5,'','B',0,'r');

    //Pangalan ng anak
    $pdf -> ln(20);
    $pdf -> cell (40,5,'Pangalan ng Anak','b',0,'r');
    $pdf -> cell (50,5,'Edad','b',0,'C');
    $pdf -> cell (60,5,'Tirahan','b',0,'C');
    $pdf -> cell (40,5,'Telepono','b',0,'C');
    
    $pdf -> ln(10);

    $pdf -> cell (40,5,'',1,0,'l');
    $pdf -> cell (50,5,'',1,0,'l');
    $pdf -> cell (60,5,'',1,0,'l');
    $pdf -> cell (40,5,'',1,0,'r');


    $pdf -> Output();
?>
