<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Admin | Registration</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="static/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="static/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="static/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="static/dist/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="static/plugins/iCheck/square/blue.css">
    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="static/dist/js/amazon-cognito-auth.min.js"></script>
    <script src="https://sdk.amazonaws.com/js/aws-sdk-2.428.0.min.js"></script>
    <script src="static/dist/js/amazon-cognito-identity.min.js"></script>
    <script src="static/dist/js/config.js"></script>
    <!-- optional: only if you use other AWS services -->

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
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="login.jsp"><b>Admin</b>Registration</a>
    </div>


    <form id="fr1" action="CustomerManagement" method="post">

        <div class="form-group has-feedback">
            <input type="text" class="form-control" id="personalnameRegister" name="personalnameRegister"
                   placeholder="NAME" pattern=".*" required>
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
        </div>

        <div class="form-group has-feedback">
            <input type="text" class="form-control" id="username" name="username" placeholder="USER NAME" pattern=".*"
                   required>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>

        <div class="form-group has-feedback">
            <input type="text" class="form-control" id="fanilyName" name="fanilyName" placeholder="Family Name" pattern=".*"
                   required>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>

        <div class="form-group has-feedback">
            <input type="text" class="form-control" id="emailInputRegister" name="emailInputRegister"
                   placeholder="Email" pattern=".*" required>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
            <input type="text" class="form-control" id="roles" name="roles" placeholder="trader,operator" pattern=".*"
                   required>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>

        <div class="form-group has-feedback">
            <input type="password" class="form-control" id="passwordInputRegister" name="passwordInputRegister"
                   placeholder="PASSWORD" pattern=".*" required>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>

        <div class="form-group has-feedback">
            <input type="password" class="form-control" id="confirmationpassword" name="confirmationpassword"
                   placeholder="CONFIRM PASSWORD" pattern=".*" required>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>


    </form>
    <button onclick="registerButton()" class="btn btn-primary btn-block btn-flat">Register</button>

</div>
<script>

    var username;
    var password;
    var personalname;
    var poolData;
    var emailId;
    var fanilyName;

    function registerButton() {

        personalnamename = document.getElementById("personalnameRegister").value;
        username = document.getElementById("username").value;
        emailId = document.getElementById("emailInputRegister").value;
        fanilyName = document.getElementById("fanilyName").value;
        roles = document.getElementById("roles").value;
       // alert(personalnamename);
       // alert(username);
       // alert(emailId);
      // alert(roles);

        if (document.getElementById("passwordInputRegister").value != document.getElementById("confirmationpassword").value) {
            alert("Passwords Do Not Match!");
            throw "Passwords Do Not Match!"
        } else {
            password = document.getElementById("passwordInputRegister").value;
        }
        
       // alert(_config.cognito.userPoolId);
        poolData = {
            UserPoolId: _config.cognito.userPoolId, // Your user pool id here
            ClientId: _config.cognito.clientId // Your client id here
        };
        var userPool = new AmazonCognitoIdentity.CognitoUserPool(poolData);

        var attributeList = [];

        var dataEmail = {
            Name: 'email',
            Value: emailId, //get from form field
        };

        var dataAddress = {
            Name: 'family_name',
            Value: fanilyName, //get from form field
        };

        var dataPersonalName = {
            Name: 'name',
            Value: personalname, //get from form field
        };

        var dataRoles = {
            Name: 'profile',
            Value: roles, //get from form field
        };

        var attributeFamiliNamw = new AmazonCognitoIdentity.CognitoUserAttribute(dataAddress);
        var attributeEmail = new AmazonCognitoIdentity.CognitoUserAttribute(dataEmail);
        var attributePersonalName = new AmazonCognitoIdentity.CognitoUserAttribute(dataPersonalName);
        var attributeRoles = new AmazonCognitoIdentity.CognitoUserAttribute(dataRoles);

        attributeList.push(attributeFamiliNamw);
        attributeList.push(attributeEmail);
        attributeList.push(attributePersonalName);
        attributeList.push(attributeRoles);

        userPool.signUp(username, password, attributeList, null, function (err, result) {
          
           
            document.getElementById("fr1").submit();
        });
    }

</script>

</body>

</html>