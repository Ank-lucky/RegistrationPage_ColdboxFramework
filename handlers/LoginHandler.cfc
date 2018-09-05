component{
	property name="loginServiceObj" inject="loginService";

	/*index to login user*/
	public void function login( event, rc, prc ){
		var loginSuccess=false;

		if(rc.EmailOrUserName == '' || rc.Password == ''){
			runEvent( event= 'main.loginUnsuccessfull', eventArguments= { login=false });
		}

		loginSuccess=loginServiceObj.loginUser(rc.EmailOrUserName,rc.Password);

		if(loginSuccess){
			event.setView( "LoginHandler/AfterSuccessfulLogin").noLayout();
		}
		else{
			 //event.setView("main/index"); // pass a message enter correct username or password
			runEvent( event= 'main.loginUnsuccessfull', eventArguments= { login=false });
		}
	}
	/*function to logout user*/
	public void function logout(event,rc,prc){
		var logoutSuccess=false;
		logoutSuccess=loginServiceObj.logoutUser();
		if(logoutSuccess){
			runEvent( event= 'main.loggedOut', eventArguments= { logout=true });
		}
		else{
			runEvent( event= 'main.loggedOut', eventArguments= { logout=false });
		}

	}

}
