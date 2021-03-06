﻿/*----------------------------------------------------------------------------->
<!--- Component :  Coldbox.cfm --->
<!--- Author 	 :	Ankita Rath --->
<!--- Date     :	September 11, 2018 --->
<!--- Description : coldbox application configuration component --->
<!-----------------------------------------------------------------------------*/
component{

	// Configure ColdBox Application
	function configure(){

		// coldbox directives
		coldbox = {
			//Application Setup
			appName = 				 "LetzChatColdbox",
			implicitViews = 		  false,
			defaultEvent  = 		 "main.index",
		    sessionEndHandler = 	 "main.onSessionEnd",
		    missingTemplateHandler = "main.missingTemplate",
			exceptionHandler	  =  "main.onException",
			onInvalidEvent  = 		 "main.pageNotFound",
			customErrorTemplate =    "/coldbox/system/includes/BugReport-public.cfm"
		};
		/*settings={
		ColdboxChatDb={name="ColdboxChatDb" , type="SQLServer"}
		};*/

		// environment settings, create a detectEnvironment() method to detect it yourself.
		// create a function with the name of the environment so it can be executed if that environment is detected
		// the value of the environment is a list of regex patterns to match the cgi.http_host.
		environments = {
			development = "localhost,127\.0\.0\.1,172.16.8.135"
		};

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