<?php
session_start();
error_reporting(E_ALL); // Enable error reporting for debugging (change to 0 in production)
include('includes/config.php');

// Initialize message variables
$successmsg = '';
$errormsg = '';

if (strlen($_SESSION['login']) == 0) { 
    header('location:index.php');
    exit();
} else {
    if (isset($_POST['submit'])) {
        // Ambil data dari form
        $uid = $_SESSION['id'];
        $category = mysqli_real_escape_string($con, $_POST['category']);
        $subcat = mysqli_real_escape_string($con, $_POST['subcategory']);
        $complaintype = mysqli_real_escape_string($con, $_POST['complaintype']);
        $state = mysqli_real_escape_string($con, $_POST['state']);
        $noc = mysqli_real_escape_string($con, $_POST['noc']);
        $complaintdetials = mysqli_real_escape_string($con, $_POST['complaindetails']);
        
        // Ambil status warranty (over atau under)
        $warranty_status = $_POST['complaintype']; // Match with form field name

        // Ambil nama fail
        $warrantyfile = !empty($_FILES["warrantyfile"]["name"]) ? $_FILES["warrantyfile"]["name"] : null;
        $receiptfile = !empty($_FILES["receiptfile"]["name"]) ? $_FILES["receiptfile"]["name"] : null;

        // Folder untuk memuat naik fail
        $warrantyfile_dir = "warrantydocs/";
        $receiptfile_dir = "receiptdocs/";

        // Pastikan folder wujud
        if (!file_exists($warrantyfile_dir)) {
            mkdir($warrantyfile_dir, 0755, true);
        }
        if (!file_exists($receiptfile_dir)) {
            mkdir($receiptfile_dir, 0755, true);
        }

        // Initialize flags
        $can_proceed = false;

        if ($warranty_status == "Over Warranty") {
            // Over Warranty: No file upload required
            $can_proceed = true;
            $warrantyfile = null; // Ensure no file is saved
            $receiptfile = null;  // Ensure no file is saved
        } else {
            // Under Warranty: Both files are required
            $warrantyfile_uploaded = false;
            $receiptfile_uploaded = false;

            if (!empty($warrantyfile) && $_FILES["warrantyfile"]["error"] == 0) {
                $warrantyfile_uploaded = move_uploaded_file($_FILES["warrantyfile"]["tmp_name"], $warrantyfile_dir . basename($warrantyfile));
            }
            if (!empty($receiptfile) && $_FILES["receiptfile"]["error"] == 0) {
                $receiptfile_uploaded = move_uploaded_file($_FILES["receiptfile"]["tmp_name"], $receiptfile_dir . basename($receiptfile));
            }

            if ($warrantyfile_uploaded && $receiptfile_uploaded) {
                $can_proceed = true;
            } else {
                $errormsg = "❌ Sila upload bukti receipt pembelian dan warranty untuk Under Warranty.";
            }
        }

        // Proses simpan aduan jika boleh proceed
        if ($can_proceed) {
            // Simpan ke dalam database
            $query = mysqli_query($con, "INSERT INTO tblcomplaints (userId, category, subcategory, complaintType, state, noc, complaintDetails, warrantyFile, receiptFile) 
                                        VALUES ('$uid', '$category', '$subcat', '$complaintype', '$state', '$noc', '$complaintdetials', " . ($warrantyfile ? "'$warrantyfile'" : "NULL") . ", " . ($receiptfile ? "'$receiptfile'" : "NULL") . ")");

            if ($query) {
                // Dapatkan nombor aduan terakhir
                $sql = mysqli_query($con, "SELECT complaintNumber FROM tblcomplaints ORDER BY complaintNumber DESC LIMIT 1");
                $row = mysqli_fetch_array($sql);
                $complainno = $row['complaintNumber'];

                // Set success message
                $successmsg = "✅ Your complaint has been successfully filled and your complaint number is: " . $complainno;
            } else {
                $errormsg = "❌ Ralat semasa menyimpan aduan ke dalam database.";
            }
        } else if ($warranty_status != "Over Warranty") {
            // Error already set above for Under Warranty
        } else {
            $errormsg = "❌ Ralat tidak dijangka. Sila cuba lagi.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>PTA | Customer Report Form</title>

    <link rel="icon" href="logopta.png" type="image/png">

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    <script>
function getCat(val) {
  //alert('val');

  $.ajax({
  type: "POST",
  url: "getsubcat.php",
  data:'catid='+val,
  success: function(data){
    $("#subcategory").html(data);
    
  }
  });
  }
  </script>
  
  </head>

  <body>

  <section id="container" >
     <?php include("includes/header.php");?>
      <?php include("includes/sidebar.php");?>
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> Customer Report Form</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	

                      <?php if($successmsg)
                      {?>
                      <div class="alert alert-success alert-dismissable">
                       <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                      <b>Well done!</b> <?php echo htmlentities($successmsg);?></div>
                      <?php }?>

   <?php if($errormsg)
                      {?>
                      <div class="alert alert-danger alert-dismissable">
 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                      <b>Oh snap!</b> </b> <?php echo htmlentities($errormsg);?></div>
                      <?php }?>

<form class="form-horizontal style-form" method="post" name="complaint" enctype="multipart/form-data">

<div class="form-group">
    <label class="col-sm-2 col-sm-2 control-label">Category</label>
    <div class="col-sm-4">
        <select name="category" id="category" class="form-control" onChange="getCat(this.value);" required="">
            <option value="">Select Category</option>
            <?php 
            $sql = mysqli_query($con, "SELECT id, categoryName FROM category");
            while ($rw = mysqli_fetch_array($sql)) {
            ?>
                <option value="<?php echo htmlentities($rw['id']);?>"><?php echo htmlentities($rw['categoryName']);?></option>
            <?php } ?>
        </select>
    </div>
    <label class="col-sm-2 col-sm-2 control-label">Sub Category</label>
    <div class="col-sm-4">
        <select name="subcategory" id="subcategory" class="form-control">
            <option value="">Select Subcategory</option>
        </select>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-2 col-sm-2 control-label">Brand</label>
    <div class="col-sm-4">
        <input type="text" name="noc" required="required" value="" class="form-control">
    </div>
    <label class="col-sm-2 col-sm-2 control-label">Purchase</label>
    <div class="col-sm-4">
        <select name="state" required="required" class="form-control">
            <option value="">Select State</option>
            <?php 
            $sql = mysqli_query($con, "SELECT stateName FROM state");
            while ($rw = mysqli_fetch_array($sql)) {
            ?>
                <option value="<?php echo htmlentities($rw['stateName']);?>"><?php echo htmlentities($rw['stateName']);?></option>
            <?php } ?>
        </select>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-2 col-sm-2 control-label">Damage (max 2000 words)</label>
    <div class="col-sm-6">
        <textarea name="complaindetails" required="required" cols="10" rows="10" class="form-control" maxlength="2000"></textarea>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-2 col-sm-2 control-label">Warranty Type</label>
    <div class="col-sm-4">
        <select name="complaintype" class="form-control" id="complaintype" required="">
            <option value="Under Warranty">Under Warranty (Need upload warranty and receipt)</option>
            <option value="Over Warranty">Over Warranty (No Need Upload Receipt)</option>
        </select>
    </div>
</div>

<div class="form-group" id="warrantyfile-container">
    <label class="col-sm-2 col-sm-2 control-label">Warranty</label>
    <div class="col-sm-6">
        <input type="file" name="warrantyfile" class="form-control" id="warrantyfile" required="">
    </div>
</div>

<div class="form-group" id="receiptfile-container">
    <label class="col-sm-2 col-sm-2 control-label">Receipt</label>
    <div class="col-sm-6">
        <input type="file" name="receiptfile" class="form-control" id="receiptfile" required="">
    </div>
</div>

<div class="form-group">
    <div class="col-sm-10" style="padding-left:25%">
        <button type="submit" name="submit" class="btn btn-primary">Submit</button>
    </div>
</div>

</form>
 	
          	
		</section>
      </section>
    <?php include("includes/footer.php");?>
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <!--script for this page-->
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>

	<!--custom switch-->
	<script src="assets/js/bootstrap-switch.js"></script>
	
	<!--custom tagsinput-->
	<script src="assets/js/jquery.tagsinput.js"></script>
	
	<!--custom checkbox & radio-->
	
	<script type="text/javascript" src="assets/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap-daterangepicker/daterangepicker.js"></script>
	
	<script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	
	
	<script src="assets/js/form-component.js"></script>    
    
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });



      // Get elements
    const complaintype = document.getElementById('complaintype');
    const warrantyfileContainer = document.getElementById('warrantyfile-container');
    const receiptfileContainer = document.getElementById('receiptfile-container');
    const warrantyfileInput = document.getElementById('warrantyfile');
    const receiptfileInput = document.getElementById('receiptfile');

    // Function to toggle file upload requirements
    function toggleFileRequirements() {
        if (complaintype.value === "Under Warranty") {
            // Make files required for Under Warranty
            warrantyfileInput.setAttribute('required', 'required');
            receiptfileInput.setAttribute('required', 'required');
            warrantyfileContainer.style.display = 'block';
            receiptfileContainer.style.display = 'block';
        } else {
            // Make files optional for Over Warranty
            warrantyfileInput.removeAttribute('required');
            receiptfileInput.removeAttribute('required');
            warrantyfileContainer.style.display = 'none';
            receiptfileContainer.style.display = 'none';
        }
    }

    // Initial toggle based on the default selection
    toggleFileRequirements();

    // Listen for changes to complaint type selection
    complaintype.addEventListener('change', toggleFileRequirements);

  </script>

  </body>
</html>
