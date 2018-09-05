/*Lock simultaneous user login in one sessionId*/
component accessors="true"{

	 public boolean function lockMutualLogin(required emailOrUserName, required password){
		var lockSimultaneousUserLoginFlag=false;
		var sessionsCount= new query();
		try{
			lock
				scope="Session"
				type="Readonly"
				timeout=20{
					sessionsCount=queryExecute("SELECT AccountId FROM AccountDetails WHERE SessionId= :sess",{sess={value=session.sessionId,cfSqlType="cf_sql_varchar"}});
					if(sessionsCount.recordCount != 0){

						checkIfSameUserLoggined	= queryExecute("SELECT AccountId FROM AccountDetails WHERE EmailId=:emailId OR UserName=:userName",
												  {emailId={value=arguments.emailOrUserName,cfsqltype="cf_sql_varchar"},userName={value=arguments.emailOrUserName,cfsqltype="cf_sql_varchar"}});

						if (sessionsCount.AccountId != checkIfSameUserLoggined.AccountId)
							lockSimultaneousUserLoginFlag=true;
					}

				}
			}
		catch(any exception){
			writeLog(type="Error", file="lockMutualLogin", text=" Exception type=#exception.type# ,Exception Message=#exception.message#");
		}

		return lockSimultaneousUserLoginFlag ;
	}


}