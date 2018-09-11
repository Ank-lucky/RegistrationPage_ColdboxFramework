<!-----------------------------------------------------------------------
<!--- Component :  Wirebox.cfc --->
<!--- Author 	 :	Ankita Rath --->
<!--- Date     :	September 11, 2018 --->
<!--- Description :WireBox Configuration Binder --->
----------------------------------------------------------------------->
<cfcomponent output="false" hint="The default WireBox Injector configuration object" extends="coldbox.system.ioc.config.Binder">
<cfscript>

	/**
	* Configure WireBox, that's it!
	*/
	function configure(){

		// The WireBox configuration structure DSL
		wireBox = {
			// Scope registration, automatically register a wirebox injector instance on any CF scope
			// By default it registeres itself on application scope
			scopeRegistration = {
				enabled = true,
				scope   = "application", // server, cluster, session, application
				key		= "wireBox"
			},

			// DSL Namespace registrations
			customDSL = {
				// namespace = "mapping name"
			},

			// Custom Storage Scopes
			customScopes = {
				// annotationName = "mapping name"
			},

			// Package scan locations
			scanLocations = [],

			// Stop Recursions
			stopRecursions = [],

			// Parent Injector to assign to the configured injector, this must be an object reference
			parentInjector = "",

			// Register all event listeners here, they are created in the specified order
			listeners = [
				// { class="", name="", properties={} }
			]
		};

		// Map Bindings below
		map("loginService").to("models.Login").asSingleton().noInit();
		map("signUpService").to("models.SignUp").asSingleton().noInit();
		map("lockSimultaneousUserLoginService").to("models.LockSimultaneousUserLogin").asSingleton().noInit();
		map("loginServerSideValidation").to("models.LoginServerSideValidation").asSingleton().noInit();
		map("signUpValidationService").to("models.SignUpServerSideValidation").asSingleton().noInit();
	}
</cfscript>
</cfcomponent>