<cfcomponent>
<cffunction name="shipping" access="remote" returntype="string" output="No"> 
<!--- To Address --->
 <cfargument name="Company" type="string" required="Yes" >
 <cfargument name="Name" type="string" required="Yes" >
 <cfargument name="Address1" type="string" required="Yes" >
 <cfargument name="Address2" type="string" required="No" default="">
 <cfargument name="City" type="string" required="Yes" >
 <cfargument name="State" type="string" required="Yes" >
 <cfargument name="ZIP" type="string" required="Yes" >
 <cfargument name="Phone" type="string" required="Yes" >
 <cfargument name="IsResident" type="string" required="No" default="false" >
<!--- package Details --->
 <cfargument name="weight" type="string" required="Yes" >
 <cfargument name="Length" type="string" required="Yes" >
 <cfargument name="Width" type="string" required="Yes" >
 <cfargument name="Height" type="string" required="Yes" >
 <cfargument name="PackagingType"type="string" required="Yes" hint="Available Options : FEDEX_10KG_BOX, FEDEX_25KG_BOX, FEDEX_BOX, FEDEX_ENVELOPE, FEDEX_PAK, FEDEX_TUBE, YOUR_PACKAGING">
<!--- shipping details ---->
 <cfargument name="orderid" type="string" required="No" default="#CreateUUID()#">
 <cfargument name="ShippingMethod"type="string" required="No" default="STANDARD_OVERNIGHT" hint="Available Options : EUROPE_FIRST_INTERNATIONAL_PRIORITY, FEDEX_1_DAY_FREIGHT, FEDEX_2_DAY, FEDEX_2_DAY_FREIGHT, FEDEX_3_DAY_FREIGHT, FEDEX_EXPRESS_SAVER, FEDEX_GROUND, FIRST_OVERNIGHT, GROUND_HOME_DELIVERY, INTERNATIONAL_ECONOMY, INTERNATIONAL_ECONOMY_FREIGHT, INTERNATIONAL_FIRST, INTERNATIONAL_PRIORITY, INTERNATIONAL_PRIORITY_FREIGHT, PRIORITY_OVERNIGHT, SMART_POST, STANDARD_OVERNIGHT">
 <cfargument name="ShipDate" type="string" required="No" default="#now()#">
 <cfargument name="department" type="string" required="No" default="">
 <cfargument name="ponumber" type="string" required="No" default="">
 <cfargument name="DropoffType" type="string" required="No" default="REGULAR_PICKUP" hint="Available Options : REGULAR_PICKUP, REQUEST_COURIER, DROP_BOX, BUSINESS_SERVICE_CENTER, STATION">
 <cfargument name="SpecialServices"type="string" required="No" default="" hint="Available Options : DANGEROUS_GOODS, BROKER_SELECT_OPTION, COD, DRY_ICE, ELECTRONIC_TRADE_DOCUMENTS, EMAIL_NOTIFICATION, FUTURE_DAY_SHIPMENT, HOLD_AT_LOCATION, HOME_DELIVERY_PREMIUM, INSIDE_DELIVERY, INSIDE_PICKUP, PENDING_SHIPMENT, RETURN_SHIPMENT, SATURDAY_DELIVERY, SATURDAY_PICKUP">
 <cfargument name="DryIceWeight"type="string" required="No" default="" hint="Dry Ice Weight">
<!--- "Hold At" Location Address ---->
 <cfargument name="HoldAtAddress1"type="string" required="No" default="">
 <cfargument name="HoldAtAddress2"type="string" required="No" default="">
 <cfargument name="HoldAtCity" type="string" required="No" default="">
 <cfargument name="HoldAtState" type="string" required="No" default="">
 <cfargument name="HoldAtZIP" type="string" required="No" default="">
 <cfargument name="HoldAtPhone" type="string" required="No" default="">
 <cfargument name="HoldAtIsResident" type="string" required="No" default="false" >
<!--- log settings --->
 <cfargument name="returnLog" type="string" required="No" default="#ExpandPath('log/return/')#">
 <cfargument name="fedexcallLog"type="string" required="No" default="#ExpandPath('log/fedexcall/')#">
