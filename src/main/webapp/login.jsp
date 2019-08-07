<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Customer | Management</title>
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
    <script src="https://sdk.amazonaws.com/js/aws-sdk-2.428.0.js"></script>
    <script src="static/dist/js/amazon-cognito-identity.js"></script>
    <script src="static/dist/js/config.js"></script>
    <!-- optional: only if you use other AWS services -->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif] This is the full stack hero Shashank Singh Solanki-->
     
    <style>
        .recaptcha {
            display: flex;
            justify-content: center;
        }
    </style>

    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <%
        String errorMessage = "";
        if (session != null) {
            errorMessage = (String) request.getAttribute("errorMessage");
        } else {
            session.setAttribute("errorMessage", "Login Failed session expired ");
            response.sendRedirect("login.jsp");
        }
    %>

</head>
<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <a href="login.jsp"><b>Customer</b>Management</a>
        </div>
        <!-- /.login-logo -->
        <div class="login-box-body">
            <%if (errorMessage != null && !errorMessage.equals("")) {%>
            <p class="login-box-msg"><font color=red><%=errorMessage %></font></p>
            <%} else {%>
            <p class="login-box-msg">Sign in to start your session</p>
            <%} %>
            <form id="fr1" action="Login" method="post">
                <div class="form-group has-feedback">
                    <input type="email" class="form-control" id="emailId" name="emailId" placeholder="Email">
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <button id="loginButton" type="button" class="btn btn-primary btn-block btn-flat">Sign In</button>
                <input type="hidden" class="form-control" id="token" name="token">
                <a href="#">I forgot my password</a><br>
              
            </form>
        </div>
        <!-- /.login-box-body -->
    </div>
    <!-- /.login-box -->

    <!-- jQuery 3 -->
    <script src="static/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="static/plugins/iCheck/icheck.min.js"></script>
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
        function signIn(e) {
            if(e) {
                e.preventDefault();
            }

            const authenticationData = {
                Username: document.getElementById("emailId").value,
                Password: document.getElementById("password").value,
            };

            const authenticationDetails = new AmazonCognitoIdentity.AuthenticationDetails(authenticationData);
            const poolData = {
                UserPoolId: _config.cognito.userPoolId, // Your user pool id here
                ClientId: _config.cognito.clientId, // Your client id here
            };

            const userPool = new AmazonCognitoIdentity.CognitoUserPool(poolData);
            const userData = {
                Username: document.getElementById("emailId").value,
                Pool: userPool,
            };

            const cognitoUser = new AmazonCognitoIdentity.CognitoUser(userData);
            cognitoUser.authenticateUser(authenticationDetails, {
                onSuccess: function (result) {
                    let idToken = result.idToken.jwtToken;
                    //alert(idToken);
                    document.getElementById("token").value = idToken;
                    document.getElementById("fr1").submit();
                },
                onFailure: function (err) {
                    alert(err.message || JSON.stringify(err));
                    grecaptcha.reset();
                },
            });
        }

        window.addEventListener('keyup', function (e) {
            if (e.isComposing || e.code === 'Enter' || e.code === 'NumpadEnter') {
                signIn();
            }
        }, false);

        const loginButton = document.getElementById('loginButton');
        loginButton.onclick = e => signIn(e);
    </script>
</body>
</html>