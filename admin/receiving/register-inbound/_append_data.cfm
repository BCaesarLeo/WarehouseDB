<section id="main-content">
  <section class="wrapper">
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">Shipment Manifest Upload- Step 3 </h3>
          </div>
          <div class="panel-body">

    
<cftry>
  <script>
$("#demox").barcode(
"1234567890128", // Value barcode (dependent on the type of barcode)
"ean13" // type (string)
);     
  </script>

  <script>
  <script type="text/javascript">
    
      function generateBarcode(){
        var value = $("#barcodeValue").val();
        var btype = $("input[name=btype]:checked").val();
        var renderer = $("input[name=renderer]:checked").val();
        
    var quietZone = false;
        if ($("#quietzone").is(':checked') || $("#quietzone").attr('checked')){
          quietZone = true;
        }
    
        var settings = {
          output:renderer,
          bgColor: $("#bgColor").val(),
          color: $("#color").val(),
          barWidth: $("#barWidth").val(),
          barHeight: $("#barHeight").val(),
          moduleSize: $("#moduleSize").val(),
          posX: $("#posX").val(),
          posY: $("#posY").val(),
          addQuietZone: $("#quietZoneSize").val()
        };
        if ($("#rectangular").is(':checked') || $("#rectangular").attr('checked')){
          value = {code:value, rect: true};
        }
        if (renderer == 'canvas'){
          clearCanvas();
          $("#barcodeTarget").hide();
          $("#canvasTarget").show().barcode(value, btype, settings);
        } else {
          $("#canvasTarget").hide();
          $("#barcodeTarget").html("").show().barcode(value, btype, settings);
        }
      }
          
      function showConfig1D(){
        $('.config .barcode1D').show();
        $('.config .barcode2D').hide();
      }
      
      function showConfig2D(){
        $('.config .barcode1D').hide();
        $('.config .barcode2D').show();
      }
      
      function clearCanvas(){
        var canvas = $('#canvasTarget').get(0);
        var ctx = canvas.getContext('2d');
        ctx.lineWidth = 1;
        ctx.lineCap = 'butt';
        ctx.fillStyle = '#FFFFFF';
        ctx.strokeStyle  = '#000000';
        ctx.clearRect (0, 0, canvas.width, canvas.height);
        ctx.strokeRect (0, 0, canvas.width, canvas.height);
      }
      
      $(function(){
        $('input[name=btype]').click(function(){
          if ($(this).attr('id') == 'datamatrix') showConfig2D(); else showConfig1D();
        });
        $('input[name=renderer]').click(function(){
          if ($(this).attr('id') == 'canvas') $('#miscCanvas').show(); else $('#miscCanvas').hide();
        });
        generateBarcode();
      });
  
    </script>
  </script>
  <!--- attempt to catch any errors--->
  <cfloop query="session.ecoflexspreadsheetupload">
    <cfquery datasource="db10" name="insertData">
      INSERT INTO Inbound_D8TA (SKU, Description, Quantity, ContainerNo, ContainerRegDate   )
      VALUES('#session.ecoflexspreadsheetupload.Col_1#','#session.ecoflexspreadsheetupload.Col_2#', '#session.ecoflexspreadsheetupload.Col_3#','#session.ecoflexspreadsheetupload.CONTAINERNO#', <cfqueryparam value = "#session.ecoflexspreadsheetupload.CONTAINERREGDATE#" cfsqltype="CF_SQL_DATE"/>
     
              )
            </cfquery>
          </cfloop>

          <!--- attempt to catch any errors continued--->
          <cfcatch type="any">
            <cfoutput>
              <h3>You've Thrown an #cfcatch.Type# <b>Error</b></h3> <br>
              Message : #cfcatch.Message#<br>
              Detail : #cfcatch.Detail#<br>
              Please contact website admin if problem persist
            </cfoutput>
            <cfabort>
          </cfcatch>
        </cftry>
       <h1 class="color-terques"> Successful Upload - Container <cfoutput>#session.ecoflexspreadsheetupload.ContainerNo[1]#</cfoutput> </h1>
       <div class="panel">
<div id="demox"></div>
       </div>
        <div class="panel-body">
                        <table class="table  table-hover general-table">
                            <thead>
                            <tr>
                                <th>SKU</th>
                                <th class="hidden-phone">Description</th>
                                <th>Quantity</th>
                              
                            </tr>
                            </thead>
                            <tbody>
                           

<cfloop query ="session.ecoflexspreadsheetupload">
  <cfoutput>

                            <tr>
                                <td><a href="">#session.ecoflexspreadsheetupload.Col_1# </a></td>
                                <td class="hidden-phone">#session.ecoflexspreadsheetupload.Col_2#</td>
                                <td><span class="label label-info label-mini">#session.ecoflexspreadsheetupload.Col_3#</span></td>
                              
                                
                           </tr>
                           </cfoutput>

</cfloop>
  
                          

                            </tbody>
                        </table>
                    </div>
        <!--- *************************************** --->
  </div></div></div></section>
</section>
<cfset exists= structdelete(session, 'ecoflexspreadsheetupload', true)/>
<!--- <cfinclude template="/includes/_debug.cfm"> --->
