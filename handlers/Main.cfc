/*----------------------------------------------------------------------------->
<!--- Component : LoginHandler.cfc --->
<!--- Author 	 :	Ankita Rath --->
<!--- Date     :	September 11, 2018 --->
<!--- Description : Handler for login and logout --->
<!-----------------------------------------------------------------------------*/

/**
 *@hint "component handler to handle all errors and other message events"
 **/
component displayname="mainHandlerComponent" extends="coldbox.system.EventHandler"{


	public void function index( event, rc, prc )
	description="Default Action main/index page" hint="request to index page"
	{
		event.setView("main/index");
	}

	public void function loginUnsuccessfull(event,rc,prc,boolean login=false,array validateLogin=[])
	description="called when login is unsuccessfull and renders error msg in index page"
	 hint="loginUnsuccessfull event"
	{
		rc.login=login;
		rc.validateLogin=validateLogin;
		event.setView("main/index");
	}

	public void function loggedOut(event,rc,prc,logout)
	description="called when logged out and renders respective msg in index page"
	hint="logout event"
	{
		rc.logout=logout;
		event.setView("main/index");
	}

	public void function signUpUnsuccessfull(event,rc,prc,boolean signUp=false,array validate=[])
	description="called when signUp is unsuccessfull and renders error msg in index page"
	hint="Unsuccessfull SignUp event"
	{
		rc.signUp=signUp;
		rc.validate=validate;
		event.setView("main/index");
	}


	public void function onSessionEnd( event, rc, prc )
	description="triggered when session ends" hint="onSessionEnd"
	{
		var sessionScope = event.getValue("sessionReference");
		var applicationScope = event.getValue("applicationReference");
	}

	public void function onException( event, rc, prc )
	description="triggered when there is a global exception in the application"
	hint="global exception handler"
	{
		writeLog(type="Error", file="my_colbox_application", text="Exception: <cfoutput>Msg:#prc.exception.getMessage()#</cfoutput>");
		include "views/_templates/generic_error.cfm";

	}

	public void function pageNotFound(event,rc,prc)
	description="triggered when there is a pagenot found exception in the application"
	hint="global invalid event handler"
	{
	    writeLog(type="Error", file="my_colbox_application" , text="Invalid page detected: <cfoutput>Msg:#prc.invalidEvent# event wasn't found!</cfoutput>" );
	    event.renderData( data="<h1>Sorry, the page you requested was Not Found!</h1>", statusCode=404 );
    }

	public void function missingTemplate( event, rc, prc )
	description="triggered when included template is missing"
	hint= "global missing Template handler"
	{
		writeLog(type="Error", file="my_colbox_application", text="Missing template:<cfoutput>#rc.missingTemplate#</cfoutput> " );
	    event.renderData( data="<h1>Sorry, the page you requested was not Found!!</h1>", statusCode=404 );

	}


}