<!----------------------------------------------------------------------------->
<!--- Template :  index.cfm --->
<!--- Author 	 :	Ankita Rath --->
<!--- Date     :	September 11, 2018 --->
<!--- Description : This is the registration and login page --->
<!----------------------------------------------------------------------------->

<!---check and display for error message--->
<cfif structKeyExists(rc,"login")>
	<cfif arrayLen("#rc.validateLogin#")>
		<cfloop from="1" to="#arrayLen(rc.validateLogin)#"	index="i">
			<body style="margin-top:4%;text-align:center;color:green">
			<cfoutput>#rc.validateLogin[i]#</cfoutput>
			<br>
			</body>
		</cfloop>
	</cfif>
</cfif>
<cfif structKeyExists(rc,"signUp")>
<cfif arrayLen("#rc.validate#")>
			<cfloop from="1" to="#arrayLen(rc.validate)#"	index="i">
				<body style="margin-bottom:4%;text-align:center;color:green">
				<cfoutput>#rc.validate[i]#</cfoutput>
				<br>
			</body>
			</cfloop>
	</cfif>
</cfif>

<!---template for index.cfm--->
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>
			Letz Chat
		</title>
		<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css'>
		<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Pacifico'>
		<link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
		<link rel='stylesheet' href='includes/css/loginAndSignUpStyle.css' type='text/css'>
		<script rel="text/javascript" src="includes/js/jquery.js"></script>
		<script rel="text/javascript" src="includes/js/fetchCountriesStates.js"></script>
		<script rel="text/javascript" src="includes/js/validate.js"></script>
	</head>
	<body class="login-body">
		<div class="row">

			<p id="message" style="text-align:center;color:green;margin:2% 30% 0% 30%">
			</p>
			<div class="input-cart col s12 m10 push-m1 z-depth-2 grey lighten-5">
				<!-- Login Form -->
	<div class="col s12 m5 login">
		<h4 class="center">
				Log in
		</h4>
		<br>
		<form action="?event=LoginHandler.login" method="POST" onsubmit="return validateLogin()" >
			<div class="row">
			<div class="input-field">
				<input type="text" id="login" name="EmailOrUserName"  class="validate" placeholder="Email/Username">
				<label for="user">
				<i class="material-icons">
					person
				</i>
				</label>
				<span id="showErrorLoginUserName" class="ErrorMsg">
						</span>
			 </div>
			 </div>
			 <div class="row">
			 <div class="input-field">
				<input type="password" id="passkey" name="Password"  class="validate"  placeholder="Password">
				<label for="pass">
				<i class="material-icons">
					  lock
				</i>
				</label>
				<span id="showErrorLoginPasskey" class="ErrorMsg">
						</span>
			  </div>
			  </div>
			  <div class="row">
			  <div class="switch col s6">
				 <label>
				 <a href="#">
					   Forgot Password
				 </a>
				 </label>
			  </div>
			  <div class="col s6">
				 <button type="submit" name="Login" class="btn waves-effect waves-light blue right" >
						Log in
				 </button>
			  </div>
			  </div>
		</form>
	</div>
				<!--- Signup form --->
	<div class="col s12 m7 signup">
		<div class="signupForm">
			<h4 class="center">
					Sign up
			</h4>
			<br>
		<form action="?event=SignUpHandler.signUp" name="signup" method="POST" onsubmit="return validate()" >
				<div class="row">
				<div class="input-field col s12 m6">
					<input type="text" id="firstName" name="FirstName" class="validate"  placeholder="Enter FirstName">
					<label for="name-picked">
						<i class="material-icons">
							person_add
						</i>
					</label>
						<span id="showErrorfName" class="ErrorMsg">
						</span>
				 </div>
				 <div class="input-field col s12 m6">
					<input type="text" id="middleName" name="MiddleName" class="validate" placeholder="Enter MiddleName">
						<span id="showErrorMidName" class="ErrorMsg">
						</span>
				 </div>
				 <div class="input-field col s12 m6">
					 <input type="text" id="lastName" name="LastName" class="validate"placeholder="Enter LastName">
						 <span id="showErrorlName" class="ErrorMsg">
						 </span>
				 </div>
				 </div>
				 <div class="row">
				 <div class="input-field col s12 m6">
						 <input type="text" id="userName" name="UserName" class="validate"  placeholder="Enter a username">
						 <label for="name-picked">
								<i class="material-icons">
									person_add
								</i>
						 </label>
						 <span id="showErrorUserName" class="ErrorMsg">
						 </span>
				 </div>
				 </div>
				 <div class="row">
				 <div class="input-field col s12 m6">
						 <input type="date" id="dob" name="DOB" class="validate">
						 <span id="showErrorDob" class="ErrorMsg">
						 </span>
				 </div>
				 </div>
				 <div class="row">
				 <div class="dropdown col s12 m6">
						  <select id="gender"name="Gender">
							<option>
								Select Gender
							</option>
							<option>
								Male
							</option>
							<option>
								Female
							</option>
						   </select>
						   <span id="showErrorGender" class="ErrorMsg">
						   </span>
				  </div>
				  </div>
				  <div class="row">
				  <div class=" col s12 m4">
							<select id="country" name="Country">
							</select>
							<span id="showErrorCountry" class="ErrorMsg">
							</span>
				  </div>
				  <div class=" col s12 m4">
							 <select id="state" name="State">
							 </select>
				  <span id="showErrorState" class="ErrorMsg">
				  </span>
				  </div>
				  <div class=" col s12 m4">
							 <select id="city" name= "City">
							 </select>
							 <span id="showErrorCity" class="ErrorMsg">
							 </span>
				  </div>
				  </div>
				  <div class="row">
				  <div class="input-field PhoneNo">
				  <div class="col s12">
							 <input type="text" id="phoneNo" name="PhoneNo" class="validate" placeholder="Enter your phone no.">
				  </div>
							 <span id="showErrorPhoneNo" class="ErrorMsg">
							 </span>
				  </div>
				  </div>
				  <div class="row">
				  <div class="input-field email">
				  <div class="col s12">
							 <input type="text" id="email" name="Email" class="validate" placeholder="Enter your email">
							 <label for="email">
							 <i class="material-icons">
									mail
							 </i>
							 </label>
							 <span id="showErrorEmail" class="ErrorMsg">
							 </span>
				  </div>
				  </div>
				  </div>
				  <div class="row">
				  <div class="input-field col s12 m6">
							 <input type="password" id="password" name="Password" class="validate" placeholder="Password">
							 <label for="pass-picked">
							 <i class="material-icons">
									lock
							 </i>
							 </label>
							 <span id="showErrorPassword" class="ErrorMsg">
							 </span>
				   </div>
				   <div class="input-field col s12 m6">
							 <input type="password" id="confrmPassword" name="ConfirmedPassword" class="validate" placeholder="Re-enter password">
							 <label for="pass-picked">
								<i class="material-icons">
									lock
								</i>
							 </label>
							 <span id="showErrorCnfPassword" class="ErrorMsg">
							 </span>
					</div>
					</div>
					<div class="row">

								<button type="submit" name="Register" class="btn blue right waves-effect waves-light" >
									Sign Up
								</button>
								<div class="goToLoginForm">
									<a class="goToLoginFormLink">LOGIN Here</a>
								</div>
					</div>

		 </form>
	</div>
					<div class="signup-toggle center">
						<h4 class="center">
							Have No Account ?

							<strong>Sign Up</strong>

						</h4>
					</div>

				</div>
				<div class="col s12">
					<br>
					<div class="legal center">
					</div>
					<div class="legal center">
						<div class="col s12 m7 right">
							<p class="grey-text policy center">
								By signing up, you agree on our
								<a href="#!">
									Privacy Policy
								</a>
								and
								<a href="#!">
									Terms of Use
								</a>
								including
								<a href="#!">
									Cookie Use
								</a>
								.
							</p>
						</div>
						<div class="col s12 m5">
							<p class="center grey-text" style="font-size: 14px;">
								Coding :
								<a href="#" class="main-title red-text" target="_blank">
									@nkita
								</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="fixed-action-btn toolbar">
			<a class="btn-floating btn-large amber black-text">
				Login
			</a>
			<ul>
				<li>
					<a class="indigo center" href="#!">
						Login with FB
					</a>
				</li>
				<li>
					<a class="blue center" href="#!">
						Login with Twitter
					</a>
				</li>
				<li>
					<a class="red center" href="#!">
						Login with Google +
					</a>
				</li>
			</ul>
		</div>
		<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
		<script src='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js'></script>
		<script rel="text/javascript" src="includes/js/toggleSignUp.js"></script>
</body>
</html>


<!---check and display for error message--->
<cfif structKeyExists(rc,"login")>
	<cfif rc.login EQ false>
			<script>
			<cfoutput>
			document.getElementById("message").innerHTML="Sorry,couldn't login because you have entered wrong username/password or someone in here is already logged in.";
			</cfoutput>
		</script>
	</cfif>
</cfif>
<cfif structKeyExists(rc,"signUp")>
	<cfif rc.signUp EQ "false">
			<script>
			<cfoutput>
			document.getElementById("message").innerHTML="Sorry,couldn't sign up.Please try again..";
			</cfoutput>
			</script>
	</cfif>
</cfif>
<cfif structKeyExists(rc,"logout")>
	<cfif rc.logout EQ "true">
			<script>
			<cfoutput>
			document.getElementById("message").innerHTML="Thanx for using Letz Chat!.";
			</cfoutput>
			</script>
	<cfelse>
		<script>
			<cfoutput>
			document.getElementById("message").innerHTML="Sorry, couldn't logout successfully..";
			</cfoutput>
		</script>
	</cfif>
</cfif>




