component{

	// Configure ColdBox Application
	function configure(){

		// coldbox directives
		coldbox = {
			//Application Setup
			appName = "LetzChatColdbox",
			implicitViews = false,
			//Development Settings
			// reinitPassword			= "",
			//handlersIndexAutoReload = true,

			//Implicit Events
			defaultEvent  = "main.index",
		    requestStartHandler     = "Main.onRequestStart",
		    requestEndHandler   = "Main.onRequestEnd",
		    applicationStartHandler = "Main.onAppInit",
		    applicationEndHandler = "Main.onAppEnd",
		    sessionStartHandler = "Main.onSessionStart",
		    sessionEndHandler = "Main.onSessionEnd",
		    missingTemplateHandler = "Main.onMissingTemplate"


			//Error/Exception Handling
			//invalidHTTPMethodHandler = "",
			//exceptionHandler		= "",
			//invalidEventHandler			= "",
			//customErrorTemplate		= "",
			//Application Aspects
			//handlerCaching 			= false,
			//eventCaching			= false
		};
		datasources={
			chatDb={name="coldboxChatDb" , dbType="SQLServer"}
		};
		//layoutSettings = {
//	    	defaultLayout = "Main.cfm"
//		};

		// environment settings, create a detectEnvironment() method to detect it yourself.
		// create a function with the name of the environment so it can be executed if that environment is detected
		// the value of the environment is a list of regex patterns to match the cgi.http_host.
		environments = {
			development = "localhost,127\.0\.0\.1,172.16.8.135"
		};

		// Module Directives
		/*modules = {
			// An array of modules names to load, empty means all of them
			include = [],
			// An array of modules names to NOT load, empty means none
			exclude = []
		};

		//Register interceptors as an array, we need order
		interceptors = [
		];*/

	}

	/** Development environment*/
	function development(){
		coldbox.handlerCaching=false;
		coldbox.eventCaching = false;
	    coldbox.debugPassword = "";
	    coldbox.reinitPassword = "";
	    coldbox.handlersIndexAutoReload = true;
		coldbox.customErrorTemplate = "/coldbox/system/includes/BugReport.cfm";
	}

}