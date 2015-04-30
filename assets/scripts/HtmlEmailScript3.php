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
</style>
</head>';
	$message .= '<body bgcolor="#999999">
<!--background table--><table width="600px" bgcolor="#999999" align="center" cellspacing="0" cellpadding="0"><tr><td align="center">
<!--main container--><table width="95%" align="center" cellspacing="0" cellpadding="0"><tr><td><!--main container-->
<!--header--><table style="color:#fff; border-top-left-radius:5px;border-top-right-radius:5px;" border="0" width="100%" align="center" bgcolor="#000" cellspacing="0" cellpadding="0" bordercollapse="collapse">
<tr><td>&nbsp;</td>
<td width="100" valign="top"><p class="footer" style="padding-left: 10px;">View in browser</p></td>
<td align="right" style="padding: 20px;"><img src="http://wip.lehmanmillet.com/emd_serono/hypoxia_email_2/EMD_HypoxiaExposed_Eyes_8.jpg"></td>
<td>&nbsp;</td></tr>
<tr height="100"><td>&nbsp;</td>
<td valign="bottom"><img style="display: block;" src="http://wip.lehmanmillet.com/emd_serono/hypoxia_email_2/hypox_top.png"></td>
<td><table align="center"><tr colspan="2"><td><p class="header" align="center"><span style="font-size: 26px;">Look out</span> <br><span style="font-size: 14px;">for more about</span> <br>hypoxia\'s hidden <br><span style="font-size: 26px;">threat</span>.</p><br></td></tr></table></td>
<td>&nbsp;</td></tr>
<tr style="color:#000;" bgcolor="#fff"><td>&nbsp;</td>
<td valign="top"><img style="display: block;" src="http://wip.lehmanmillet.com/emd_serono/hypoxia_email_2/hypox_bott.png"></td>
<td>&nbsp;</td>
<td>&nbsp;</td></tr>
</table><!--end header-->
<!--main body--><table cellspacing="0" cellpadding="0" width="100%" bgcolor="#fff">
<tr height="200"><td width="108" >&nbsp;</td>
<td align="center" width="67%">
<p style="margin-top: -10px;"><span style="font-size: 14px; text-transform: uppercase; font-weight: bold;">What\'s waiting to strike?</span><br>
You\'ll be the first to know.</p>
<p style="text-align: justify;">All year, Hypoxia Exposed will feature regular new insights and resources on tumor hypoxia. Check back soon to learn more—and to see how Hypoxia Exposed is driving our efforts to advance therapeutic outcomes.<br></p><br>
<div><!--[if mso]>
  <v:roundrect xmlns:v="urn:schemas-microsoft-com:vml" xmlns:w="urn:schemas-microsoft-com:office:word" href="http://www.hypoxiaexposed.com" style="height:40px;v-text-anchor:middle;width:100px;" arcsize="10%" strokecolor="#a3adb8" fillcolor="#53d733">
    <w:anchorlock/>
    <center style="color:#ffffff;font-family:sans-serif;font-size:13px;font-weight:bold;">Explore</center>
  </v:roundrect>
<![endif]--><a href="http://www.hypoxiaexposed.com/?utm_source=Email1&utm_medium=email&utm_campaign=2015Launch"
style="background-color:#53d733;border:1px solid #999999;border-radius:4px;color:#ffffff;display:inline-block;font-family:Arial, sans-serif;font-size:15px;font-weight:bold;line-height:30px;text-align:center;text-decoration:none;width:180px;-webkit-text-size-adjust:none;mso-hide:all;">Get the latest insights</a></div></a>
                                    </div><br><br></td>
