/*----------------------------------------------------------------------------->
<!--- Component :  LockSimultaneousUserLogin.cfc --->
<!--- Author 	 :	Ankita Rath --->
<!--- Date     :	September 11, 2018 --->
<!--- Description : Component to Lock simultaneous user login in same session --->
<!-----------------------------------------------------------------------------*/

/*
* @hint "Lock simultaneous user login in one sessionId"
 */
component displayname="LockSimultaneousUserLoginComponent" accessors=true{


	 public boolean function lockMutualLogin(required string emailOrUserName, required string password)
	 description="locks simultaneous user logging" hint="lockMutualLogin method"
	 {
		var lockSimultaneousUserLoginFlag=false;
		var sessionsCount= new query();
		var sessionIdVar="";
		try{
			lock
				scope="Session"
				type="Readonly"
				timeout=20{
					sessionIdVar=session.sessionId;
				}
				sessionsCount=queryExecute("SELECT AccountId FROM AccountDetails WHERE SessionId= :sess",
											{sess={value=sessionIdVar,cfSqlType="cf_sql_varchar"}});
					if(sessionsCount.recordCount != 0){

						checkIfSameUserLoggined	= queryExecute("SELECT AccountId FROM AccountDetails
																WHERE EmailId=:emailId OR UserName=:userName",
												  {emailId={value=arguments.emailOrUserName,cfsqltype="cf_sql_varchar"},
												   userName={value=arguments.emailOrUserName,cfsqltype="cf_sql_varchar"}});

						if (sessionsCount.AccountId != checkIfSameUserLoggined.AccountId)
							lockSimultaneousUserLoginFlag=true;
					}

			}
		catch(any exception){
			writeLog(type="Error", file="my_colbox_application", text=" Exception type=#exception.type# ,
																		Exception Message=#exception.message#");
		}

		return lockSimultaneousUserLoginFlag ;
	}


}