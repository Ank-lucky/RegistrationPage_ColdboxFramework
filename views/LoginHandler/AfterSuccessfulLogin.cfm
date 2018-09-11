<!----------------------------------------------------------------------------->
<!--- Template :  AfterSuccessfulLogin.cfm --->
<!--- Author 	 :	Ankita Rath --->
<!--- Date     :	September 11, 2018 --->
<!--- Description : After Successfull login this page is redirected --->
<!----------------------------------------------------------------------------->

<html>
	<head>
		<title>Login Successfull</title>
		<link rel='stylesheet' href='includes/css/successPageStyle.css' type='text/css'>
	</head>
	<body>
		<div class="mainContainer" >
		<h1 >Login Successfull!!</h1>
		<h3 > Hi <cfoutput>#session.loggedInUser.userName#</cfoutput></h3>
		<button type="submit" name="logout"><a href="index.cfm/?event=LoginHandler.logout">Logout</a></button>
		</div>
	</body>
</html>




