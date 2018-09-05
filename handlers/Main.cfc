component extends="coldbox.system.EventHandler"{

	/* Default Action main/index page*/
	public void function index( event, rc, prc ){
		event.setView("main/index");
	}

	/*loginUnsuccessfull event*/
	public void function loginUnsuccessfull(event,rc,prc,login=false){
		rc.login=login;
		event.setView("main/index");
	}

	/*logout event*/
	public void function loggedOut(event,rc,prc,logout){
		rc.logout=logout;
		event.setView("main/index");
	}

	/*Unsuccessfull SignUp event*/
	public void function signUpUnsuccessfull(event,rc,prc,signUp){
		rc.signUp=signUp;
		event.setView("main/index");
	}

	/*onSessionEnd*/
	public void function onSessionEnd( event, rc, prc ){
		var sessionScope = event.getValue("sessionReference");
		var applicationScope = event.getValue("applicationReference");
	}

	/*global exception handler*/
	public void function onException( event, rc, prc ){
		writeLog(type="Error", file="coldboxGlobalOnExceptionHandler", text="Exception: <cfoutput>Msg:#prc.exception.getMessage()#</cfoutput>");
		//flash.put("exceptionURL", event.getCurrentRoutedURL() );
		//relocate(event="_templates.generic_error");
		//event.renderData( data="<h1>Sorry, for an Error to occur.</h1>" );
	}

	/*global invalid event handler*/
	public void function pageNotFound(event,rc,prc){
	    writeLog(type="Error", file="coldboxPageNotFoundHandler" , text="Invalid page detected: <cfoutput>Msg:#prc.invalidEvent# event wasn't found!</cfoutput>" );
	    event.renderData( data="<h1>Sorry, the page you requested was Not Found!</h1>", statusCode=404 );
	    //event.setView( "_templates.404" ).setHTTPHeader( "404", "Page Not Found" );
    }

    /*global missing Template handler*/
	public void function missingTemplate( event, rc, prc ){
		writeLog(type="Error", file="coldboxOnMissingTemplate", text="Missing template:<cfoutput>#rc.missingTemplate#</cfoutput> " );
	    event.renderData( data="<h1>Sorry, the page you requested was not Found!!</h1>", statusCode=404 );
	    //event.setView( "_templates.404" ).setHTTPHeader( "404", "Page Not Found" );
	}


}