<td width="108">&nbsp;</td></tr>';

	if($Insight1 == "true"){
	$message .= '<tr bgcolor="#fff"><td align="center" valign="top" style="padding-top: 15px;"><img width="60" src="http://wip.lehmanmillet.com/emd_serono/hypoxia_email_2/black_download_icon.jpg"></td><td align="left"><p><span style="font-size: 14px; text-transform: uppercase; font-weight: bold; ">Defining hypoxia</span></p>
<p style="text-align: justify; padding-right: 10px;">Learn how declining oxygen levels can lead to different biological responses across tissues and organs.</p><div align="right"><!--[if mso]>
  <v:roundrect xmlns:v="urn:schemas-microsoft-com:vml" xmlns:w="urn:schemas-microsoft-com:office:word" href="http://www.hypoxiaexposed.com" style="height:40px;v-text-anchor:middle;width:100px;" arcsize="10%" strokecolor="#a3adb8" fillcolor="#53d733">
    <w:anchorlock/>
    <center style="color:#ffffff;font-family:sans-serif;font-size:13px;font-weight:bold;">Explore</center>
  </v:roundrect>
<![endif]--><a href="http://www.hypoxiaexposed.com/?utm_source=Email1&utm_medium=email&utm_campaign=2015Launch"
style="background-color:#53d733;border:1px solid #999999;border-radius:4px;color:#ffffff;display:inline-block;font-family:Arial, sans-serif;font-size:15px;font-weight:bold;line-height:30px;text-align:center;text-decoration:none;width:80px;-webkit-text-size-adjust:none;mso-hide:all;">Download</a></div></a>
                                    </div><br><br></td><td>&nbsp;</td></tr>';
	}
	
	if($Insight2 == "true"){
	$message .= '<tr bgcolor="#ccc"><td align="center" valign="top" style="padding-top: 15px;"><img width="60" src="http://wip.lehmanmillet.com/emd_serono/hypoxia_email_2/black_download_icon.jpg"></td><td align="left"><p><span style="font-size: 14px; text-transform: uppercase; font-weight: bold; ">Origins of hypoxia</span></p>
<p style="text-align: justify; padding-right: 10px;">See how aberrant vasculature can lead to the development of hypoxic tumor microenvironments. </p><div align="right"><!--[if mso]>
  <v:roundrect xmlns:v="urn:schemas-microsoft-com:vml" xmlns:w="urn:schemas-microsoft-com:office:word" href="http://www.hypoxiaexposed.com" style="height:40px;v-text-anchor:middle;width:100px;" arcsize="10%" strokecolor="#a3adb8" fillcolor="#53d733">
    <w:anchorlock/>
    <center style="color:#ffffff;font-family:sans-serif;font-size:13px;font-weight:bold;">Explore</center>
  </v:roundrect>
<![endif]--><a href="http://www.hypoxiaexposed.com/?utm_source=Email1&utm_medium=email&utm_campaign=2015Launch"
style="background-color:#53d733;border:1px solid #999999;border-radius:4px;color:#ffffff;display:inline-block;font-family:Arial, sans-serif;font-size:15px;font-weight:bold;line-height:30px;text-align:center;text-decoration:none;width:80px;-webkit-text-size-adjust:none;mso-hide:all;">Download</a></div></a>
                                    </div><br><br></td><td>&nbsp;</td></tr>';
	}
	
	if($Insight3 == "true"){
	$message .='<tr bgcolor="#fff"><td align="center" valign="top" style="padding-top: 15px;"><img width="60" src="http://wip.lehmanmillet.com/emd_serono/hypoxia_email_2/black_download_icon.jpg"></td><td align="left"><p><span style="font-size: 14px; text-transform: uppercase; font-weight: bold; ">Tumor hypoxia vs tumor anoxia</span></p>
<p style="text-align: justify; padding-right: 10px;">Explore how oxygen deprivation and the complete lack of oxygen can lead to a paradoxical impact on tumor cells.</p><div align="right"><!--[if mso]>
  <v:roundrect xmlns:v="urn:schemas-microsoft-com:vml" xmlns:w="urn:schemas-microsoft-com:office:word" href="http://www.hypoxiaexposed.com" style="height:40px;v-text-anchor:middle;width:100px;" arcsize="10%" strokecolor="#a3adb8" fillcolor="#53d733">
    <w:anchorlock/>
    <center style="color:#ffffff;font-family:sans-serif;font-size:13px;font-weight:bold;">Explore</center>
  </v:roundrect>
<![endif]--><a href="http://www.hypoxiaexposed.com/?utm_source=Email1&utm_medium=email&utm_campaign=2015Launch"
style="background-color:#53d733;border:1px solid #999999;border-radius:4px;color:#ffffff;display:inline-block;font-family:Arial, sans-serif;font-size:15px;font-weight:bold;line-height:30px;text-align:center;text-decoration:none;width:80px;-webkit-text-size-adjust:none;mso-hide:all;">Download</a></div></a>
                                    </div><br><br></td><td>&nbsp;</td></tr>';
	}
	
	if($Insight4 == "true"){								
	$message .='<tr bgcolor="#ccc"><td align="center" valign="top" style="padding-top:15px;"><img width="60" src="http://wip.lehmanmillet.com/emd_serono/hypoxia_email_2/black_download_icon.jpg"></td><td align="left"><p><span style="font-size: 14px; text-transform: uppercase; font-weight: bold; ">Impact of declining oxygenation</span></p>
<p style="text-align: justify; padding-right: 10px;">Find out when and how oxygen deprivation can have a pahtological impact on many tissues.</p><div align="right"><!--[if mso]>
  <v:roundrect xmlns:v="urn:schemas-microsoft-com:vml" xmlns:w="urn:schemas-microsoft-com:office:word" href="http://www.hypoxiaexposed.com" style="height:40px;v-text-anchor:middle;width:100px;" arcsize="10%" strokecolor="#a3adb8" fillcolor="#53d733">
    <w:anchorlock/>
    <center style="color:#ffffff;font-family:sans-serif;font-size:13px;font-weight:bold;">Explore</center>
  </v:roundrect>
<![endif]--><a href="http://www.hypoxiaexposed.com/?utm_source=Email1&utm_medium=email&utm_campaign=2015Launch"
style="background-color:#53d733;border:1px solid #999999;border-radius:4px;color:#ffffff;display:inline-block;font-family:Arial, sans-serif;font-size:15px;font-weight:bold;line-height:30px;text-align:center;text-decoration:none;width:80px;-webkit-text-size-adjust:none;mso-hide:all;">Download</a></div></a>
                                    </div><br><br></td><td>&nbsp;</td></tr>';
	}
	
	$message .='<tr><td>&nbsp;</td>
