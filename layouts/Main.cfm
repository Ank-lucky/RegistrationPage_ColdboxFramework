<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>LetzChat</title>
	<!---Base URL --->
	<base href="#event.getHTMLBaseURL()#" />
</head>
<body>
 	<!---Container And Views --->
	<div class="container">#renderView()#</div>

 </body>
</html>
</cfoutput>
