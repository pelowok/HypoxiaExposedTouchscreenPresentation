<?php

	// nothing above this line is involved in email
	$SenderEmail = $_POST['sender_email'];
    $EmailAddress = $_POST['email_address'];
    $FirstName = $_POST['first_name'];
    $LastName = $_POST['last_name'];
	$JobTitle = $_POST['job_title'];
	$InstitutionName = $_POST['institution_name'];
	$RoleName = $_POST['role_name'];
	$SpecialtyName = $_POST['specialty_name'];
	$Insight1 = $_POST['insight1_bool'];
	$Insight2 = $_POST['insight2_bool'];
	$Insight3 = $_POST['insight3_bool'];
	$Insight4 = $_POST['insight4_bool'];
	
    echo "SenderEmail=".$SenderEmail."&EmailAddress=".$EmailAddress."&FirstName=".$FirstName."&LastName=".$LastName."&JobTitle=".$JobTitle."&InstitutionName=".$InstitutionName."&RoleName=".$RoleName."&SpecialtyName=".$SpecialtyName."&Insight1=".$Insight1."&Insight2=".$Insight2."&Insight3=".$Insight3."&Insight4=".$Insight4;

	// message
	// Compose a simple HTML email message
	$message = '<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Untitled Document</title>
<style type="text/css">
p {font-family: Arial, Helvetica, sans-serif; font-size: 14px;}
.footer {font-family: Arial, Helvetica, sans-serif; font-size: 10px; color: #fff;}
.header {font-family: Arial, Helvetica, sans-serif; font-size: 18px; color: #fff; font-weight: bold; text-transform: uppercase;"}
a {text-decoration: none; color: #ffffff; font-family: Arial, Helvetica, sans-serif; text-transform: uppercase; font-size: 14px; font-weight: bold;}
</style>
</head>';
	$message .= '<body bgcolor="#999999" topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" style="-webkit-font-smoothing: antialiased;width:100% !important;background:#999999;-webkit-text-size-adjust:none;">
<!--background table--><table width="450" bgcolor="#999999" align="center" ><tr><td align="center">
<!--main container--><table width="100%" align="center"><tr><td><!--main container-->
<!--header--><table style="color:#fff; border-top-left-radius:5px;border-top-right-radius:5px;" border="0" width="100%" align="center" bgcolor="#000" cellspacing="0" cellpadding="0" bordercollapse="collapse">
<tr height="30"><td colspan="3" align="left" valign="top"><td width="21%">&nbsp;</td>

<td width="19%" align="right"><p class="footer" style="text-decoration: underline; padding-right: 10px;">View in browser</p></td>
</tr>
<tr height="100">
<td colspan="2" valign="bottom" style="padding-left: 10px;"><a target="_blank" href="http://hypoxiaexposed.com"><img style="display: block;" alt="HYPOXIA EXPOSED" src="http://wip.lehmanmillet.com/emd_serono/hypoxia_email_2/hypox_top.png"></a></td>
<td colspan="4"><p class="header" style="padding-right: 10px; text-align: center;">Look out for more about hypoxia\'s hidden threat
</p></td>

</tr>
<tr style="color:#000;" bgcolor="#fff">
<td colspan="2" valign="top" style="padding-left: 10px;"><img style="display: block;" src="http://wip.lehmanmillet.com/emd_serono/hypoxia_email_2/hypox_bott.png"></td>
<td width="22%">&nbsp;</td>
<td width="21%">&nbsp;</td>
<td colspan="2">&nbsp;</td></tr>
</table>
<!--end header-->
<!--main body--><table cellspacing="0" cellpadding="0" width="100%" bgcolor="#fff">
<tr height="200"><td width="108" >&nbsp;</td>
<td align="center" width="67%">
<p style="margin-top: -10px;"><span style="font-size: 14px; text-transform: uppercase; font-weight: bold;">What\'s waiting to strike?</span><br>
You\'ll be the first to know.</p>
<p style="text-align: justify;">All year, Hypoxia Exposed will feature regular new insights and resources on tumor hypoxia. Check back soon to learn more—and to see how Hypoxia Exposed is driving our efforts to advance therapeutic outcomes.<br></p><table><tr><td bgcolor="#cc3366" align="center" style="padding: 10px;"><a href="#">Get the latest insights</a></td></tr></table>
                                    </td>
<td width="108">&nbsp;</td></tr>

<tr bgcolor="#fff"><td>&nbsp;</td><td align="left"><table cellspacing="10" cellpadding="10"'>;

	if($Insight1 == "true"){
	$message .= '<tr><td align="center" bgcolor="#53d733"><a href="#">Download Defining Hypoxia</a></td></tr>';
	}
	
	if($Insight2 == "true"){
	$message .= '<tr><td align="center" bgcolor="#53d733"><a href="#">Download Origins of Hypoxia</a></td></tr>';
	}
	
	if($Insight3 == "true"){
	$message .='<tr><td align="center" bgcolor="#53d733"><a href="#">Download Tumor Hypoxia vs Tumor Anoxia</a></td></tr>';
	}
	
	if($Insight4 == "true"){								
	$message .='<tr><td align="center" bgcolor="#53d733"><a href="#">Download Impact of Declining Oxygenation</a></td></tr>';
	}
	
	$message .='</table></td><td>&nbsp;</td></tr>';
	
	$message .='<tr><td>&nbsp;</td>
<td align="center"><p><span style="font-size: 14px; text-transform: uppercase; font-weight: bold;">Coming soon:</span><br>New insights and interviews</p>
<p>Visit HypoxiaExposed.com soon to dive even deeper into the science with hypoxia specialists. </p><br></td>
<td>&nbsp;</td>                                 
</table>
<!--end main body-->
<!--start footer--><table width="100%" bgcolor="#cc3366" border="0" cellpadding="0" cellspacing="0" style="border-bottom-left-radius:5px; border-bottom-right-radius:5px;">
<tr><td width="38%" style="padding-left: 10px;"><a target="_blank" href="http://youtube.com/c/hypoxiaexposed2015"><img height="20" src="http://wip.lehmanmillet.com/emd_serono/hypoxia_email/whiteHE_horiz.png">&nbsp;&nbsp;<img height="20" src="http://wip.lehmanmillet.com/emd_serono/hypoxia_email_2/New_YouTube_Logo_475x332.jpg"></a></td>
<td width="26%" align="left"></td>
<td width="32%" style="padding-right: 15px;"><img align="right" width="40" src="http://wip.lehmanmillet.com/emd_serono/hypoxia_email_2/halfcirc.jpg" style="display: block; margin: 0;"></td></tr>


<tr><td style="padding: 0 0 5px 10px;"><img height="40" src="http://wip.lehmanmillet.com/emd_serono/hypoxia_email_2/EMDWhite.png"></td>
<td align="center"><p class="footer" style="text-align: center;"><unsubscribe>Unsubscribe</unsubscribe></p></td>
<td align="right" style="padding-right: 10px;"><img height="18" src="http://wip.lehmanmillet.com/emd_serono/hypoxia_email_2/SeronoWhite.png"></td></tr>
<tr><td colspan="3" style="padding-left: 20px;"><p class="footer" style="text-align: center;">&copy; EMD Serono, Inc. US-NON-XXXX-XXXX April 2015<br>
1 Technology Pl, Rockland, MA 02370 USA
</p></td></tr></table><!--end table footer-->
</td></tr>
</table><!--end main container-->
</td></tr></table><!--end background-->
</body>
</html>';
	
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