<?php

	// nothing above this line is involved in email
	$SenderEmail = $_POST['sender_email'];
    $EmailAddress = $_POST['email_address'];
    $FirstName = $_POST['first_name'];
    $LastName = $_POST['last_name'];
	$JobTitle = $_POST['job_title'];

	
	
    echo "email=".$EmailAddress."&id=".$FirstName."&db=".$LastName;

	// message
	// Compose a simple HTML email message
	$message = '<html>
					<head>
						<style>
						body
						{
						background: #ddd;
						font-family: "lucida grande", tahoma, verdana;
						font-size:16px;
						font-weight: bold;
						color: #fff;
						}
						.content{
						overflow:hidden;
						background-color: #336699;
						margin: 10px;
						padding:10px;
						}
						</style>
						<title>HYPOXIA EXPOSED</title>
					</head>';
	$message .= '<body>';
	$message .= '<h1 style="color:#f40;">Hypoxia Exposed</h1>';
	$message .= '<p>'.$FirstName.', here is your requested information:</p>';
	$message .= '<div class="content">
					<h1>Hypoxia Exposed Information request:</h1>
					<br />
					<img src="/img/test.png" />
					<br />
				</div>';

	$message .= '</body></html>';

	// To send HTML mail, the Content-type header must be set
	$headers  = 'MIME-Version: 1.0' . "\r\n";
	$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

	// Create email headers
	$headers .= 'From: '.$SenderEmail."\r\n".
    'Reply-To: '.$SenderEmail."\r\n" .
    'X-Mailer: PHP/' . phpversion();
	$to      = $EmailAddress;
	$subject = 'You have signed up for Hypoxia Exposed';

	// Sending email
	if(mail($to, $subject, $message, $headers)){
		echo 'Your mail has been sent successfully.';
	} else{
		echo 'Unable to send email. Please try again.';
	}
?>