<cfinvoke component="cfc.inventory.inventoryupload" method="get_xcel_data" returnvariable="u"></cfinvoke>

<section id="main-content">
  <section class="wrapper">
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">Shipment Manifest Upload</h3>
          </div>
          <div class="panel-body">
            <h2 class="lead">version 1.0</h2>
            <!-- The file upload form used as target for the file upload widget -->

            <!--- define temp filelocation --->
            <cfset strDir=GetDirectoryFromPath(ExpandPath("*.*")) & "/temp">
              <cfset strInExcel=strDir>
               <!---  ************ --->

               <!--- START UPLOAD PAGE --->
               <script type="text/javascript">/* <![CDATA[ */_cf_loadingtexthtml="<img alt=' ' src='/CFIDE/scripts/ajax/resources/cf/images/loading.gif'/>";
                _cf_contextpath="";
                _cf_ajaxscriptsrc="/CFIDE/scripts/ajax";
                _cf_jsonprefix='//';
                _cf_websocket_port=8575;
                _cf_flash_policy_port=1243;
                _cf_clientid='D6D3F2C762B6616A27EAD8A1FD689707';/* ]]> */</script><script type="text/javascript" src="/CFIDE/scripts/ajax/messages/cfmessage_en_US_.js"></script>
                <script type="text/javascript" src="/CFIDE/scripts/ajax/package/cfajax.js"></script>
                <script type="text/javascript" src="/CFIDE/scripts/ajax/smp/swfobject.js"></script>
                <script type="text/javascript" src="/CFIDE/scripts/ajax/jquery/jquery.js"></script>
                <script type="text/javascript" src="/CFIDE/scripts/chart/cfchart-lite.js"></script>
                <script type="text/javascript" src="/CFIDE/scripts/chart/cfchart-html.js"></script>
                <script type="text/javascript" src="/CFIDE/scripts/chart/cfchart.js"></script>
                <script type="text/javascript" src="/CFIDE/scripts/chart/license.js"></script>

                
              
                <script src="js/script.js"></script><script type="text/javascript" src="js/superfish.js"></script><script type="text/javascript" src="js/tabs.js"></script><script type="text/javascript" src="js/FF-cash.js"></script><script type="text/javascript" src="js/jquery.easing.1.3.js"></script><script type="text/javascript" src="js/jquery.cycle.all.min.js"></script><script type="text/javascript" src="js/jquery.color.js"></script><script type="text/javascript" src="js/jquery.backgroundPosition.js"></script><script type="text/javascript" src="js/coin-slider.js"></script><script type="text/javascript" src="js/jquery.galleriffic.js"></script>



                <script type="text/javascript" src="js/jquery.atooltip.pack.js"></script>
                <!-- Attempt to get date from url and pass to query-->


                <!--==============================Help from aaron_stooddard  to make this into cfscript that works=================================-->


                <!--==============================content================================-->
                <section id="content">




<!--- Set some type of logic for submitting to different sections of the webpage --->
<!--- I know I know, I could do better, but loops are so easy to understand --->
    <cfif isDefined("FORM.ecoSubmit1")>
     <cfset session.nsplSkip_SECTION="2">
       <cfoutput>Select Point Type: #session.nsplSkip_SECTION#</cfoutput>
       <cfelseif isDefined("FORM.nsplSubmit2")>
         <cfset session.nsplSkip_SECTION="3">
           <cfoutput>Event Point Type Selection #FORM.nsplEVPoints#  <!--- Step: #session.nsplSkip_SECTION# ---></cfoutput>
           <cfelseif isDefined("FORM.nsplSubmit3")>
             <cfset session.nsplSkip_SECTION="4">
               <cfoutput>Upload Result #session.nsplSkip_SECTION#</cfoutput>
               <cfelse>
                 <cfset StructDelete(Session, "nsplSkip_SECTION")> 
                 </cfif>





                 <cfif Not isDefined("session.nsplSkip_SECTION")>
                  <cfset session.nsplSkip_SECTION="1">
                   <cfoutput>Select Data File: #session.nsplSkip_SECTION#</cfoutput>
                   <cfelse>
                    --
                  </cfif>











                  <cfswitch expression="#session.nsplSkip_SECTION#">
                    <cfcase value="1">
                      <cfset Section="A">
                      </cfcase>

                      <cfcase value="2">
                        <cfset Section="B">
                        </cfcase>
                        <cfcase value="3">
                          <cfset Section="C">
                          </cfcase>
                          <cfcase value="5;4;" delimiters=";">
                            <cfset Section="D">
                            </cfcase>
                            <cfdefaultcase>
                              <cfset Section="A">
                              </cfdefaultcase>
                            </cfswitch>

                            <!-----------------------------------------------BEGIN SECTION 1  ------------------------->
                            <!-----------------------------------------------BEGIN SECTION 1  ------------------------->
                            <!-----------------------------------------------BEGIN SECTION 1  ------------------------->

                            <cfif session.nsplSkip_SECTION eq 1>
                              <!--------       ---->

                              <cfsetting requesttimeout="4600">
                               <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
                            <div class="row fileupload-buttonbar">
                              <cfparam name="ecoDataFile" default="">
                                <cfform action="index.cfm" method="POST" enctype="multipart/form-data">
                                <div class="col-lg-7">
                                    
                            <button type="button" name="ecoDataFile"  class="btn btn-success fileinput-button" > <i class="glyphicon glyphicon-plus"></i><span>Select File</span><input type="file" name="ecoDataFile"></button>
                                   <cfinput type="submit" name="ecoSubmit1" class="btn btn-primary start"  value="Upload to Database">
