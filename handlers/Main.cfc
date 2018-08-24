component extends="coldbox.system.EventHandler"{

	// Default Action
	function index( event, rc, prc ){
		event.setView("main/index");

	}

	function onSessionEnd( event, rc, prc ){
		var sessionScope = event.getValue("sessionReference");
		var applicationScope = event.getValue("applicationReference");
	}

	function onException( event, rc, prc ){
		var exception=prc.exception;
		writeLog(type="Error", file="coldboxGlobalOnExceptionHandler", text=" Exception:#exception#");
		flash.put("exceptionURL", event.getCurrentRoutedURL() );
		relocate(event="_templates.generic_error");

	}

	function onMissingTemplate( event, rc, prc ){
		//Grab missingTemplate From request collection, placed by ColdBox
		var missingTemplate = event.getValue("missingTemplate");
		  writeLog(type="Error", file="coldboxonMissingTemplate", text="Missing template #missingTemplate#" );
	      event.renderData( data="<h1>Sorry, the page you requested was Not Found!</h1>", statusCode=404 );
	      //event.setView( "_templates.404" ).setHTTPHeader( "404", "Page Not Found" );

	}
	function pageNotFound(event,rc,prc){

	    writeLog(type="Error", file="coldboxPageNotFoundHandler" , text="Invalid page detected" );
	    event.renderData( data="<h1>Sorry, the page you requested was Not Found!</h1>", statusCode=404 );
	   // event.setView( "_templates.404" ).setHTTPHeader( "404", "Page Not Found" );
}

}