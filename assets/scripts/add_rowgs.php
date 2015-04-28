<?php
error_reporting(E_ALL);
//please coment above line if you end this by a header location=redirect it will ruin your code
/*
Logon to your Google account and create a new spreadsheet.
 add  fields(collums name ) and save your spreadsheet giving a name . Choose meanfull name if you want to sort later
 construct the value array based on your requirment but make sure that in the created
 new spreadsheet you have same collums name ....otherwise will exit silently
 * 
 * s1 is default spreadsheet 1 name
 * email@email.com is in standard formating
 * password is in standard format
 * spreadsheet-title is lower-case
 * 
 */

include("google_spreadsheet.php");

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
	
$doc = new googlespreadsheet();
$doc->authenticate("grateful.key.loser@gmail.com", "bellybutton");
$doc->settitleSpreadsheet("testsheet1");
$doc->settitleWorksheet("Sheet1");
$values["sender_email"]=stripslashes($_POST['sender_email']);
$values["email_address"]=stripslashes($_POST['email_address']);
$values["first_name"]=stripslashes($_POST['first_name']);
$values["last_name"]=stripslashes($_POST['last_name']);
$values["job_title"]=stripslashes($_POST['job_title']);
$values["institution_name"]=stripslashes($_POST['institution_name']);
$values["role_name"]=stripslashes($_POST['role_name']);
$values["specialty_name"]=stripslashes($_POST['specialty_name']);
$values["insight1_bool"]=stripslashes($_POST['insight1_bool']);
$values["insight2_bool"]=stripslashes($_POST['insight2_bool']);
$values["insight3_bool"]=stripslashes($_POST['insight3_bool']);
$values["insight4_bool"]=stripslashes($_POST['insight4_bool']);
$my_data = array("sender_email" => $values["sender_email"], "email_address" => $values["email_address"], "first_name" => $values["first_name"], "last_name" => $values["last_name"], "job_title" => $values["job_title"], "institution_name" => $values["institution_name"], "role_name" => $values["role_name"], "specialty_name" => $values["specialty_name"], "insight1_bool" => $values["insight1_bool"], "insight2_bool" => $values["insight2_bool"], "insight3_bool" => $values["insight3_bool"], "insight4_bool" => $values["insight4_bool"]);
$doc->add_row($my_data);
echo "sender_email=".$SenderEmail."&email_address=".$EmailAddress."&first_name=".$FirstName."&last_name=".$LastName."&job_title=".$JobTitle."&institution_name=".$InstitutionName."&role_name=".$RoleName."&specialty_name=".$SpecialtyName."&insight1_bool=".$Insight1."&insight2_bool=".$Insight2."&insight3_bool=".$Insight3."&insight4_bool=".$Insight4;
?>