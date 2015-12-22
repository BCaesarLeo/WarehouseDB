  <cfinvoke component="cfc.inventory.inventoryService" method="getUploadedData" returnvariable="exupl">

<section id="main-content">
  <section class="wrapper">
    <div class="row">
      <div class="col-md-12">
        <ul class="breadcrumb">
              <li><a href="../../"><i class="fa fa-home"></i> Home</a></li>
              <li><a href="/admin/receiving/">Receiving Audits</a></li>
              <li class="active">Register Inbound</li>
          </ul>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">Shipment Manifest Upload- Step 2  *Verify Data</h3>
          </div>
          <div class="panel-body">
		


<!--- <cfoutput>  #form.ecoDataFile# </cfoutput> --->



<!--- gets the data from the cfc inventoryservice --->
                               <cftable query = "exupl"  colheaders="yes" htmlTable="true" 
  startRow = "1" colSpacing = "3" > 
<!--- Each cfcol tag sets width of a column in table, and specifies header 
  information and text/CFML with which to fill cell. ---> 
 <!---  <cfcol header = "Item No" 
  align = "Left" 
  width = 6 
  text= "#ecoxlsquery.ITEM NO.#">  --->

  <cfcol header = "SKU"     
  align = "Left" 
  width = 6 
  text= "#exupl.col_1#"> 

  <cfcol header = "Description" 
  align = "Left" 
  width = 15 
  text= "#exupl.col_2#"> 
  <cfcol header = "Quantity" 
  align = "Left" 
  width = 5
  text= "#exupl.col_3#">
    <cfcol header = "Container" 
  align = "Left" 
  width = 5
  text= "#exupl.ContainerNo#">
    <cfcol header = "Date Registered" 
  align = "Left" 
  width = 5
  text= "#exupl.CONTAINERREGDATE#">

</cftable> 


<!---Duplicates Query... and ben says it's 0ms fast!---->
<cfset session.ecoflexspreadsheetupload = duplicate(exupl)>

<!--- Test to see if ContainerNo. Colummn is null not working! --->
<cfif  exupl.col_3 lt 0 OR NOT Len( exupl.col_3)>
<div class="panel-body">
                                <ul>
                                    <li>Error your File Did not Have Container No. The File must be an Excel<strong> .XLSX</strong> </li>
                                    <li>Row 2 Should Include the  (<strong>Container No.</strong>) </li>
                                    <li>Headers need to be Item/ Description/ Quantity <strong></strong> </li>
                                    
                                </ul>
                            </div>

</cfif>

 <cfform format="html" action="index.cfm">
     <div class="col-md-12">
    
 <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Notes</h3>
                            </div>
                            <div class="panel-body">
                                <ul>
                                    <li>The File must be an Excel<strong> .XLSX</strong> </li>
                                    <li>Ensure You are uploading the Correct  (<strong>Container No.</strong>) </li>
                                    <li>Double Check Quantity <strong></strong> </li>
                                    
                                </ul>
                            </div>
                        </div>
                     

        <button class="btn btn-default" name ="ecoSubmit2" type="submit" value= "Submit"><i class="fa fa-cloud-upload"></i> Upload</button></li>
          
        
          
          
        
          </cfform> 
        
<!--- *************************************** --->
	</div></div></div></section>
</section>
<!--- <cfinclude template="/includes/_debug.cfm"> --->