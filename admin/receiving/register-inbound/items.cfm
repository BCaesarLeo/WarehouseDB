
<!--- *********************** _header ***********************--->
<cfinclude template="/includes/chunks/_header.cfm">
<cfsetting requesttimeout="4600"></cfsetting>
<cfset exoContainerContents= APPLICATION.inventoryAuditObj.urlContainer()>

<!--- *********************** _coreJavaScript ***********************--->
<cfinclude template="/includes/chunks/_coreJavaScript.cfm">

<!--- *********************** THIS PAGE's specific javascript such as (datatables, flot, etc..) ***********************--->
    <!--Barcode Generator--->
<script type="text/javascript" src="/js/jquery-barcode.js"></script>
<!--- Lodash  --->

<!--- Sets Barcode Value if form value has been pressed      --->

    <cfoutput>
        <script type="text/javascript">
        $("##bcTarget").barcode("#exoContainerContents.ContainerNo[1]#", "code128",{barWidth:2, barHeight:60});  
        </script>   
    </cfoutput>

    </head>




<!--- USES THE VARIABLE DEFINED ABOVE TO CREATE THE PDF USING CF TAGS --->
<cfheader name="Content-Disposition" value="inline; filename=Test.pdf">
<cfdocument format="pdf" >
  <cfoutput query="exoContainerContents" maxrows="1">
  <h4> #ContainerNo[1]#</h4>
    <div id="bcTarget">
     <cfdump var="#SERVER#" />
  </div>
 </cfoutput>
<cfloop query="exoContainerContents" >
    
<cfoutput>
    <div>

  <ul class="sf-menu sf-js-enabled">
            <li><a href="index.cfm">#SKU#</a></li>

                <ul>
                    </div>
                    </cfoutput>
                    </cfloop>
  <cfdump var="#exoContainerContents#">
</cfdocument>

<!--********************************--->
<!--- Custom Size PDF works!
<cfheader name="Content-Disposition" value="inline; filename=Test.pdf">
<cfdocument format="pdf" pagetype="custom" 
    unit="cm" 
    pagewidth="6" 
    pageheight="6" 
    margintop="0" 
    marginbottom="0" 
    marginleft="0" 
    marginright="0" 
    fontembed="yes">
  <cfdump var="#exoContainerContents#">
  </cfoutput>
</cfdocument> --->