<div class="col-lg-5 fileupload-progress fade"></cfinput>
                                    <!-- The global progress bar -->
                                    <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                        <div class="progress-bar progress-bar-success" style="width:0%;">
                                        </div>
                                    </div>
                                    <!-- The extended global progress state -->
                                    <div class="progress-extended">
                                        &nbsp;
                                    </div>
                                  </div></div>
                                </div>


                                   </cfform>

                                   <cfoutput>

                                   </cfoutput>
                                 </cfif>


                                 <!-----------------------------------------------END SECTION 1  --------------------------->
                                 <!-----------------------------------------------END SECTION 1  ---------------------------> 
                                 <!-----------------------------------------------END SECTION 1  --------------------------->
                                 <!-----------------------------------------------BEGIN SECTION 2  ------------------------->
                                 <!-----------------------------------------------BEGIN SECTION 2  ------------------------->
                                 <!-----------------------------------------------BEGIN SECTION 2  ------------------------->
                                 <cfif session.nsplSkip_SECTION eq 2>

                                  <!---BEN's CODE  ---->
                                  <!---BEN's CODE  ---->
                                  <!---BEN's CODE  ---->
                                  <!---BEN's CODE  ---->
                                  <cffunction
                                  name="CSVToQuery"
                                  access="public"
                                  returntype="query"
                                  output="false"
                                  hint="Converts the given CSV string to a query.">

                                  <!--- Define arguments. --->
                                  <cfargument
                                  name="CSV"
                                  type="string"
                                  required="true"
                                  hint="This is the CSV string that will be manipulated."
                                  />

                                  <cfargument
                                  name="Delimiter"
                                  type="string"
                                  required="false"
                                  default=","
                                  hint="This is the delimiter that will separate the fields within the CSV value."
                                  />

                                  <cfargument
                                  name="Qualifier"
                                  type="string"
                                  required="false"
                                  default=""""
                                  hint="This is the qualifier that will wrap around fields that have special characters embeded."
                                  />


                                  <!--- Define the local scope. --->
                                  <cfset var LOCAL = StructNew() />


  <!---
    When accepting delimiters, we only want to use the first
    character that we were passed. This is different than
    standard ColdFusion, but I am trying to make this as
    easy as possible.
  --->
  <cfset ARGUMENTS.Delimiter = Left( ARGUMENTS.Delimiter, 1 ) />

  <!---
    When accepting the qualifier, we only want to accept the
    first character returned. Is is possible that there is
    no qualifier being used. In that case, we can just store
    the empty string (leave as-is).
  --->
  <cfif Len( ARGUMENTS.Qualifier )>

    <cfset ARGUMENTS.Qualifier = Left( ARGUMENTS.Qualifier, 1 ) />

  </cfif>


  <!---
    Set a variable to handle the new line. This will be the
    character that acts as the record delimiter.
  --->
  <cfset LOCAL.LineDelimiter = Chr( 10 ) />


  <!---
    We want to standardize the line breaks in our CSV value.
    A "line break" might be a return followed by a feed or
    just a line feed. We want to standardize it so that it
    is just a line feed. That way, it is easy to check
    for later (and it is a single character which makes our
    life 1000 times nicer).
  --->
  <cfset ARGUMENTS.CSV = ARGUMENTS.CSV.ReplaceAll(
    "\r?\n",
    LOCAL.LineDelimiter
    ) />


  <!---
    Let's get an array of delimiters. We will need this when
    we are going throuth the tokens and building up field
    values. To do this, we are going to strip out all
    characters that are NOT delimiters and then get the
    character array of the string. This should put each
    delimiter at it's own index.
  --->
  <cfset LOCAL.Delimiters = ARGUMENTS.CSV.ReplaceAll(
    "[^\#ARGUMENTS.Delimiter#\#LOCAL.LineDelimiter#]+",
    ""
    )

    <!---
      Get character array of delimiters. This will put
      each found delimiter in its own index (that should
      correspond to the tokens).
--->
.ToCharArray()
/>


  <!---
    Add a blank space to the beginning of every theoretical
    field. This will help in make sure that ColdFusion /
    Java does not skip over any fields simply because they
    do not have a value. We just have to be sure to strip
    out this space later on.
 
    First, add a space to the beginning of the string.
  --->
  <cfset ARGUMENTS.CSV = (" " & ARGUMENTS.CSV) />

  <!--- Now add the space to each field. --->
  <cfset ARGUMENTS.CSV = ARGUMENTS.CSV.ReplaceAll(
    "([\#ARGUMENTS.Delimiter#\#LOCAL.LineDelimiter#]{1})",
    "$1 "
    ) />


  <!---
    Break the CSV value up into raw tokens. Going forward,
    some of these tokens may be merged, but doing it this
    way will help us iterate over them. When splitting the
    string, add a space to each token first to ensure that
    the split works properly.
 
    BE CAREFUL! Splitting a string into an array using the
    Java String::Split method does not create a COLDFUSION
    ARRAY. You cannot alter this array once it has been
    created. It can merely be referenced (read only).
 
    We are splitting the CSV value based on the BOTH the
    field delimiter and the line delimiter. We will handle
    this later as we build values (this is why we created
    the array of delimiters above).
  --->
  <cfset LOCAL.Tokens = ARGUMENTS.CSV.Split(
    "[\#ARGUMENTS.Delimiter#\#LOCAL.LineDelimiter#]{1}"
    ) />


  <!---
    Set up the default records array. This will be a full
    array of arrays, but for now, just create the parent
    array with no indexes.
  --->
  <cfset LOCAL.Rows = ArrayNew( 1 ) />

  <!---
    Create a new active row. Even if we don't end up adding
    any values to this row, it is going to make our lives
    more smiple to have it in existence.
  --->
  <cfset ArrayAppend(
    LOCAL.Rows,
    ArrayNew( 1 )
    ) />

  <!---
    Set up the row index. THis is the row to which we are
    actively adding value.
  --->
  <cfset LOCAL.RowIndex = 1 />


  <!---
    Set the default flag for wether or not we are in the
    middle of building a value across raw tokens.
  --->
  <cfset LOCAL.IsInValue = false />


  <!---
    Loop over the raw tokens to start building values. We
    have no sense of any row delimiters yet. Those will
    have to be checked for as we are building up each value.
  --->
  <cfloop
  index="LOCAL.TokenIndex"
  from="1"
  to="#ArrayLen( LOCAL.Tokens )#"
  step="1">


    <!---
      Get the current field index. This is the current
      index of the array to which we might be appending
      values (for a multi-token value).
    --->
    <cfset LOCAL.FieldIndex = ArrayLen(
      LOCAL.Rows[ LOCAL.RowIndex ]
      ) />

    <!---
      Get the next token. Trim off the first character
      which is the empty string that we added to ensure
      proper splitting.
    --->
    <cfset LOCAL.Token = LOCAL.Tokens[ LOCAL.TokenIndex ].ReplaceFirst(
      "^.{1}",
      ""
      ) />


    <!---
      Check to see if we have a field qualifier. If we do,
      then we might have to build the value across
      multiple fields. If we do not, then the raw tokens
      should line up perfectly with the real tokens.
    --->
    <cfif Len( ARGUMENTS.Qualifier )>


      <!---
        Check to see if we are currently building a
        field value that has been split up among
        different delimiters.
      --->
      <cfif LOCAL.IsInValue>


        <!---
          ASSERT: Since we are in the middle of
          building up a value across tokens, we can
          assume that our parent FOR loop has already
          executed at least once. Therefore, we can
          assume that we have a previous token value
          ALREADY in the row value array and that we
          have access to a previous delimiter (in
          our delimiter array).
        --->

        <!---
          Since we are in the middle of building a
          value, we replace out double qualifiers with
          a constant. We don't care about the first
          qualifier as it can ONLY be an escaped
          qualifier (not a field qualifier).
        --->
        <cfset LOCAL.Token = LOCAL.Token.ReplaceAll(
          "\#ARGUMENTS.Qualifier#{2}",
          "{QUALIFIER}"
          ) />


        <!---
          Add the token to the value we are building.
          While this is not easy to read, add it
          directly to the results array as this will
          allow us to forget about it later. Be sure
          to add the PREVIOUS delimiter since it is
          actually an embedded delimiter character
          (part of the whole field value).
        --->
        <cfset LOCAL.Rows[ LOCAL.RowIndex ][ LOCAL.FieldIndex ] = (
          LOCAL.Rows[ LOCAL.RowIndex ][ LOCAL.FieldIndex ] &
          LOCAL.Delimiters[ LOCAL.TokenIndex - 1 ] &
          LOCAL.Token
          ) />


        <!---
          Now that we have removed the possibly
          escaped qualifiers, let's check to see if
          this field is ending a multi-token
          qualified value (its last character is a
          field qualifier).
        --->
        <cfif (Right( LOCAL.Token, 1 ) EQ ARGUMENTS.Qualifier)>

          <!---
            Wooohoo! We have reached the end of a
            qualified value. We can complete this
            value and move onto the next field.
            Remove the trailing quote.
 
            Remember, we have already added to token
            to the results array so we must now
            manipulate the results array directly.
            Any changes made to LOCAL.Token at this
            point will not affect the results.
          --->
          <cfset LOCAL.Rows[ LOCAL.RowIndex ][ LOCAL.FieldIndex ] = LOCAL.Rows[ LOCAL.RowIndex ][ LOCAL.FieldIndex ].ReplaceFirst( ".{1}$", "" ) />

          <!---
            Set the flag to indicate that we are no
            longer building a field value across
            tokens.
          --->
          <cfset LOCAL.IsInValue = false />

        </cfif>


        <cfelse>


        <!---
          We are NOT in the middle of building a field
          value which means that we have to be careful
          of a few special token cases:
 
          1. The field is qualified on both ends.
          2. The field is qualified on the start end.
        --->

        <!---
          Check to see if the beginning of the field
          is qualified. If that is the case then either
          this field is starting a multi-token value OR
          this field has a completely qualified value.
        --->
        <cfif (Left( LOCAL.Token, 1 ) EQ ARGUMENTS.Qualifier)>


          <!---
            Delete the first character of the token.
            This is the field qualifier and we do
            NOT want to include it in the final value.
          --->
          <cfset LOCAL.Token = LOCAL.Token.ReplaceFirst(
            "^.{1}",
            ""
            ) />

          <!---
            Remove all double qualifiers so that we
            can test to see if the field has a
            closing qualifier.
          --->
          <cfset LOCAL.Token = LOCAL.Token.ReplaceAll(
            "\#ARGUMENTS.Qualifier#{2}",
            "{QUALIFIER}"
            ) />

          <!---
            Check to see if this field is a
            self-closer. If the first character is a
            qualifier (already established) and the
            last character is also a qualifier (what
            we are about to test for), then this
            token is a fully qualified value.
          --->
          <cfif (Right( LOCAL.Token, 1 ) EQ ARGUMENTS.Qualifier)>

            <!---
              This token is fully qualified.
              Remove the end field qualifier and
              append it to the row data.
            --->
            <cfset ArrayAppend(
              LOCAL.Rows[ LOCAL.RowIndex ],
              LOCAL.Token.ReplaceFirst(
                ".{1}$",
                ""
                )
                ) />

                <cfelse>

            <!---
              This token is not fully qualified
              (but the first character was a
              qualifier). We are buildling a value
              up across differen tokens. Set the
              flag for building the value.
            --->
            <cfset LOCAL.IsInValue = true />

            <!--- Add this token to the row. --->
            <cfset ArrayAppend(
              LOCAL.Rows[ LOCAL.RowIndex ],
              LOCAL.Token
              ) />

            </cfif>


            <cfelse>


          <!---
            We are not dealing with a qualified
            field (even though we are using field
            qualifiers). Just add this token value
            as the next value in the row.
          --->
          <cfset ArrayAppend(
            LOCAL.Rows[ LOCAL.RowIndex ],
            LOCAL.Token
            ) />


          </cfif>


        </cfif>


      <!---
        As a sort of catch-all, let's remove that
        {QUALIFIER} constant that we may have thrown
        into a field value. Do NOT use the FieldIndex
        value as this might be a corrupt value at
        this point in the token iteration.
      --->
      <cfset LOCAL.Rows[ LOCAL.RowIndex ][ ArrayLen( LOCAL.Rows[ LOCAL.RowIndex ] ) ] = Replace(
        LOCAL.Rows[ LOCAL.RowIndex ][ ArrayLen( LOCAL.Rows[ LOCAL.RowIndex ] ) ],
        "{QUALIFIER}",
        ARGUMENTS.Qualifier,
        "ALL"
        ) />


        <cfelse>


      <!---
        Since we don't have a qualifier, just use the
        current raw token as the actual value. We are
        NOT going to have to worry about building values
        across tokens.
      --->
      <cfset ArrayAppend(
        LOCAL.Rows[ LOCAL.RowIndex ],
        LOCAL.Token
        ) />


      </cfif>



    <!---
      Check to see if we have a next delimiter and if we
      do, is it going to start a new row? Be cautious that
      we are NOT in the middle of building a value. If we
      are building a value then the line delimiter is an
      embedded value and should not percipitate a new row.
    --->
    <cfif (
      (NOT LOCAL.IsInValue) AND
      (LOCAL.TokenIndex LT ArrayLen( LOCAL.Tokens )) AND
      (LOCAL.Delimiters[ LOCAL.TokenIndex ] EQ LOCAL.LineDelimiter)
      )>

      <!---
        The next token is indicating that we are about
        start a new row. Add a new array to the parent
        and increment the row counter.
      --->
      <cfset ArrayAppend(
        LOCAL.Rows,
        ArrayNew( 1 )
        ) />

        <!--- Increment row index to point to next row. --->
        <cfset LOCAL.RowIndex = (LOCAL.RowIndex + 1) />

      </cfif>

    </cfloop>


  <!---
    ASSERT: At this point, we have parsed the CSV into an
    array of arrays (LOCAL.Rows). Now, we can take that
    array of arrays and convert it into a query.
  --->


  <!---
    To create a query that fits this array of arrays, we
    need to figure out the max length for each row as
    well as the number of records.
 
    The number of records is easy - it's the length of the
    array. The max field count per row is not that easy. We
    will have to iterate over each row to find the max.
 
    However, this works to our advantage as we can use that
    array iteration as an opportunity to build up a single
    array of empty string that we will use to pre-populate
    the query.
  --->

  <!--- Set the initial max field count. --->
  <cfset LOCAL.MaxFieldCount = 0 />

  <!---
    Set up the array of empty values. As we iterate over
    the rows, we are going to add an empty value to this
    for each record (not field) that we find.
  --->
  <cfset LOCAL.EmptyArray = ArrayNew( 1 ) />


  <!--- Loop over the records array. --->
  <cfloop
  index="LOCAL.RowIndex"
  from="1"
  to="#ArrayLen( LOCAL.Rows )#"
  step="1">

  <!--- Get the max rows encountered so far. --->
  <cfset LOCAL.MaxFieldCount = Max(
    LOCAL.MaxFieldCount,
    ArrayLen(
      LOCAL.Rows[ LOCAL.RowIndex ]
      )
      ) />

      <!--- Add an empty value to the empty array. --->
      <cfset ArrayAppend(
        LOCAL.EmptyArray,
        ""
        ) />

      </cfloop>


  <!---
    ASSERT: At this point, LOCAL.MaxFieldCount should hold
    the number of fields in the widest row. Additionally,
    the LOCAL.EmptyArray should have the same number of
    indexes as the row array - each index containing an
    empty string.
  --->


  <!---
    Now, let's pre-populate the query with empty strings. We
    are going to create the query as all VARCHAR data
    fields, starting off with blank. Then we will override
    these values shortly.
  --->
  <cfset LOCAL.Query = QueryNew( "" ) />

  <!---
    Loop over the max number of fields and create a column
    for each records.
  --->
  <cfloop
  index="LOCAL.FieldIndex"
  from="1"
  to="#LOCAL.MaxFieldCount#"
  step="1">

    <!---
      Add a new query column. By using QueryAddColumn()
      rather than QueryAddRow() we are able to leverage
      ColdFusion's ability to add row values in bulk
      based on an array of values. Since we are going to
      pre-populate the query with empty values, we can
      just send in the EmptyArray we built previously.
    --->
    <cfset QueryAddColumn(
      LOCAL.Query,
      "COLUMN_#LOCAL.FieldIndex#",
      "CF_SQL_VARCHAR",
      LOCAL.EmptyArray
      ) />

    </cfloop>


  <!---
    ASSERT: At this point, our return query LOCAL.Query
    contains enough columns and rows to handle all the
    data that we have stored in our array of arrays.
  --->


  <!---
    Loop over the array to populate the query with
    actual data. We are going to have to loop over
    each row and then each field.
  --->
  <cfloop
  index="LOCAL.RowIndex"
  from="1"
  to="#ArrayLen( LOCAL.Rows )#"
  step="1">

  <!--- Loop over the fields in this record. --->
  <cfloop
  index="LOCAL.FieldIndex"
  from="1"
  to="#ArrayLen( LOCAL.Rows[ LOCAL.RowIndex ] )#"
  step="1">

      <!---
        Update the query cell. Remember to cast string
        to make sure that the underlying Java data
        works properly.
      --->
      <cfset LOCAL.Query[ "COLUMN_#LOCAL.FieldIndex#" ][ LOCAL.RowIndex ] = JavaCast(
        "string",
        LOCAL.Rows[ LOCAL.RowIndex ][ LOCAL.FieldIndex ]
        ) />

      </cfloop>

    </cfloop>


  <!---
    Our query has been successfully populated.
    Now, return it.
  --->
  <cfreturn LOCAL.Query />

</cffunction>



<cffunction
name="QueryChangeColumnName"
access="public"
output="false"
returntype="query"
hint="Changes the column name of the given query.">

<!--- Define arguments. --->
<cfargument
name="Query"
type="query"
required="true"
/>

<cfargument
name="ColumnName"
type="string"
required="true"
/>

<cfargument
name="NewColumnName"
type="string"
required="true"
/>

<cfscript>

  // Define the local scope.
  var LOCAL = StructNew();

  // Get the list of column names. We have to get this
  // from the query itself as the "ColdFusion" query
  // may have had an updated column list.
  LOCAL.Columns = ARGUMENTS.Query.GetColumnNames();

  // Convert to a list so we can find the column name.
  // This version of the array does not have indexOf
  // type functionality we can use.
  LOCAL.ColumnList = ArrayToList(
    LOCAL.Columns
    );

  // Get the index of the column name.
  LOCAL.ColumnIndex = ListFindNoCase(
    LOCAL.ColumnList,
    ARGUMENTS.ColumnName
    );

  // Make sure we have found a column.
  if (LOCAL.ColumnIndex){

    // Update the column name. We have to create
    // our own array based on the list since we
    // cannot directly update the array passed
    // back from the query object.
    LOCAL.Columns = ListToArray(
      LOCAL.ColumnList
      );

    LOCAL.Columns[ LOCAL.ColumnIndex ] = ARGUMENTS.NewColumnName;

    // Set the column names.
    ARGUMENTS.Query.SetColumnNames(
      LOCAL.Columns
      );

  }

  // Return the query reference.
  return( ARGUMENTS.Query );

</cfscript>
</cffunction>


<!---
  Build the CSV string value. This value should contain
  both functional and character-literal delimiters.
--->
<cfoutput>  #form.ecoDataFile# </cfoutput>
<!--- define temp filelocation --->
<cfset strDir=GetDirectoryFromPath(ExpandPath("*.*")) & "archive">
  <cfset strInExcel=strDir>

    <!--- upload file --->
    <cffile action="Upload"
    filefield="ecoDataFile"
    destination="#strInExcel#"
    nameconflict="Overwrite" >
    <cfset upFileDir=file.ServerDirectory>
      <cfset upNSFile=file.ServerFile>
        <cfset prodThumbExt=file.serverfileext>
          <cfif (prodThumbExt neq "xlsx")>
            Please Correct 
            .xlsx file only
            <cfabort>1
            </cfif>



            <cffile action="read"
            file="#upFileDir#/#upNSFile#"
            variable="strCSV">



<!--- NEW EXCEL READ --->
<cfspreadsheet action="read" src="#upFileDir#/#upNSFile#" query="ecoxlsxData" excludeHeaderRow = "true">
  <!--- NEW EXCEL READ --->

<!--- NEW EXCEL READ --->
<cfspreadsheet action="read" src="#upFileDir#/#upNSFile#" query="ecoxlsxDataextract"   excludeHeaderRow = "true">
  <!--- NEW EXCEL READ --->




  <!---Setting up New Column Names  I'm  unsure about the "VarChar, I input the sql tag to try to help with date upload ---->

<!---   <cfset QueryChangeColumnName(ecoxlsquery,"col_1","SKU" )/> --->


<!--- Add Date Recieved Column --->



<!--- Add Container No. Column  --->

          

            <!----CODE 3  ---->


<!---
  Send the CSV value to the UDF. Be sure to trim the value
  (leading and trailing spaces). We are going to leave the
  default delimiter (,) and qualifier (").
--->
<cfset session.qResult = CSVToQuery(
  CSV = strCSV.Trim()
  ) />

<!---TEST Dump out the resultant query. 

<cfdump
  var="#session.qResult#"
  label="CSV Results Query"
  />
    
  <br />--->


  <!---END BEN's CODE  ---->
  <!---END BEN's CODE  ---->
  <!---END BEN's CODE  ---->
  <!---END BEN's CODE  ---->




  <!---Setting up New Column Names  I'm  unsure about the "VarChar, I input the sql tag to try to help with date upload ---->

  <cfset QueryChangeColumnName(session.qResult,"COLUMN_1","Class", "VarChar")/>
  <cfset QueryChangeColumnName(session.qResult,"COLUMN_4","Score" )/>
  <cfset QueryChangeColumnName(session.qResult,"COLUMN_6", "Competitor")/>



  <!--- Sets Up New Column with Event Name and  Places it into  All columns by record count of query---->
  <!--- Here we output line 10 with a max 1 row result of the query which happens to be the line that will have the event as long as wayne doesnt' change his information---->

  <cfoutput query = "session.qResult"  maxRows = "1"  startRow = "10"> 
    <!---Set evtcolumnname to value in column Class, max row 1 starting at 10--->
    <cfset evtcolumnname= #Class# />
<!---TEST
<br />
#Class#    
--->
</cfoutput>

<cfoutput query = "session.qResult"  maxRows = "1"  startRow = "11"> 
  <!---Set newspldate to value in column Class, max row 1 starting at 11--->
  <cfset newspldate= #Class# />
<!---TESTCODE

BEFORE CHANGE
<cfdump
  var="#session.qResult#"
  label="CSV Results Query"
  />
  ---->

</cfoutput>


<cfoutput> #session.nsplSkip_SECTION#</cfoutput>




<!--- Sets Up New Column with Event Name and  Places it into  All columns by record count of query---->
<!--- Here we output line 10 with a max 1 row result of the query which happens to be the line that will have the event as long as wayne doesnt' change his information---->

<cfoutput query = "session.qResult"  maxRows = "1"  startRow = "10"> 
  <!---Set evtcolumnname to value in column Class, max row 1 starting at 10--->
  <cfset evtcolumnname= #Class# />
<!---TEST
<br />
#Class#    
--->
</cfoutput>

<cfoutput query = "session.qResult"  maxRows = "1"  startRow = "11"> 
  <!---Set newspldate to value in column Class, max row 1 starting at 11--->
  <cfset newspldate= #Class# />
<!---TEST
<br />
#newspldate#
<br />----->
</cfoutput>





<!--- Create Array  --->
<cfset EventArray = ArrayNew(1)>
  <!---Initially set at size one, we switch and make it size of record count --->
  <cfset temp = ArrayResize(EventArray, session.qResult.RecordCount)>

    <!----Loop over RecordCount and assign new value "newcol1"   --->
    <cfloop  from="1" to="#session.qResult.RecordCount#" index="i" >
      <cfset EventArray[i] = "#evtcolumnname#">
      </cfloop>
      <!----Add the New Column with values of varchar, coming from EventArray   --->
      <cfset queryAddColumn(session.qResult, "Event", "VarChar", EventArray) />



      <!---_Repeting last code for date ---->
      <!--- Date Array  --->
      <cfset DateArray = ArrayNew(1)>
        <!---Initially set at size one, we switch and make it size of record count --->
        <cfset temp = ArrayResize(DateArray, session.qResult.RecordCount)>

          <!----Loop over RecordCount and assign new value "newcol1"   --->
          <cfloop  from="1" to="#session.qResult.RecordCount#" index="i" >
            <cfset dateArray[i] = "#newspldate#">
            </cfloop>
            <!----Add the New Column with values of varchar, coming from DateArray   --->
            <cfset queryAddColumn(session.qResult, "Date1", "Date", DateArray) />

<!----Test
 
   Changed Query
    
    
    <br />
  Final
  <br/>
  
  ---->
  
  <!----Removes first 8 rows of data which is Title and column headers, and then deletes rows with no entry   --->
  <cfset session.qResult.RemoveRows(0,8)>
    <cfloop query="session.qResult" >
      <!----Removes lines which are blank.. then stops if removal is beyond recordcount   --->
      <cfif #session.qResult.Score# is "">
        <cfif #session.qResult.CurrentRow# lte (#session.qResult.RecordCount#-2)>
          <cfset session.qResult.RemoveRows((#session.qResult.CurrentRow#)-1,1)>  
            <!---Test  <cfoutput> #session.qResult.Class#</cfoutput>   ---->
          </cfif>
        </cfif>
      </cfloop>


      <!----This result finds the last row and removes the data   --->
      <cfloop query="session.qResult" >
        <cfif #session.qResult.Class# is  "EOF">
          <cfset session.qResult.RemoveRows((#session.qResult.CurrentRow#-1),2)>
          </cfif>
        </cfloop>
        <!----End This result finds the last row and removes the data   --->
        <!----End This result finds the last row and removes the data   --->


        <cfform format="html" action="index.cfm">
          <cfselect type = "Text" name = "nsplEVPoints">
            <option value="Single">Single</option>
            <option value="nDouble">Double</option>
            <option value="Triple">Triple</option>
          </cfselect>
          <cfinput type = "submit" name = "nsplSubmit2" value = "Select">

          </cfform> 
          -
 <!---       DUMP1 <cfdump
  var="#session.qResult#"
  label="CSV Results Query"
  /> --->
 <cfset ecoxlsquery.RemoveRows(0,8)>
  <cftable query = "ecoxlsquery"  colheaders="yes" htmlTable="true" 
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
  text= "#ecoxlsquery.col_1#"> 

  <cfcol header = "Description" 
  align = "Left" 
  width = 15 
  text= "#ecoxlsquery.col_2#"> 
  <cfcol header = "Quantity" 
  align = "Left" 
  width = 5
  text= "#ecoxlsquery.col_3#">

</cftable> 
<h1 style="color:blue;margin-bottom:30px;"></h1>

</cfif>
<!-----------------------------------------------END SECTION 2  ------------------------->
<!-----------------------------------------------END SECTION 2  ------------------------->
<!-----------------------------------------------END SECTION 2  ------------------------->
<!-----------------------------------------------END SECTION 2  ------------------------->

<!-----------------------------------------------START SECTION 3------------------------->
<!-----------------------------------------------START SECTION 3------------------------->
<!-----------------------------------------------START SECTION 3------------------------->
<!-----------------------------------------------START SECTION 3------------------------->
<cfif session.nsplSkip_SECTION eq 3>



 <cfif isDefined("session.qResult.single")>
   <cfset StructDelete(Session, "nsplSkip_SECTION")>
     <cfabort>
       <cfelseif isDefined("session.qResult.nDouble")>
        <cfset StructDelete(Session, "nsplSkip_SECTION")>
         <cfabort>
           <cfelseif isDefined("session.qResult.triple")>
            <cfset StructDelete(Session, "nsplSkip_SECTION")>
              <cfabort>
              </cfif>


              <cfoutput>

                <!--- Your in #Section# --->
                ---


                <!---_Adding in Array for Points---->
                <!--- Point Event Type Array  --->
                <cfset PtEvnTypArray = ArrayNew(1)>
                  <!---Initially set at size one, we switch and make it size of record count --->
                  <cfset temp = ArrayResize(PtEvnTypArray, session.qResult.RecordCount)>


                    <cfif Not isDefined("placen")>
                      <cfset placen = "1">
                      </cfif>
                      <!----Loop over RecordCount    --->

                      <cfloop  from="1" to="#session.qResult.RecordCount#" index="i" >
                       <!----Find Like Classes from previous Class   --->
                       <cfif #session.qResult.Class[i]# is  "#session.qResult.Class[i-1]#">
                        <!----Then set numer +1  --->
                        <cfset PtEvnTypArray[i] =  "#placen+1#">
                          <!---TESTCODE <cfoutput> What is this #session.qResult.Class[i]# #placen+1#</cfoutput>   --->
                          <cfset placen =  "#placen+1#">
                            <cfelse>
                              <cfset placen =  "1">
                                <cfset PtEvnTypArray[i] =  #placen#>
                                </cfif>
                                <!----Add the New Column with values of varchar, coming from PtEvnTypArray   --->


                                <!----Trying to input a number counting the ---->

                              </cfloop>
                              <cfset queryAddColumn(session.qResult, "#FORM.nsplEVPoints#", PtEvnTypArray) />


                              <!---Duplicates Query... and ben says it's 0ms fast!---->
                              <cfset nsplQuery = duplicate(session.qresult)>
                                <!---Duplicates Query... and ben says it's 0ms fast!---->

                                <!---UPDATED WITH EVENT POINT TYPE DUMP--->
                                <!--- <cfdump var="#session.qResult#" label="CSV Results Query"/> --->
                                <!---UPDATED WITH EVENT POINT TYPE DUMP---> 

                                <cftable query = "nsplQuery"  colheaders="yes" htmlTable="true" 
                                startRow = "1" colSpacing = "3" > 
<!--- Each cfcol tag sets width of a column in table, and specifies header 
  information and text/CFML with which to fill cell. ---> 
  <cfcol header = "Name" 
  align = "Left" 
  width = 6 
  text= "#nsplQuery.Competitor#"> 

  <cfcol header = "Class"     
  align = "Left" 
  width = 6 
  text= "#nsplQuery.Class#"> 


  <cfcol header = "Score" 
  align = "Left" 
  width = 4 
  text= "#nsplQuery.Score# D.B."> 

  <cfif isDefined ('nsplQuery.Single')> <cfcol header = "Place" align = "Left" width = 2 text= "#nsplQuery.SINGLE#"> </cfif>
  <cfif isDefined ('nsplQuery.nDouble')> <cfcol header = "Place" align = "Left" width = 2 text= "#nsplQuery.nDouble#"></cfif>
  <cfif isDefined ('nsplQuery.Triple')> <cfcol header = "Place" align = "Left" width = 2 text= "#nsplQuery.Triple#"> </cfif>        


  <cfcol header = "Date" 
  align = "Left" 
  width = 5
  text= "#nsplQuery.Date1#">
  <cfcol header = "Event" 
  align = "Left" 
  width = 8
  text= "#nsplQuery.Event#">  
</cftable> 


<cfform format="html" action="index.cfm">


  <cfinput type = "submit" name = "nsplSubmit3" value = "Upload">
  </cfform> 
  <h1 style="color:blue;margin-bottom:30px;"></h1>
</cfoutput>
</cfif>
<!-----------------------------------------------END SECTION 3------------------------->
<!-----------------------------------------------END SECTION 3------------------------->
<!-----------------------------------------------END SECTION 3------------------------->
<!-----------------------------------------------END SECTION 3------------------------->

<!-----------------------------------------------START SECTION 4------------------------->
<!-----------------------------------------------START SECTION 4------------------------->
<!-----------------------------------------------START SECTION 4------------------------->
<!-----------------------------------------------START SECTION 4------------------------->

<cfif session.nsplSkip_SECTION eq 4>
  <cfoutput>
   <!---    Your in  --->
   <!---#Section# RESULTS UPLOADED--->
   <cfparam name="nsplQuery" default="">

     <!---Duplicates Query... and ben says it's 0ms fast!---->
     <cfset nsplQuery = duplicate(session.qresult)>
      <!---Duplicates Query... and ben says it's 0ms fast!---->
      
      <!---TESTCODE   <cfdump var="#session.qresult#" label="qResult"/>  ---->
    </cfoutput>

    <cfquery name="cleanNData" dbtype="query">
      SELECT Class, EVENT, Competitor

      ,(CAST(nsplQuery.Date1 as DATE)) AS Date2
      ,(CAST(nsplQuery.Score as DECIMAL)) AS Score2
      
      <!----Set class point system  --->
      <cfif isDefined ('nsplQuery.Single')>  ,SINGLE  </cfif>
      <cfif isDefined ('nsplQuery.nDouble')>  ,nDouble   </cfif>
      <cfif isDefined ('nsplQuery.Triple')>  ,Triple  </cfif>        
      From nsplQuery

    </cfquery> 
    <!--- Select Class, Score, Event, Competitor, Date1--->
    <!--Final Dump of data--->
    <!---  <cfdump var="#cleanNData#" label="CSV Results Query"/> --->
    
    <!--Final Dump of data--->

    <cftable query = "cleanNData"  colheaders="yes" htmlTable="true" 
    startRow = "1" colSpacing = "3" > 
<!--- Each cfcol tag sets width of a column in table, and specifies header 
  information and text/CFML with which to fill cell. ---> 
  <cfcol header = "Name" 
  align = "Left" 
  width = 6 
  text= "#cleanNData.Competitor#"> 

  <cfcol header = "Class"     
  align = "Left" 
  width = 6 
  text= "#cleanNData.Class#"> 


  <cfcol header = "Score" 
  align = "Left" 
  width = 4 
  text= "#cleanNData.Score2# D.B."> 

  <cfif isDefined ('cleanNData.Single')> <cfcol header = "Place" align = "Left" width = 2 text= "#cleanNData.SINGLE#"> </cfif>
  <cfif isDefined ('cleanNData.nDouble')> <cfcol header = "Place" align = "Left" width = 2 text= "#cleanNData.nDouble#"></cfif>
  <cfif isDefined ('cleanNData.Triple')> <cfcol header = "Place" align = "Left" width = 2 text= "#cleanNData.Triple#"> </cfif>        


  <cfcol header = "Date" 
  align = "Left" 
  width = 5
  text= "#cleanNData.Date2#">
  <cfcol header = "Event" 
  align = "Left" 
  width = 8
  text= "#cleanNData.Event#">  
</cftable> 

<h1 style="color:blue;margin-bottom:30px;"></h1>

<cftry>
  <!--- attempt to catch any errors--->
  <cfloop query="cleanNData">
    <cfquery datasource="db9" name="insertData">
      INSERT INTO ndataall (nClass, nCompetitor, nDate, nScore, nEvent
        <cfif isDefined ("cleanNData.Triple")>, nTriple 
          <cfelseif isDefined ("cleanNData.nDouble")>, nDouble 
            <cfelseif isDefined ("cleanNData.Single")>, nSingle </cfif>
              )
      VALUES('#cleanNData.Class#','#cleanNData.Competitor#',  <cfqueryparam value = "#cleanNData.DATE2#" cfsqltype="CF_SQL_DATE"/>,  '#cleanNData.Score2#','#cleanNData.Event#'
        <cfif isDefined ("cleanNData.Triple")> , '#cleanNData.Triple#' 
          <cfelseif isDefined ("cleanNData.nDouble")> , '#cleanNData.nDouble#' 
            <cfelseif isDefined ("cleanNData.Single")> , '#cleanNData.Single#' </cfif>
              )
            </cfquery>
          </cfloop>

          <!--- attempt to catch any errors continued--->
          <cfcatch type="any">
            <cfoutput>
              <h3>You've Thrown a #cfcatch.Type# Upload <b>Error</b></h3> <br>
              Message : #cfcatch.Message#<br>
              Detail : #cfcatch.Detail#<br>
              Please contact website admin if problem persist
            </cfoutput>
          </cfcatch>
        </cftry>

        <h1 style="color:blue;margin-bottom:30px;"></h1>

      </cfif>

      <!-----------------------------------------------END   SECTION 4------------------------->
      <!-----------------------------------------------END   SECTION 4------------------------->
      <!-----------------------------------------------END   SECTION 4------------------------->
      <!-----------------------------------------------END   SECTION 4------------------------->
    </section>
    <!--==============================aside=================================-->




    <!--- END UPLOAD PAGE --->


  </div>
</div>
</div>

</div>
</section>
</section>
<!--- *********************** _DebugScript ***********************--->
<cfinclude template="/includes/_debug.cfm">