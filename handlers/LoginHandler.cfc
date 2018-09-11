/*----------------------------------------------------------------------------->
<!--- Component : LoginHandler.cfc --->
<!--- Author 	 :	Ankita Rath --->
<!--- Date     :	September 11, 2018 --->
<!--- Description : Handler for login and logout --->
<!-----------------------------------------------------------------------------*/

/**
 * @hint "component for login handler"
 **/
component displayname="loginHandler"{

	property name="loginServiceObj" inject="loginService";
	property name="validationServiceObj" inject="loginServerSideValidation";

	public void function login( event, rc, prc )
	description="function to login user" hint="login"{
		var loginSuccess=false;
		var validationMsg=arrayNew(1);

		validationMsg= validationServiceObj.validate(rc.EmailOrUserName,rc.Password);

		if(arrayLen(validationMsg)){
			runEvent( event= 'main.loginUnsuccessfull', eventArguments= { validateLogin=validationMsg });
			session.loggedInUser.isUserLoggedIn=false;
		}
		else{
				loginSuccess=loginServiceObj.loginUser(rc.EmailOrUserName,rc.Password);

				if(loginSuccess){
					event.setView( "LoginHandler/AfterSuccessfulLogin").noLayout();
				}
				else{
					runEvent( event= 'main.loginUnsuccessfull', eventArguments= { login=false });
				}
			}

	}

	public void function logout(event,rc,prc)
	description="function to logout user" hint="logout"
	{
		var logoutSuccess=false;
		logoutSuccess=loginServiceObj.logoutUser();
		runEvent( event= 'main.loggedOut', eventArguments= { logout=logoutSuccess });
	}


	function postlogin( event, rc, prc, action, eventArguments )
	description="implicit function which executes after the login function is
				 executed to check if the loggedInUser is existing or not " hint="check loggedInuser Existance"
	{
			if(!session.loggedInUser.isUserLoggedIn && prc.currentView == "LoginHandler/AfterSuccessfulLogin" ){
				runEvent('main.loginUnsuccessfull');
			}
	}

}