<!--- fedex Access Settings --->
 <cfargument name="key" type="string" required="No" default="#application.FedExkey#">
 <cfargument name="password" type="string" required="No" default="#application.FedExpassword#">
 <cfargument name="account" type="string" required="No" default="#application.FedExaccount#">
 <cfargument name="meter" type="string" required="No" default="#application.FedExmeter#">
 <cfargument name="serverurl" type="string" required="No" default="#application.FedExserver#" hint="SandBox : https://gatewaybeta.fedex.com/xml , Production: https://gateway.fedex.com/xml">
 <cfargument name="billingAct" type="string" required="No" default="#application.FedExbillingAct#">
 <cfargument name="PaymentType" type="string" required="No" default="THIRD_PARTY"  hint="Available Options : COLLECT, RECIPIENT, SENDER, THIRD_PARTY">
 <cfargument name="LabelType" type="string" required="No" default="PAPER_4X6"  hint="Available Options : PAPER_4X6, PAPER_4X8, PAPER_4X9, PAPER_7X4.75, PAPER_8.5X11_BOTTOM_HALF_LABEL, PAPER_8.5X11_TOP_HALF_LABEL, STOCK_4X6, STOCK_4X6.75_LEADING_DOC_TAB, STOCK_4X6.75_TRAILING_DOC_TAB, STOCK_4X8, STOCK_4X9_LEADING_DOC_TAB, STOCK_4X9_TRAILING_DOC_TAB">
<!--- shipping label settings --->
 <cfargument name="FedexPDF" type="string" required="No" default="#ExpandPath('FedexPDF/')#">
 <cfargument name="labelFile" type="string" required="No" default="pdf" hint="Available Options : DPL, EPL2, PDF, PNG, ZPLII">  
