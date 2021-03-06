/*----------------------------------------------------------------------------->
<!--- Component :  Login.cfc --->
<!--- Author 	 :	Ankita Rath --->
<!--- Date     :	September 11, 2018 --->
<!--- Description : Component for login and logout user--->
<!-----------------------------------------------------------------------------*/

/**
*  @hint "model for login and logout"
**/
component displayname="loginOrLogoutUserComponent" accessors=true{

	property name="lockSimultaneousUserLoginServiceObj" inject="lockSimultaneousUserLoginService";

	public boolean function loginUser(required string emailOrUsername,required string passkey )
	description="method to login user" hint="login User"
	{

		var login=false;
		var collectUserDetails= new query();
		var updateSessionId=new query();
		var password= hash(arguments.passkey,"SHA1");

		/*Check for other user simultaneously logging*/
		lockSimultaneousUserLoginServiceObjFlag =
							lockSimultaneousUserLoginServiceObj.lockMutualLogin(arguments.emailOrUserName,password);
		try{
			if(lockSimultaneousUserLoginServiceObjFlag == true){
					login=false;
				}
			else{
				transaction{
					updateSessionId=queryExecute("UPDATE AccountDetails SET SessionId = :sess
							   					  WHERE EmailId= :emailId
							  	 				  OR UserName= :userName",
							  	 				  {sess={value=session.sessionId,cfSqlType="cf_sql_varchar"},
							  	 				   emailId={value=arguments.emailOrUserName,cfSqlType="cf_sql_varchar"},
								  	 			   userName={value=arguments.emailOrUserName,cfSqlType="cf_sql_varchar"}});


					collectUserDetails=queryExecute("SELECT AccountId,UserName,ImagePath,PasswordHash
								  FROM AccountDetails
								  WHERE EmailId= :emailId COLLATE SQL_Latin1_General_CP1_CS_AS
							  	  OR UserName= :userName COLLATE SQL_Latin1_General_CP1_CS_AS
								  AND PasswordHash=:password
								  And IsUserActive=1",{emailId={value=arguments.emailOrUserName,cfSqlType="cf_sql_varchar"},
								  	 				   userName={value=arguments.emailOrUserName,cfSqlType="cf_sql_varchar"},
								  	 				   password={value=password,cfSqlType="cf_sql_varchar"}});

				} // transaction ends
					if(collectUserDetails.recordCount == 1){
						session.loggedInUser={'userName'=collectUserDetails.UserName,
											  'isUserLoggedIn'=true,'userId'=collectUserDetails.AccountId};
						login=true;
					}
					else{
						login=false;
					}
				}
			}
		catch(any exception){
				writeLog(type="Error", file="my_colbox_application", text=" Exception type=#exception.type# ,
																			Exception Message=#exception.message#");
				login=false;
		}

		return login;
    } /*End of loginUser()*/


	public boolean function logoutUser()
	description="function for logout User" hint="logout user"
	{
			var logout=false;
			try{
					clearSession=queryExecute("UPDATE AccountDetails
											   SET SessionId=NULL
											   WHERE AccountId= :accId",
											   {accId={value="#Session.loggedInUser.userId#",cfSqlType="cf_sql_integer"}});

					structDelete(session,"loggedInUser");
					structDelete(cookie,CFID);
					structDelete(cookie,CFTOKEN);
					logout=true;

				}
			catch(any exception){
				writeLog(type="Error", file="my_colbox_application", text=" Exception type=#exception.type# ,
																			Exception Message=#exception.message#");
				logout=false;
			}

			return logout;
	}/*End of logoutUser()*/
}