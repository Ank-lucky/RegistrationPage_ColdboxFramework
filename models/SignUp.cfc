/*----------------------------------------------------------------------------->
<!--- Component : SignUp.cfc --->
<!--- Author 	 :	Ankita Rath --->
<!--- Date     :	September 11, 2018 --->
<!--- Description : Component for Signing Up a user --->
<!-----------------------------------------------------------------------------*/

/**
 * @hint "component to Sign Up user"
 **/
component displayname="SignUpComponent" accessors=true{

	public boolean function signUpUserAndStoreDetails(required struct formDetails)
	description="function to insert user Details and signup" hint="signUp user"
	{
		var userAddressInfo= new query();
		var userPersonalInfo=new query();
		var signUpFlag=false;
		var insertResult=-1;
		var passkey=hash(arguments.formDetails.Password,"SHA1");

		try{
			transaction{
	  			userAddressInfo=queryExecute("INSERT INTO Address(City,State,Country) VALUES(:city,:state,:country)",
	     						{city={value=arguments.formDetails.City ,cfSqlType="cf_sql_varchar"},
	     			 			state={value=arguments.formDetails.State ,cfSqlType="cf_sql_varchar"},
	     			 			country={value=arguments.formDetails.Country, cfSqlType="cf_sql_varchar"}},{result="insertResult"});

	     		var datatime = createOdbcDateTime( now() );

	     		userPersonalInfo=queryExecute("INSERT INTO AccountDetails (UserName,FirstName,MiddleName,LastName,
	     																   IsUserActive,PasswordHash,PhoneNumber,EmailId,
	     																   AddressId,ImagePath,DateofBirth,Gender,
	     																   AccountCreationDate)
	   										   VALUES(:userName,:firstName,:middleName,:lastName,:isUserActive,
	   										   		  :passkeyHashed,:phoneNo,:email,:generatedAddressKey,:imagePath,
	   										   		  :dob,:gender,:dateTime)",

				   								{
								   				 	userName=     {value=arguments.formDetails.UserName,cfsqltype="cf_sql_varchar"},
									   				firstName=    {value=arguments.formDetails.FirstName, cfsqltype="cf_sql_varchar"},
									   				middleName=   {value=arguments.formDetails.MiddleName, cfsqltype="cf_sql_varchar",
									   							   null="#NOT len(arguments.formDetails.MiddleName)#"},
									   				lastName=     {value=arguments.formDetails.LastName, cfsqltype="cf_sql_varchar"},
									      			isUserActive= {value=1 ,cfsqltype="cf_sql_bit"},
									      			passkeyHashed={value=passkey,cfsqltype="cf_sql_varchar"},
									      			phoneNo=      {value=arguments.formDetails.PhoneNo, cfsqltype="cf_sql_varchar"},
									      			email=        {value=arguments.formDetails.Email , cfsqltype="cf_sql_varchar"},
									      			generatedAddressKey= {value=insertResult.generatedKey, cfsqltype="cf_sql_integer"},
													imagePath=           {value="avatar-default-icon", cfsqltype="cf_sql_varchar"},
													dob=                 {value=arguments.formDetails.DOB , cfsqltype="cf_sql_date"},
													gender=              {value=arguments.formDetails.Gender,cfsqltype="cf_sql_varchar"},
												 	dateTime=            { value=datatime ,cfsqltype="cf_sql_timestamp"}
												 });

					 }/*transaction ends*/
					 signUpFlag=true;
		}
		catch(any exception){
			writeLog(type="Error", file="my_colbox_application", text=" Exception type=#exception.type# ,Exception Message=#exception.message#");
			signUpFlag=false;
		}
		return signUpFlag;
	}/*signUpUserAndStoreDetails() ends here*/

}