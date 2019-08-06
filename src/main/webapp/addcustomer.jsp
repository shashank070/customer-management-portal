<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Add New Customer</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="static/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="static/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="static/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="static/dist/css/AdminLTE.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="static/plugins/iCheck/square/blue.css">

<link rel="stylesheet"
	href="static/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<a><b>ADD CUSTOMER</b></a>
		</div>
		<form action="CustomerManagement" method="post">
			<div class="register-box-body">
				<p class="login-box-msg">Personal Details</p>


				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="customerNumber"
						placeholder="Customer ID" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="firstName"
						placeholder="First Name" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="middleName"
						placeholder="Middle Name"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback" required>
					<input type="text" class="form-control" name="lastName"
						placeholder="Last Name"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>

				</div>

				<div class="input-group date">
					<div class="input-group-addon">
						<i class="fa fa-calendar"></i>
					</div>
					<input type="text" class="form-control " name="dateOfBirth"
						id="datepicker" placeholder="Date Of Birth (MM/DD/YYYY)" required>
					<span class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<br />


				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="mobileNumber"
						placeholder="Mobile Number (+6586618144)" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>


				<div class="form-group has-feedback">
					<label>Gender </label>
					<div class="input-group pull-right">
						<select name="gender">
							<option value="M">Male</option>
							<option value="F">Female</option>
						</select>
					</div>
				</div>

				<div class="form-group has-feedback">
					<label>Country Of Birth </label>
					<div class="input-group pull-right">
						<select name="countryOfBirth">
							<option value="Singapore">Singapore</option>
							<option value="India">India</option>
							<option value="UK">UK</option>
							<option value="USA">USA</option>
							<option value="HongKong">HongKong</option>
						</select>
					</div>
				</div>

				<div class="form-group has-feedback">
					<label>Country Of Residence </label>
					<div class="input-group pull-right">
						<select name="countryOfResidence">
							<option value="Singapore">Singapore</option>
							<option value="India">India</option>
							<option value="UK">UK</option>
							<option value="USA">USA</option>
							<option value="HongKong">HongKong</option>
						</select>
					</div>
				</div>

				<div class="form-group has-feedback">
					<label>Customer Segment </label>
					<div class="input-group pull-right">
						<select name="customerSegment" pull-right>
							<option value="Institution">Institution</option>
							<option value="Retail">Retail</option>
						</select>
					</div>
				</div>




			</div>


			<div class="register-box-body">
				<p class="login-box-msg">Home Address</p>



				<input type="hidden" class="form-control" name="typeResidence"
					value="residence">


				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="addrLine1Residence"
						placeholder="Address Line 1" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="addrLine2Residence"
						placeholder="Address Line 2" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="addrLine3Residence"
						placeholder="Address Line 3"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>

				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="addrLine4Residence"
						placeholder="Address Line 4"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>

				</div>

				<div class="form-group has-feedback">
					<label>Country Code </label>
					<div class="input-group pull-right">
						<select name="countryCodeResidence">
							<option value="SG">SG</option>
							<option value="IN">IN</option>
							<option value="UK">UK</option>
							<option value="USA">USA</option>
							<option value="HK">HK</option>
						</select>
					</div>
				</div>







				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="zipResidence"
						placeholder="ZIP" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>


				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="stateResidence"
						placeholder="State" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>



				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="cityResidence"
						placeholder="City" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>


			</div>


			<div class="register-box-body">
				<p class="login-box-msg">Office Address</p>



				<input type="hidden" class="form-control" name="typeOffice"
					value="office">


				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="addrLine1Office"
						placeholder="Address Line 1" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="addrLine2Office"
						placeholder="Address Line 2" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="addrLine3Office"
						placeholder="Address Line 3"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>

				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="addrLine4Office"
						placeholder="Address Line 4"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>

				</div>

				<div class="form-group has-feedback">
					<label>Country Code </label>
					<div class="input-group pull-right">
						<select name="countryCodeOffice">
							<option value="SG">SG</option>
							<option value="IN">IN</option>
							<option value="UK">UK</option>
							<option value="USA">USA</option>
							<option value="HK">HK</option>
						</select>
					</div>
				</div>







				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="zipOffice"
						placeholder="ZIP" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>


				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="stateOffice"
						placeholder="State" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>



				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="cityOffice"
						placeholder="City" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>

				<div class="row">
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="submit" value="post" name="action"
							class="btn btn-primary btn-block btn-flat" onclick="close()">ADD</button>
					</div>
					<!-- /.col -->
				</div>
			</div>



		</form>

	</div>

	<!-- /.form-box -->
	</div>
	<!-- /.register-box -->

	<!-- jQuery 3 -->
	<script src="static/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="static/plugins/iCheck/icheck.min.js"></script>

	<script src="static/plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="static/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="static/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script
		src="static/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
</script>

	<script>
  $(function () {
    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    })
  });
</script>
	<script type="text/javascript">
    window.onunload = refreshParent;
    function refreshParent() {
        window.opener.location.reload();
        window.close();
    }
</script>
</body>
</html>
