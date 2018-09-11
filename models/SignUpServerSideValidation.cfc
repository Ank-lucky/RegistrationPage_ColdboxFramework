/*----------------------------------------------------------------------------->
<!--- Component : SignUpServerSideValidation.cfc --->
<!--- Author 	 :	Ankita Rath --->
<!--- Date     :	September 11, 2018 --->
<!--- Description : Component for server side validation for Sign Up--->
<!-----------------------------------------------------------------------------*/

/**
*@hint "Component for server side validation for sign Up"
*/
component displayname="signUpServerValidationComponent" accessors="true"{

	public array function validateSignUp(struct formDetails)
	description="function to validate signUp form" hint="signUpServer validation"
	{
		var errorMsg=arrayNew(1);
		if(arguments.formDetails.FirstName == '' || !refind("^[A-Za-z]*$",arguments.formDetails.FirstName)
			|| len(arguments.formDetails.FirstName)<3 || len(arguments.formDetails.FirstName)>25)
		{
			arrayAppend(errorMsg,"You must provide a valid FirstName containing alphabates more than 3 and less than 25");
			return errorMsg;
		}
		if(arguments.formDetails.LastName == '' || !refind("^[A-Za-z]*$",arguments.formDetails.LastName)
		    || len(arguments.formDetails.LastName)<3 || len(arguments.formDetails.LastName)>25 )
		{
			arrayAppend(errorMsg,"You must provide a valid LastName containing alphabates more than 3 and less than 25 ");
			return errorMsg;
		}
		if(arguments.formDetails.UserName == '' || !refind("^[A-Za-z]*$",arguments.formDetails.UserName)
			|| len(arguments.formDetails.LastName)<3 || len(arguments.formDetails.LastName)>20)
		{
			arrayAppend(errorMsg,"You must provide a valid UserName containing alphabets more than 3 and less than 20");
			return errorMsg;
		}
		if(arguments.formDetails.DOB == '' || arguments.formDetails.DOB > DateFormat(Now())){
			arrayAppend(errorMsg,"You must provide a valid DOB");
			return errorMsg;
		}
		if(arguments.formDetails.Gender == 'Select Gender'){
			arrayAppend(errorMsg,"You must select your Gender.");
			return errorMsg;
		}
		if(arguments.formDetails.Country == 'Select Country'){
			arrayAppend(errorMsg,"You must select your Country.");
			return errorMsg;
		}
	    if(arguments.formDetails.State == 'Select State'){
			arrayAppend(errorMsg,"You must select your State.");
			return errorMsg;
		}
		if(arguments.formDetails.City == 'Select City'){
			arrayAppend(errorMsg,"You must select your City.");
			return errorMsg;
		}
		if(arguments.formDetails.PhoneNo == '' || !refind("^\d{10}$",arguments.formDetails.PhoneNo)){
			arrayAppend(errorMsg,"You must provide a valid 10 digit PhoneNo.");
			return errorMsg;
		}
		if(arguments.formDetails.Email == '' || !refind("[\w.]+@+[a-z]+\.+[com|net|in]",arguments.formDetails.Email)){
			arrayAppend(errorMsg,"You must provide a valid Email Id");
			return errorMsg;
		}
		if(arguments.formDetails.Password == ''
			|| !refind("^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*])[A-Za-z\d$@$!%*]{8,}$",arguments.formDetails.Password))
		{
			arrayAppend(errorMsg,"You must provide a valid Password containing minimum 8
								  characters with atleast one letter,one number and one special character");
			return errorMsg;
		}
		if(arguments.formDetails.ConfirmedPassword == ''
			|| !refind("^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*])[A-Za-z\d$@$!%*]{8,}$",arguments.formDetails.ConfirmedPassword))
		{
			arrayAppend(errorMsg,"You must provide a valid password");
			return errorMsg;
		}
		if(arguments.formDetails.ConfirmedPassword != arguments.formDetails.Password){
			arrayAppend(errorMsg,"Passwords do not match");
			return errorMsg;
		}
		/*check whether the same person exists*/
		try{
			sameUser=queryExecute("SELECT AccountId FROM AccountDetails
								  	  		 WHERE FirstName= :firstName COLLATE SQL_Latin1_General_CP1_CS_AS
								  	  		 AND LastName=:lastName COLLATE SQL_Latin1_General_CP1_CS_AS
								  	  		 OR  UserName= :userName COLLATE SQL_Latin1_General_CP1_CS_AS
								  	  		 OR  EmailId= :emailId COLLATE SQL_Latin1_General_CP1_CS_AS
								  	  		 OR  PhoneNumber= :phoneNo",{
									  	 	 firstName={value=arguments.formDetails.FirstName,cfSqlType="cf_sql_varchar"},
									  	 	 lastName={value=arguments.formDetails.LastName,cfSqlType="cf_sql_varchar"},
									  	 	 userName={value=arguments.formDetails.UserName,cfSqlType="cf_sql_varchar"},
									  	 	 emailId={value=arguments.formDetails.Email,cfSqlType="cf_sql_varchar"},
									  	 	 phoneNo={value=arguments.formDetails.PhoneNo,cfSqlType="cf_sql_varchar"}});

			if(sameUser.recordCount ){
				arrayAppend(errorMsg,"It seems such user already exists! Try logging if you are the same person.");
			}
		}
		catch(any exception){
				writeLog(type="Error", file="my_colbox_application", text=" Exception type=#exception.type# ,
																			Exception Message=#exception.message#");
		}
		return errorMsg;
	}

}