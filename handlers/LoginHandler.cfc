component{
	property name="loginServiceObj" inject="loginService";

	/*index to login user*/
	function index( event, rc, prc ){
		var baseUrl=event.getHTMLBaseURL();
		loginSuccess=loginServiceObj.loginUser(rc.EmailOrUserName,rc.Password);
		if(loginSuccess){
			event.setView( "LoginHandler/index").noLayout();
		}
		else{
			 //event.setView("main/index"); // pass a message enter correct username or password
			relocate(event="?main/index" , queryString="login=false", baseURL=baseUrl);
		}

	}
	/*function to logout user*/
	function logout(event,rc,prc){
		var baseUrl=event.getHTMLBaseURL();
		logoutSuccess=loginServiceObj.logoutUser();
		if(logoutSuccess){
			relocate(event="?main/index" , queryString="logout=true", baseURL=baseUrl);
		}
		else{
			relocate(event="?main/index" , queryString="logout=false", baseURL=baseUrl);
		}

	}
	/*onError*/
//	function onError( event, rc, prc, faultAction, exception, eventArguments ){
//		writeLog(type="Error", file="coldboxLoginHandler", text=" Exception=#exception# eventArguments=#eventArguments#");
//		event.setView("_templates/generic_error");
//	}



}
