/**
* I am a new handler
*/
component{
	property name="signUpServiceObj" inject="signUpService";

	/* signUp*/
	function signUp( event, rc, prc ){
		signUpSuccess=signUpServiceObj.signUpUserAndStoreDetails(rc);
		if(signUpSuccess == true){
			event.setView( "SignUpHandler/signUp" );
		}
		else{
			relocate(event="?main/index" , queryString="signUp=false", baseURL=baseUrl);
		}
	}

}
