<!------------------------------------------------------------------------------->
<!--- Template : Main.json --->
<!--- Author 	 :	Ankita Rath --->
<!--- Date     :	September 11, 2018 --->
<!--- Description : Main layout for rendering views--->
<!-------------------------------------------------------------------------------->

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
