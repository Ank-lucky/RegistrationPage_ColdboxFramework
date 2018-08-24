/** model for login and logout*/
component accessors="true"{

	//property name="chatDb" inject="coldbox:setting:ColdboxChatDb";
	property name="lockSimultaneousUserLoginServiceObj" inject="lockSimultaneousUserLoginService";

	 function init(){
		return this;
	}

	/*function for user login */
	function loginUser(required emailOrUsername,required passkey ){
		var login=false;
		var collectUserDetails= new query();
		var updateSessionId=new query();
		var password= hash(arguments.passkey,"SHA1");

		/*Check for other user simultaneously logging*/
		lockSimultaneousUserLoginServiceObjFlag=lockSimultaneousUserLoginServiceObj.lockMutualLogin(arguments.emailOrUserName,password);
		try{
			if(lockSimultaneousUserLoginServiceObjFlag == true){
					login=false;
				}
			else{

					updateSessionId=queryExecute("UPDATE AccountDetails SET SessionId = :sess
							   					  WHERE EmailId= :emailId
							  	 				  OR UserName= :userName",{sess={value=session.sessionId,cfSqlType="cf_sql_varchar"},
							  	 				  						   emailId={value=arguments.emailOrUserName,cfSqlType="cf_sql_varchar"},
								  	 			 						   userName={value=arguments.emailOrUserName,cfSqlType="cf_sql_varchar"}});


					collectUserDetails=queryExecute("SELECT AccountId,UserName,ImagePath,PasswordHash
								  FROM AccountDetails
								  WHERE EmailId= :emailId
							  	  OR UserName= :userName
								  AND PasswordHash=:password
								  And IsUserActive=1",{emailId={value=arguments.emailOrUserName,cfSqlType="cf_sql_varchar"},
								  	 				   userName={value=arguments.emailOrUserName,cfSqlType="cf_sql_varchar"},
								  	 				   password={value=password,cfSqlType="cf_sql_varchar"}});

					if(collectUserDetails.recordCount == 1){
						session.loggedInUser={'userName'=collectUserDetails.UserName,'isUserLoggedIn'=true,'userId'=collectUserDetails.AccountId};
						login=true;
					}
					else{
						login=false;
					}
				}
			}
		catch(any exception){
				writeLog(type="Error", file="coldboxLoginUser", text=" Exception type=#exception.type# ,Exception Message=#exception.message#");
				login=false;
		}

		return login;
    } /*End of loginUser()*/

	/*function for logout User*/
	function logoutUser(){
			var logout=false;
			try{
					clearSession=queryExecute("UPDATE AccountDetails
											   SET SessionId=NULL
											   WHERE AccountId= :accId",{accId={value="#Session.loggedInUser.userId#",cfSqlType="cf_sql_integer"}});
					structDelete(cookie,CFID);
					structDelete(cookie,CFTOKEN);
					logout=true;

				}
			catch(any exception){
				writeLog(type="Error", file="coldboxLogoutUser", text=" Exception type=#exception.type# ,Exception Message=#exception.message#");
				logout=false;
			}

			return logout;
	}/*End of logoutUser()*/
}