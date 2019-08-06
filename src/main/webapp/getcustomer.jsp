
<%@page
	import="java.util.*,java.math.*,com.crm.vo.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Customer Detail</title>
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
	<%
	
		CustomerDetail custDetail= (CustomerDetail)request.getAttribute("custDetail");
	%>
</head>
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<a><b>CUSTOMER DETAIL</b></a>
		</div>
		
		<form action="CustomerManagement" method="post">
			<div class="register-box-body">
				<p class="login-box-msg">Personal Details</p>


				<input type="hidden" class="form-control" name="customerNumber"
					value="<%=custDetail.getCustomerNumber()%>">

				 <label>Customer Number:  <%=custDetail.getCustomerNumber() %></label>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="firstName"
						placeholder="First Name"  value="<%=custDetail.getFirstName() %>" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="middleName"
						placeholder="Middle Name"  value="<%=custDetail.getMiddleName() %>" > <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback" required>
					<input type="text" class="form-control" name="lastName"
						placeholder="Last Name" value="<%=custDetail.getLastName() %>"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>

				</div>

				<div class="input-group date">
					<div class="input-group-addon">
						<i class="fa fa-calendar"></i>
					</div>
					<input type="text" class="form-control " name="dateOfBirth"
						id="datepicker" placeholder="Date Of Birth (MM/DD/YYYY)" value="<%=custDetail.getDateOfBirth()%>" required>
					<span class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<br />


				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="mobileNumber"
						placeholder="Mobile Number (+6586618144)" value="<%=custDetail.getMobileNumber() %>" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>


				<div class="form-group has-feedback">
					<label>Gender (<%=custDetail.getGender() %>)</label>
					<div class="input-group pull-right">
						<select name="gender" >
							<option value="M">Male</option>
							<option value="F">Female</option>
						</select>
					</div>
				</div>

				<div class="form-group has-feedback">
					<label>Country Of Birth (<%=custDetail.getDateOfBirth() %>)</label>
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
					<label>Country Of Residence  (<%=custDetail.getCountryOfResidence() %>)</label>
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
					<label>Customer Segment (<%=custDetail.getCustomerSegmant() %>)</label>
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
						placeholder="Address Line 1" value="<%=custDetail.getAddresses().get(0).getAddrLine1() %>" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="addrLine2Residence"
						placeholder="Address Line 2" value="<%=custDetail.getAddresses().get(0).getAddrLine2() %>" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="addrLine3Residence"
						placeholder="Address Line 3"  value="<%=custDetail.getAddresses().get(0).getAddrLine3() %>"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>

				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="addrLine4Residence"
						placeholder="Address Line 4" value="<%=custDetail.getAddresses().get(0).getAddrLine4() %>"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>

				</div>

				<div class="form-group has-feedback">
					<label>Country Code (<%=custDetail.getAddresses().get(0).getCountryCode() %>) </label>
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
						placeholder="ZIP" value="<%=custDetail.getAddresses().get(0).getZip() %>" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>


				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="stateResidence"
						placeholder="State" value="<%=custDetail.getAddresses().get(0).getState() %>"  required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>



				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="cityResidence"
						placeholder="City" value="<%=custDetail.getAddresses().get(0).getCity() %>" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>


			</div>


			<div class="register-box-body">
				<p class="login-box-msg">Office Address</p>



				<input type="hidden" class="form-control" name="typeOffice"
					value="office">


				
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="addrLine1Office"
						placeholder="Address Line 1" value="<%=custDetail.getAddresses().get(1).getAddrLine1() %>" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="addrLine2Office"
						placeholder="Address Line 2" value="<%=custDetail.getAddresses().get(1).getAddrLine2() %>" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="addrLine3Office"
						placeholder="Address Line 3"  value="<%=custDetail.getAddresses().get(1).getAddrLine3() %>"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>

				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="addrLine4Office"
						placeholder="Address Line 4" value="<%=custDetail.getAddresses().get(1).getAddrLine4() %>"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>

				</div>

				<div class="form-group has-feedback">
					<label>Country Code (<%=custDetail.getAddresses().get(1).getCountryCode() %>) </label>
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
						placeholder="ZIP" value="<%=custDetail.getAddresses().get(1).getZip() %>" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>


				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="stateOffice"
						placeholder="State" value="<%=custDetail.getAddresses().get(1).getState() %>"  required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>



				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="cityOffice"
						placeholder="City" value="<%=custDetail.getAddresses().get(1).getCity() %>" required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>

				<div class="row">
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="submit" value="put" name="action"
							class="btn btn-primary btn-block btn-flat" onclick="close()">SAVE</button>
					</div>
					
					<div class="col-xs-4" class="pull-right">
						<button type="submit" value="" name="action"
							class="btn btn-primary btn-block btn-flat" onclick="close()">CLOSE</button>
					</div></span>
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
