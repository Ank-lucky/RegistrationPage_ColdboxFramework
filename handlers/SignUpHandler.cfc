
component{
	property name="signUpServiceObj" inject="signUpService";

	/* signUp*/
	function signUp( event, rc, prc ){
		signUpSuccess=signUpServiceObj.signUpUserAndStoreDetails(rc);
		if(signUpSuccess == true){
			event.setView( "SignUpHandler/signUp" );
		}
		else{
			runEvent( event= 'main.signUpUnsuccessfull', eventArguments= { signUp=false });
		}
	}

}
