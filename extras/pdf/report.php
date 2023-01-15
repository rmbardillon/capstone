<?php
//include library
include('library/tcpdf.php');

//make TCPDF object
$pdf = new TCPDF('P','mm','A4');

//remove default header and footer
$pdf->setPrintHeader(false);
$pdf->setPrintFooter(false);

//add page
$pdf->AddPage();

//add content (student list)
//title
$pdf->SetFont('Helvetica','',14);
$pdf->Cell(190,10,"University of Insert Name Here",0,1,'C');

$pdf->SetFont('Helvetica','',8);
$pdf->Cell(190,5,"Student List",0,1,'C');

$pdf->SetFont('Helvetica','',10);
$pdf->Cell(30,5,"Class",0);
$pdf->Cell(160,5,": Programming 101",0);
$pdf->Ln();
$pdf->Cell(30,5,"Teacher Name",0);
$pdf->Cell(160,5,": Prof. John Smith",0);
$pdf->Ln();
$pdf->Ln(2);

//make the table
$html = "
	<table>
		<tr>
			<th>ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
			<th>Gender</th>
			<th>Address</th>
		</tr>
		";
//load the json data
$file = file_get_contents('MOCK_DATA.json');
$data = json_decode($file);

//loop the data
foreach($data as $student){	
	$html .= "
			<tr>
				<td>". $student->id ."</td>
				<td>". $student->first_name ."</td>
				<td>". $student->last_name ."</td>
				<td>". $student->email ."</td>
				<td>". $student->gender ."</td>
				<td>". $student->address ."</td>
			</tr>
			";
}		

$html .= "
	</table>
	<style>
	table {
		border-collapse:collapse;
	}
	th,td {
		border:1px solid #888;
	}
	table tr th {
		background-color:#888;
		color:#fff;
		font-weight:bold;
	}
	</style>
";
//WriteHTMLCell
$pdf->WriteHTMLCell(192,0,9,'',$html,0);	


//output
$pdf->Output();










