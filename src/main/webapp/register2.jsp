<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
<!-- Javascript SDK-->
  <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script> 
  <script src="static/dist/js/amazon-cognito-auth.min.js"></script>
  <script src="https://sdk.amazonaws.com/js/aws-sdk-2.428.0.min.js"></script>
    <script src="static/dist/js/amazon-cognito-identity.min.js"></script>
   <script src="static/dist/js/config.js"></script>
  </head>


  <body>
<h1 class="h3 mb-3 font-weight-normal" id="titleheader">Register an Account</h1>

<input type="personalname" class="form-control" id="personalnameRegister" placeholder="Name" pattern=".*" required>
    <input type="username" class="form-control" id="username" placeholder="username" pattern=".*" required>
    <input type="text" class="form-control" id="address" name="address" placeholder="address" pattern=".*" required>
    
    <input type="email" class="form-control" id="emailInputRegister" placeholder="Email" pattern=".*" required>
   <input type="text" class="form-control" id="roles" name="roles" placeholder="Roles(trader,operator)" pattern=".*" required>

<input type="password" class="form-control" id="passwordInputRegister" placeholder="Password" pattern=".*" required>
    <input type="password" class="form-control" id="confirmationpassword" placeholder="Confirm Password" pattern=".*" required>
<button id="mainbutton" class="btn btn-lg btn-primary btn-block" type="button" onclick="registerButton()" >Register</button>

<script>

var username;
var password;
var personalname;
var poolData;
var emailId	;
var address;
 function registerButton() {

personalnamename =  document.getElementById("personalnameRegister").value;	
username = document.getElementById("username").value;
emailId = document.getElementById("emailInputRegister").value;
address= document.getElementById("address").value;
roles= document.getElementById("roles").value;
alert(personalnamename);
alert(username);
alert(emailId);
alert(roles);

if (document.getElementById("passwordInputRegister").value != document.getElementById("confirmationpassword").value) {
alert("Passwords Do Not Match!")
throw "Passwords Do Not Match!"
} else {
password =  document.getElementById("passwordInputRegister").value;	
}
alert(_config.cognito.userPoolId);
poolData = {
UserPoolId : _config.cognito.userPoolId, // Your user pool id here
ClientId : _config.cognito.clientId // Your client id here
};	
var userPool = new AmazonCognitoIdentity.CognitoUserPool(poolData);

var attributeList = [];

var dataEmail = {
Name : 'email', 
Value : emailId, //get from form field
};

var dataAddress = {
Name : 'address', 
Value : address, //get from form field
};

var dataPersonalName = {
Name : 'name', 
Value : personalname, //get from form field
};

var dataRoles = {
Name : 'custom:roles', 
Value : roles, //get from form field
};

var attributeAddress = new AmazonCognitoIdentity.CognitoUserAttribute(dataAddress);
var attributeEmail = new AmazonCognitoIdentity.CognitoUserAttribute(dataEmail);
var attributePersonalName = new AmazonCognitoIdentity.CognitoUserAttribute(dataPersonalName);
var attributeRoles = new AmazonCognitoIdentity.CognitoUserAttribute(dataRoles);

attributeList.push(attributeAddress);
attributeList.push(attributeEmail);
attributeList.push(attributePersonalName);
attributeList.push(attributeRoles);

userPool.signUp(username, password, attributeList, null, function(err, result){
if (err) {
alert(err.message || JSON.stringify(err));
return;
}
cognitoUser = result.user;
console.log('user name is ' + cognitoUser.getUsername());
//change elements of page
document.getElementById("titleheader").innerHTML = "Check your email for a verification link";
document.getElementById("fr1").submit();
});
 }

</script>
 
 </body>
  
</html>







