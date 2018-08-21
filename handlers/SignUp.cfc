component extends="coldbox.system.EventHandler"{
	function index(event,rc,prc){
		var login= populateModel("login");
		writeDump(login);abort;
	}
	function someth(event,rc,prc){
		abort;
	}
}