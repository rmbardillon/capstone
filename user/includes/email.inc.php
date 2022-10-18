<?php

	use PHPMailer\PHPMailer\PHPMailer;
	use PHPMailer\PHPMailer\Exception;

	if (isset($_POST['email-submit'])) {
		

		require 'PHPMailer/src/Exception.php';
		require 'PHPMailer/src/PHPMailer.php';
		require 'PHPMailer/src/SMTP.php';
		$senderName = $_POST['name'];
		$subject = $_POST['subject'];
		$fromEmail = "populationmanagementsystem@gmail.com";
		$toEmail = $_POST['email'];
		$message = $_POST['message'];
		
		$mail = new PHPMailer(true);
		// $mail->SMTPDebug = 3;
		$mail->isSMTP();
		$mail->Host = "smtp.gmail.com";
		$mail->SMTPAuth = true;
		$mail->Username = "populationmanagementsystem@gmail.com";
		$mail->Password = "ntllidrufjiuujll";
		$mail->SMTPSecure = "tls";
		$mail->Port = "587";
		$mail->From = $fromEmail;
		$mail->FromName = $senderName;
		$mail->addAddress($toEmail, "Romeo JR Bardillon");
		$mail->isHTML(true);
		$mail->Subject = $subject;
		$mail->Body = $message;
		$mail->AltBody = "This is the plain text version of email content";
		
		if (!$mail->send()) {
			header("location: ../home.html?email=failed");
    		exit();
		} else {
			header("location: ../home.html?email=success");
    		exit();
		}
	}