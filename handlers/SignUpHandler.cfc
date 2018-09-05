
component{
	property name="signUpServiceObj" inject="signUpService";

	/* signUp*/
	public void function signUp( event, rc, prc ){
		var signUpSuccess= false;
		var regexName = "/^[A-Za-z]*$/";
		var signUp=true;
		if(rc.FirstName == ''){
			signUp=false;
		}
		if(rc.LastName == ''){
			signUp=false;
		}
		if(rc.UserName == ''){
			signUp=false;
		}
		if(rc.DOB == ''){
			signup=false;
		}
		if(rc.Gender == ''){
			signup=false;
		}
		if(rc.PhoneNo == ''){
			signup=false;
		}
		if(rc.Email == ''){
			signup=false;
		}
		if(signup == false){
			runEvent( event= 'main.signUpUnsuccessfull', eventArguments= { signUp=false });
		}
		signUpSuccess=signUpServiceObj.signUpUserAndStoreDetails(rc);
		if(signUpSuccess == true){
			event.setView( "SignUpHandler/AfterSuccessfulSignUp" );
		}
		else{
			runEvent( event= 'main.signUpUnsuccessfull', eventArguments= { signUp=false });
		}
	}

}