<!--- From Address --->
 <cfargument name="FromCompany" type="string" required="No" default="My Company" >
 <cfargument name="FromName" type="string" required="No" default="John Doe" >
 <cfargument name="FromAddress1"type="string" required="No" default="16 Court Street" >
 <cfargument name="FromAddress2"type="string" required="No" default="">
 <cfargument name="FromCity" type="string" required="No" default="New York">
 <cfargument name="FromState" type="string" required="No" default="NY">
 <cfargument name="FromZIP" type="string" required="No" default="10211">
 <cfargument name="FromPhone" type="string" required="No" default="2015282777" >
 <cfargument name="FromIsResident" type="string" required="No" default="false" > 
 
 <!---- ************************************************************** --->
 <!---- create fedex xml                                                --->
 <!---- ************************************************************** --->
 <cfsavecontent variable="XMLPacket"><cfoutput>
 <ns:ProcessShipmentRequest 
  xsi:schemaLocation ="http://www.fedex.com/templates/components/apps/wpor/secure/downloads/xml/Aug09/Advanced/ShipService_v7.xsd" 
  xmlns:ns    ="http://fedex.com/ws/ship/v7" 
  xmlns:xsi    ="http://www.w3.org/2001/XMLSchema-instance">
 
  <ns:WebAuthenticationDetail>
    <ns:UserCredential>
    <ns:Key>#arguments.key#</ns:Key>
    <ns:Password>#arguments.password#</ns:Password>
    </ns:UserCredential>
  </ns:WebAuthenticationDetail>
 
  <ns:ClientDetail>
    <ns:AccountNumber>#arguments.account#</ns:AccountNumber>
    <ns:MeterNumber>#arguments.meter#</ns:MeterNumber>
  </ns:ClientDetail>
 
  <ns:TransactionDetail>
    <ns:CustomerTransactionId>#arguments.orderid#</ns:CustomerTransactionId>
  </ns:TransactionDetail>
 
  <ns:Version>
    <ns:ServiceId>ship</ns:ServiceId>
    <ns:Major>7</ns:Major>
    <ns:Intermediate>0</ns:Intermediate>
    <ns:Minor>0</ns:Minor>
  </ns:Version>
  <ns:RequestedShipment>
    <ns:ShipTimestamp>#dateformat(arguments.ShipDate,"yyyy-mm-dd")#T#TimeFormat(arguments.ShipDate, "HH:mm:ss")#</ns:ShipTimestamp>
    <ns:DropoffType>#arguments.DropoffType#</ns:DropoffType>
    <ns:ServiceType>#trim(arguments.ShippingMethod)#</ns:ServiceType>
    <ns:PackagingType>#trim(arguments.PackagingType)#</ns:PackagingType>
    <ns:Shipper>
    <ns:Contact>
     <ns:PersonName>#arguments.FromName#</ns:PersonName>
     <ns:CompanyName>#arguments.FromCompany#</ns:CompanyName>
     <ns:PhoneNumber>#arguments.FromPhone#</ns:PhoneNumber>
    </ns:Contact>
    <ns:Address>
     <ns:StreetLines>#arguments.FromAddress1#</ns:StreetLines>
     <cfif len(trim(arguments.FromAddress2))><ns:StreetLines>#XMLFormat(arguments.FromAddress2)#</ns:StreetLines></cfif>
     <ns:City>#arguments.FromCity#</ns:City>
     <ns:StateOrProvinceCode>#arguments.FromState#</ns:StateOrProvinceCode>
     <ns:PostalCode>#arguments.FromZIP#</ns:PostalCode>
     <ns:CountryCode>US</ns:CountryCode>
     <ns:Residential>#arguments.FromIsResident#</ns:Residential>
    </ns:Address>
    </ns:Shipper>
    <ns:Recipient>
    <ns:Contact>
     <ns:PersonName>#XMLFormat(arguments.Name)#</ns:PersonName>
     <cfif len(trim(arguments.Company))>
     <ns:CompanyName>#XMLFormat(arguments.Company)#</ns:CompanyName>
     </cfif>
     <ns:PhoneNumber>#XMLFormat(arguments.Phone)#</ns:PhoneNumber>
    </ns:Contact>
    <ns:Address>
     <ns:StreetLines>#XMLFormat(arguments.Address1)#</ns:StreetLines>
     <cfif len(trim(arguments.Address2))><ns:StreetLines>#XMLFormat(arguments.Address2)#</ns:StreetLines></cfif>
     <ns:City>#XMLFormat(arguments.City)#</ns:City>
     <ns:StateOrProvinceCode>#XMLFormat(arguments.State)#</ns:StateOrProvinceCode>
     <ns:PostalCode>#XMLFormat(arguments.ZIP)#</ns:PostalCode>
     <ns:CountryCode>US</ns:CountryCode>
     <ns:Residential>#arguments.IsResident#</ns:Residential>
    </ns:Address>
    </ns:Recipient>
 
    <ns:ShippingChargesPayment>
    <ns:PaymentType>#arguments.PaymentType#</ns:PaymentType>
    <ns:Payor>
     <ns:AccountNumber>#arguments.billingAct#</ns:AccountNumber>
     <ns:CountryCode>US</ns:CountryCode>
    </ns:Payor>
    </ns:ShippingChargesPayment> 
    <cfif len(arguments.SpecialServices) and listfind("SATURDAY_DELIVERY,SATURDAY_PICKUP,HOLD_AT_LOCATION",arguments.SpecialServices)>
    <ns:SpecialServicesRequested>
    <ns:SpecialServiceTypes>#arguments.SpecialServices#</ns:SpecialServiceTypes>    
     <cfswitch expression="#arguments.SpecialServices#">
      <cfcase value="HOLD_AT_LOCATION">
        <ns:HoldAtLocationDetail>
        <ns:PhoneNumber>#XMLFormat(arguments.HoldAtPhone)#</ns:PhoneNumber>
        <ns:Address>
        <ns:StreetLines>#XMLFormat(arguments.HoldAtAddress1)#</ns:StreetLines>
        <cfif len(trim(arguments.HoldAtAddress2))><ns:StreetLines>#XMLFormat(arguments.HoldAtAddress2)#</ns:StreetLines></cfif>
        <ns:City>#XMLFormat(arguments.HoldAtCity)#</ns:City>
        <ns:StateOrProvinceCode>#XMLFormat(arguments.HoldAtState)#</ns:StateOrProvinceCode>
        <ns:PostalCode>#XMLFormat(arguments.HoldAtZIP)#</ns:PostalCode>
        <ns:CountryCode>US</ns:CountryCode>
        <ns:Residential>#arguments.HoldAtIsResident#</ns:Residential>
        </ns:Address>
        </ns:HoldAtLocationDetail>
      </cfcase>
     </cfswitch>
    </ns:SpecialServicesRequested>
    </cfif>
      
    <ns:LabelSpecification>
    <ns:LabelFormatType>COMMON2D</ns:LabelFormatType>
    <ns:ImageType>#ucase(arguments.labelFile)#</ns:ImageType>
    <ns:LabelStockType>#arguments.LabelType#</ns:LabelStockType>
    </ns:LabelSpecification>
    
    <ns:RateRequestTypes>ACCOUNT</ns:RateRequestTypes>
    
    <ns:PackageCount>1</ns:PackageCount>
    <ns:PackageDetail>INDIVIDUAL_PACKAGES</ns:PackageDetail>
    <ns:RequestedPackageLineItems>
    <ns:SequenceNumber>1</ns:SequenceNumber>
    <ns:Weight>
     <ns:Units>LB</ns:Units>
     <ns:Value>#trim(arguments.weight)#</ns:Value>
    </ns:Weight>
    <ns:Dimensions>
     <ns:Length>#trim(arguments.Length)#</ns:Length>
     <ns:Width>#trim(arguments.Width)#</ns:Width>
     <ns:Height>#trim(arguments.Height)#</ns:Height>
     <ns:Units>IN</ns:Units>
    </ns:Dimensions>
    <ns:PhysicalPackaging>BOX</ns:PhysicalPackaging>
 
    <ns:CustomerReferences>
    <ns:CustomerReferenceType>INVOICE_NUMBER</ns:CustomerReferenceType>
    <ns:Value>#arguments.orderid#</ns:Value>
    </ns:CustomerReferences>
    <cfif len(arguments.department)>
    <ns:CustomerReferences>
    <ns:CustomerReferenceType>DEPARTMENT_NUMBER</ns:CustomerReferenceType>
    <ns:Value>#arguments.department#</ns:Value>
    </ns:CustomerReferences>
    </cfif>
    <cfif len(arguments.ponumber)>
    <ns:CustomerReferences>
    <ns:CustomerReferenceType>P_O_NUMBER</ns:CustomerReferenceType>
    <ns:Value>#arguments.ponumber#</ns:Value>
    </ns:CustomerReferences>
    </cfif> 
    <cfif len(arguments.SpecialServices) and listfind("DRY_ICE,DANGEROUS_GOODS",arguments.SpecialServices)>
    <ns:SpecialServicesRequested>
    <ns:SpecialServiceTypes>#arguments.SpecialServices#</ns:SpecialServiceTypes>    
    <cfswitch expression="#arguments.SpecialServices#">
     <cfcase value="DRY_ICE">
      <ns:DryIceWeight>
        <ns:Units>KG</ns:Units>
        <ns:Value>#arguments.DryIceWeight#</ns:Value>
      </ns:DryIceWeight>
     </cfcase>
