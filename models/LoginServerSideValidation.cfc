/*----------------------------------------------------------------------------->
<!--- Component :  LoginServerSideValidation.cfc --->
<!--- Author 	 :	Ankita Rath --->
<!--- Date     :	September 11, 2018 --->
<!--- Description : Component for server side validation for login--->
<!-----------------------------------------------------------------------------*/

/**
*@hint "server side validation for login"
*/
component displayname="loginValidation" accessors="true"{

	public array function validate(string emailOrUserName,string password)
	description="function for server side validation for logging in" hint="validate login"
	{
		var errorMsg=arrayNew(1);
		if(emailOrUserName == ''
			|| !(refind("[\w.]+@+[a-z]+\.+[com|net|in]",emailOrUserName)||refind("^[A-Za-z]*$",emailOrUserName))
		    || len(emailOrUserName) < 3 || len(emailOrUserName) >30)
		  {
				arrayAppend(errorMsg,"You must provide a valid Email/Username to login");
	      }

		if(password == ''
		|| !refind("^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*])[A-Za-z\d$@$!%*]{8,}$",password)){
			arrayAppend(errorMsg,"You must provide a valid password to login");
		}

		return errorMsg;

	}


}