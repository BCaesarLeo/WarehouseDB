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
       // NICO
        this.datasource={name='db88', username="ngocthanhit", password="ngocthanhit!1"};

        //MAIL SERVER



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

            //API Objects
            APPLICATION.fedexship = new cfc.inventory.fedex1();

            //FEDEX OBJECTS
            APPLICATION.FedExKey = "mSoBq9VwVNdlHqKW";
            APPLICATION.FedExpassword = "PUp6xJcwA8Dh7yiZKfup7d8LH";    
            APPLICATION.FedExaccount = "510087666";
            APPLICATION.FedExmeter = "100276477";
            APPLICATION.FedExserver = "https://gatewaybeta.fedex.com/xml";
            APPLICATION.FedExbillingAct = "271120632";
            APPLICATION.FedExCompany = "DynamixS";

//NICO
            //MAIL OBJECTS
            APPLICATION.emailAddress = "";
            APPLICATION.emailServer = "";   
            APPLICATION.emailPort  =  "26";
            APPLICATION.emailPassword = "";
    



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
        <cfargument name="appScope"     type="struct" required="false">
        <!--- ************************************************************* --->
    </cffunction>

    <!--- OnMissing Template --->
    <cffunction name="onMissingTemplate" access="public" returntype="boolean" output="true" hint="I execute when a non-existing CFM page was requested.">
        <cfargument name="template" type="string" required="true"   hint="I am the template that the user requested."/>

    </cffunction>

<!--- <cffunction name="onError"> 
    <cfargument name="Exception" required="true"/> 
    <cfargument type="String" name = "EventName" required="true"/> 
    <!--- Log all errors. ---> 
    <cflog file="#This.Name#" type="error" text="Event Name: #Eventname#"> 
    <cflog file="#This.Name#" type="error" text="Message: #exception.message#"> 
    <!--- Some exceptions, including server-side validation errors, do not 
             generate a rootcause structure. ---> 
    <cfif isdefined("exception.rootcause")> 
        <cflog file="#This.Name#" type="error"  
            text="Root Cause Message: #exception.rootcause.message#"> 
    </cfif>     
    <!--- Display an error message if there is a page context. ---> 
    <cfif NOT (Arguments.EventName IS onSessionEnd) OR  
            (Arguments.EventName IS onApplicationEnd)> 
        <cfoutput> 
            <h2>An unexpected error occurred.</h2> 
            <p>Please provide the following information to technical support:</p> 
            <p>Error Event: #EventName#</p> 
            <p>Error details:#Exception#<br> 
            <cfabort>
            <!--- <cfdump var= "#Exception#"></p>  --->
        </cfoutput> 
    </cfif> 
    </cffunction> --->

</cfcomponent>