<!--- More special services discussions needed to be added here ---->     
    </cfswitch>
    </ns:SpecialServicesRequested>
    </cfif>
    
    </ns:RequestedPackageLineItems>
  </ns:RequestedShipment> 
 </ns:ProcessShipmentRequest>
 </cfoutput></cfsavecontent>
 
 
 <!---- ************************************************************** --->
 <!---- log the outgoing fedex request                                 --->
 <!---- ************************************************************** --->
<cfif len(arguments.fedexcallLog) and DirectoryExists(arguments.fedexcallLog)>
<cfif FileExists("#arguments.fedexcallLog##arguments.orderid#.xml")>
<cffile action  = "delete" file  = "#arguments.fedexcallLog##arguments.orderid#.xml"> </cfif>
<cffile action  = "write" charset ="utf-8" file = "#arguments.fedexcallLog##arguments.orderid#.xml" output  = "#XMLPacket#">
</cfif> 
 <!---- ************************************************************** --->
 <!---- call fedex                                                     --->
 <!---- ************************************************************** --->
<cftry>
<cfhttp url="#arguments.serverurl#" port="443" method ="POST" throwonerror="yes"> 
<cfhttpparam name="name" type="XML" value="#XMLPacket#"> 
</cfhttp>
<cfset local.output = XmlParse(CFHTTP.FileContent)>
<cfcatch>
<cfset TrackingNumber = "">
<cfset local.output  = cfcatch>
</cfcatch>
</cftry>
 
 <!---- ************************************************************** --->
 <!---- log fedex return                                                --->
 <!---- ************************************************************** --->
<cfif len(arguments.returnLog) and DirectoryExists(arguments.returnLog)>
<cfif FileExists("#arguments.returnLog##arguments.orderid#.xml")>
<cffile action  = "delete" file  = "#arguments.returnLog##arguments.orderid#.xml">
</cfif>
<cffile
action  = "write"
file = "#arguments.returnLog##arguments.orderid#.xml"
output  = "#local.output#" 
charset = "utf-8">
</cfif>
 
 <!---- ************************************************************** --->
 <!---- save Label / Get Tracking Number                                --->
 <!---- ************************************************************** --->
<cfif IsDefined("local.output.ProcessShipmentReply.CompletedShipmentDetail.CompletedPackageDetails.TrackingIds.TrackingNumber")>
<cfset TrackingNumber  = local.output.ProcessShipmentReply.CompletedShipmentDetail.CompletedPackageDetails.TrackingIds.TrackingNumber.XmlText>
  
<cfif len(arguments.FedexPDF) and DirectoryExists(arguments.FedexPDF)>
<cfset local.img    = local.output.ProcessShipmentReply.CompletedShipmentDetail.CompletedPackageDetails.Label.Parts.Image.XmlText>
<cfset local.img  = ToBinary(local.output.ProcessShipmentReply.CompletedShipmentDetail.CompletedPackageDetails.Label.Parts.Image.XmlText)>
    
<cfif FileExists("#arguments.FedexPDF##arguments.orderid#.#arguments.labelFile#")>
<cffile action  = "delete" file  = "#arguments.FedexPDF##arguments.orderid#.#arguments.labelFile#">
</cfif>
<cffile action ="write"
charset  ="utf-8"
file  ="#arguments.FedexPDF##arguments.orderid#.#arguments.labelFile#"
output  ="#local.img#">
</cfif>
<cfelse>
<cfset TrackingNumber = "123455432">
</cfif> 
<cfreturn TrackingNumber>
</cffunction>
	</cfcomponent>