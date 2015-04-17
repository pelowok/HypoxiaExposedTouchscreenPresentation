<?php
   include_once("Google_Spreadsheet.php");

   $user = 'mynameiszak@gmail.com';
   $pass = 'N00bt2st1c';

   $ss = new Google_Spreadsheet($user, $pass);
   $ss->useWorksheet("Sheet1");
   $ss->useSpreadsheet("AIR Test");

   $submitted = $_POST['submitted'];

   if ($submitted == 1) {
      $firstname = $_POST['first_name'];
      $lastname = $_POST['last_name'];
      $jobtitle = $_POST['job_title'];
      $email = $_POST['email'];

      // Do some error checking here if you want
      if (!$email) {
         echo "<h3><font color='red'>*Email Address is required</font></h3>";
      } else {
         // No errors, continue processing registration

         $row = array (
            "First Name" => $firstname
            , "Last Name" => $lastname
            , "Gender" => $jobtitle
            , "Email Address" => $email
         );

         if ($ss->addRow($row)) {
            // Display success page here

            echo "<h1>Thanks for registering!</h1>";

            // Send a confirmation email here if you want
         } else {
            // Failed to write to the spreadsheet
            echo "<h1>Sorry there was an error processing your request.</h1>";
         }
      }
   }
?>