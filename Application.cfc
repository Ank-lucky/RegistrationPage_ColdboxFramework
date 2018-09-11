/*----------------------------------------------------------------------------->
<!--- Component :  Application.cfc --->
<!--- Author 	 :	Ankita Rath --->
<!--- Date     :	September 11, 2018 --->
<!--- Description : Application component--->
<!-----------------------------------------------------------------------------*/

component{
	// Application properties
	this.name = hash( getCurrentTemplatePath() );
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,30,0);
	this.dataSource="ColdboxChatDb";
	this.setClientCookies = true;

	this.mappings['/coldbox'] = getDirectoryFromPath( getCurrentTemplatePath() ) & "coldbox";
	// COLDBOX STATIC PROPERTY, DO NOT CHANGE UNLESS THIS IS NOT THE ROOT OF YOUR COLDBOX APP
	COLDBOX_APP_ROOT_PATH = getDirectoryFromPath( getCurrentTemplatePath() );
	// The web server mapping to this application. Used for remote purposes or static purposes
	COLDBOX_APP_MAPPING   = "";
	// COLDBOX PROPERTIES
	COLDBOX_CONFIG_FILE 	 = "";
	// COLDBOX APPLICATION KEY OVERRIDE
	COLDBOX_APP_KEY 		 = "";

	// application start
	public boolean function onApplicationStart(){
		application.cbBootstrap = new coldbox.system.Bootstrap( COLDBOX_CONFIG_FILE, COLDBOX_APP_ROOT_PATH, COLDBOX_APP_KEY, COLDBOX_APP_MAPPING );
		application.cbBootstrap.loadColdbox();
		return true;
	}

	// application end
	public boolean function onApplicationEnd( struct appScope ){
		arguments.appScope.cbBootstrap.onApplicationEnd( arguments.appScope );
	}

	// request start
	public boolean function onRequestStart( string targetPage ){

		application.cbBootstrap.onRequestStart( arguments.targetPage );
		return true;
	}
	public boolean function onRequestEnd( string targetPage ){
		return true;
	}

	public void function onSessionStart(){
		application.cbBootStrap.onSessionStart();


	}
	public void function onSessionEnd( struct sessionScope, struct appScope ){
		arguments.appScope.cbBootStrap.onSessionEnd( argumentCollection=arguments );
	}
	public boolean function onMissingTemplate( template ){
		return application.cbBootstrap.onMissingTemplate( argumentCollection=arguments );

	}
	public void function onError(any exception){
		writeLog(type="Error",file="onErrorApplication",text="ExceptionError Type:#arguments.exception.type# , Message:#arguments.exception.message#");
		include "views/_templates/generic_error.cfm";
	}



}