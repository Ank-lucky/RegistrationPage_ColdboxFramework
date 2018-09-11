/*----------------------------------------------------------------------------->
<!--- Component : SignUpHandler.cfc --->
<!--- Author 	 :	Ankita Rath --->
<!--- Date     :	September 11, 2018 --->
<!--- Description : handler for SignUp--->
<!-----------------------------------------------------------------------------*/

/*
 * @hint "component handler for signUp"
 **/
component displayname="SignupHandlerComponent"{
	property name="signUpServiceObj" inject="signUpService";
	property name="signUpValidationServiceObj" inject="signUpValidationService";

	/* signUp*/
	public void function signUp( event, rc, prc )
	description="function for user signUp" hint="signup method"
	{
		var signUpSuccess= false;
		signUpValidateMsg=signUpValidationServiceObj.validateSignUp(rc);

		if(arrayLen(signUpValidateMsg)){
			runEvent( event = 'main.signUpUnsuccessfull',eventArguments= { validate=signUpValidateMsg });
		}
		else{
				signUpSuccess=signUpServiceObj.signUpUserAndStoreDetails(rc);
				if(signUpSuccess == true){
					event.setView( "SignUpHandler/AfterSuccessfulSignUp" );
				}
				else{
					runEvent( event= 'main.signUpUnsuccessfull', eventArguments= { signUp=false });
				}
			}
	}

}
