<!--- THIS IS PURELY A LOGIN PROCESSING PAGE --->
<cfif structKeyExists(FORM, "userID") && structKeyExists(FORM, "password")>
	
	<cfset authInfo = APPLICATION.authService.doLogin( userID = FORM.userID, password = FORM.password)>
	
	<!--- IF LOGIN is successful  --->
	<cfif authInfo.isLoggedIn>
		<!--- SET auth info into session. you will use this to check their roles and whether they are logged in on each request in on-request start and redirect to log-in if not. --->
		<cfset SESSION.auth = authInfo>
		<!--- redirect them to admin --->
		<cflocation url="/admin/dashboard/" addtoken="false" />
	

	</cfif>

<cfelse>

	<cflocation url="/?accessDenied=1" addtoken="false"  />

</cfif> 