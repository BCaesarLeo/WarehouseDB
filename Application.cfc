<!-----------------------------------------------------------------------
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************
Description :
	This is the Application.cfc for usage withing the ColdBox Framework.
----------------------------------------------------------------------->
<cfcomponent output="false">
	<cfsetting enablecfoutputonly="yes">

	<cfscript>
        //APPLICATION PROPERTIES
        this.name = hash( getCurrentTemplatePath() );

    	this.sessionManagement = true;
    	this.sessionTimeout = createTimeSpan(0,0,30,0);
    	this.setClientCookies = true;

        // MAPPINGS
        rootPath = getDirectoryFromPath(getCurrentTemplatePath());
        this.mappings['/cfc'] = rootPath & 'cfc';
        this.mappings['/includes'] = rootPath & 'includes';
        // DATASOURCE
       
		this.datasource={name='db11', username="bc992164", password="Bc992164!"};
    </cfscript>

	<!--- on Application Start --->
	<cffunction name="onApplicationStart" returnType="boolean" output="false">
		<cfscript>
            ////////////////////////////////////////////////////////////////////////////////////////
			//make SINGLETON cfc objects in the application scope. Must reinit when you make changes
            // UTIL OBJECTS
            APPLICATION.utilObj = new cfc.util.util();
            APPLICATION.dataTablesObj = new cfc.json.dataTables();

            // AUTHENTICATION OBJECTS
            APPLICATION.authService = new cfc.authService();

            //INVENTORY OBJECTS
			APPLICATION.inventoryService = new cfc.inventory.inventoryService();
			APPLICATION.inventoryAuditObj = new cfc.inventory.inventoryAudit();

			return true;
		</cfscript>
	</cffunction>

	<!--- on Request Start --->
	<cffunction name="onRequestStart" returnType="boolean" output="true">
		<!--- ************************************************************* --->
		<cfargument name="targetPage" type="string" required="true" />
		<!--- ************************************************************* --->

        <cfscript>
            //////////////////////////////////////////////////////////////////////
            /// RELOAD THE APPLICATION
            if ( structKeyExists(URL, 'reinit') ) {
                onApplicationStart();
            }
            //////////////////////////////////////////////////////////////////////
            /// CHECK IF THEY ARE LOGGED IN (only check if the current page doesn't contain the word login)
            if ( (structKeyExists(URL, "logout")) OR (CGI.script_name contains '/admin' && ( !structKeyExists(SESSION, 'auth') OR ( structKeyExists(SESSION, 'auth') && !SESSION.auth.isLoggedIn))) ) {
                structClear(SESSION);
                location(url="/?loggedOut=1", addToken="false");
            }
        </cfscript>

		<cfreturn true>
	</cffunction>

	<!--- on Application End --->
	<cffunction name="onApplicationEnd" returnType="void"  output="false">
		<!--- ************************************************************* --->
		<cfargument name="appScope" type="struct" required="true">
		<!--- ************************************************************* --->
	</cffunction>

	<!--- on Session Start --->
	<cffunction name="onSessionStart" returnType="void" output="false">
	</cffunction>

	<!--- on Session End --->
	<cffunction name="onSessionEnd" returnType="void" output="false">
		<!--- ************************************************************* --->
		<cfargument name="sessionScope" type="struct" required="true">
		<cfargument name="appScope" 	type="struct" required="false">
		<!--- ************************************************************* --->
	</cffunction>

	<!--- OnMissing Template --->
	<cffunction	name="onMissingTemplate" access="public" returntype="boolean" output="true" hint="I execute when a non-existing CFM page was requested.">
		<cfargument name="template"	type="string" required="true"	hint="I am the template that the user requested."/>

	</cffunction>


</cfcomponent>