<td align="center"><p><span style="font-size: 14px; text-transform: uppercase; font-weight: bold;">Coming soon:</span><br>New insights and interviews</p>
<p>Visit HypoxiaExposed.com soon to dive even deeper into the science with hypoxia specialists. </p><br></td>
<td>&nbsp;</td>                                 
</table>
<!--end main body-->
<!--start footer--><table width="100%" bgcolor="#cc3366" border="0" cellpadding="0" cellspacing="0" style="border-bottom-left-radius:5px; border-bottom-right-radius:5px;">
<tr><td style="padding-left: 10px;"><img height="20" src="http://wip.lehmanmillet.com/emd_serono/hypoxia_email/whiteHE_horiz.png"></td>
<td align="left"></td>
<td style="padding-right: 15px;"><img align="right" width="40" src="http://wip.lehmanmillet.com/emd_serono/hypoxia_email_2/halfcirc.jpg" style="display: block; margin: 0;"></td></tr>
<tr>
<td align="center" colspan="3"><p class="footer">&copy; EMD Serono, Inc. US-NON-XXXX-XXXX April 2015<br>
1 Technology Pl, Rockland, MA 02370 USA
</p></td>
<td></td>

</tr>
<tr><td colspan="3"><img align="right" height="20" style="padding-right: 10px;" src="http://wip.lehmanmillet.com/emd_serono/hypoxia_email_2/New_YouTube_Logo_475x332.jpg"><p class="footer" align="center">Unsubscribe</p></td></tr></table><!--end table footer-->
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