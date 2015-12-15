<cfcomponent>
	<!--- INIT constructor function --->
	<cffunction name="init" access="public" output="false" returntype="authService">

  	<cfreturn this>

  </cffunction>

  <cffunction name="doLogin" access="public" output="false" returntype="struct" hint="Authenticates the user and sets their role">
		<cfargument name="userID" required="true">
		<cfargument name="password" required="true">

  	<cfscript>
	  	if ( userID == 'admin' && password == 'Fourway!') {
	  		//usually you would check this username and password against a database and set the below stuff from the returned query
	  		var authInfo = {
	  			"isLoggedIn" = true,
	  			"userID" = 'admin',
	  			"roles" = ['admin','ecoflex'], //since this is an array we can.. do.. arrayFindNoCase(SESSION.auth.roles, 'admin')
	  			"isAdmin" = true, //we'll make it easier on ourselves to know if they have admin role with this quick boolean
	  			"userDsp" = "Administrator",
	  			"email" = "test@test.com",
	  			"firstName" = "Joe",
	  			"lastName" = "Admin",
	  			"fullName" = "Joe Admin"
	  		};
	  	} else if ( userID == 'EcoFlex' && password == '12345!') {
				var authInfo = {
	  			"isLoggedIn" = true,
	  			"userID" = 'EcoFlex',
	  			"roles" = ['ecoflex'],
	  			"isAdmin" = false,
	  			"userDsp" = "EcoFlex",
	  			"email" = "EcoFlex@test.com",
	  			"firstName" = "Eco",
	  			"lastName" = "Flex",
	  			"fullName" = "Eco Flex"
	  		};
	  	} else {
	  		return {};
	  	}
	  	// now return the auth information so it can be set into SESSION scope.
	  	return authInfo;
  	</cfscript>

  </cffunction>


</cfcomponent>