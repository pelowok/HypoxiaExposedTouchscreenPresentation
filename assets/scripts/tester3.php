<?php

    $psPreRegEmail = $_POST['email'];
    $FRM_ID = $_POST['first_name'];
    $psBD = $_POST['last_name'];
	$psReply = $_POST['job_title'];

    echo "email=".$psPreRegEmail."&id=".$FRM_ID."&db=".$psBD;

	$to      = $psPreRegEmail;
	$subject = 'Form Completed';
	$message = $psReply;
	$headers = 'From: webmaster@example.com' . "\r\n" .
		'Reply-To: webmaster@example.com' . "\r\n" .
		'X-Mailer: PHP/' . phpversion();

	mail($to, $subject, $message, $headers);

?>