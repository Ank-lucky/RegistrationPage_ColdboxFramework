<cfif structKeyExists(session,"loggedInUser") AND session.loggedInUser.isUserLoggedIn EQ true>
	<cfoutput>
	<html>
	<body style="background-image:url(./includes/images/background.png)">
		<div style="text-align:center">
		<h1 >Login Successfull!!</h1>
		<h3 > Hi #session.loggedInUser.userName# </h3>
		<button type="submit" name="logout"><a href="?event=LoginHandler.logout">Logout</a></button>
		</div>
	</body>
	</html>
	</cfoutput>
<cfelse>
	<cflocation url="?event=main.index" />
</cfif>


