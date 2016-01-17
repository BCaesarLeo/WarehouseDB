 <cfinvoke component="cfc.inventory.orders" method="getOrderInfo" returnvariable="exupl">
 <cfinvoke component="cfc.inventory.orders" method="getOrderInfo" returnvariable="exupl">
<cfoutput>


<!--- *********************** _coreJavaScript ***********************--->
<cfinclude template="/includes/chunks/_coreJavaScript.cfm">
<script src="/js/jquery-barcode.js"></script>
<script>
$( document ).ready(function() {
    console.log( "ready!" );

    jQuery(function($) {
        // lookup object so I can pass data from the target barcode div to render the right kind of barcode easily..
        var barcodeTypes = {
            'location' : 'code39',
            'order' : 'code93',
            'sku' : 'code128'
        };

        $("div.barcodeDsp").each(function(){
            var el = $(this)
                ,barcodeVal = el.data('barcodeval')
                ,type = el.data('barcodetype')
            ;
            //build the bardcode based on the data that was placed on the barcode display div..
            el.barcode( ""+barcodeVal+"", ""+barcodeTypes[ type ]+"", {barWidth:2, barHeight:50});
        });

        //fetch the content after the LOOP above creates the HTML..
        var theContent = $("##theOrder").html();

        //set the literal html into the content textarea of the hidden form... then submit it..
        // $("##content").val( theContent );
        // $("##downloadOrderForm").submit();
         console.log("hit bottom of this");

    });
});
</script>
<!--- *********************** THIS PAGE'S INCLUDE FILE --- this is where your main logic goes for this page ***********************--->
<section>
    <div id="theOrder">
        
    <!--- value and TYPE are placed on the div itself and so basically on every page load anything with the class of barcodeDsp will have the value and type parsed and a barcode will be created.. --->
    <section>
       
    <h2>Pick Sheet</h2>
    <div  style="float:left;">

        #exupl.Name# <br>
        #exupl.Address1#<br>
        #exupl.Address2#<br>
        #exupl.city# , #exupl.state# #exupl.OZip#<br>
#exupl.email#  #exupl.phone# 
<br>
 #exupl.comments#<br>
 #exupl.shipmethod#

    </div>
        <div style="float:left;">
    <h4>Order #exupl.OrderNo#</h4>
 <div class="barcodeDsp" data-barcodeval="#exupl.OrderNo#" data-barcodetype="order"></div>
    </div>

    </section>
   
    <div style="clear:both">
      <hr>
    <cfloop query="exupl">
       <div style="float:left;"> 
     <h4>Quantity #exupl.Qty# - #exupl.SKU# - #exupl.Description#</h4>
    <div class="barcodeDsp" data-barcodeval="#exupl.SKU#" data-barcodetype="sku"></div>
    </div>
    
    <div style="padding:0px 0px 0px 20px;">
      <h4> FIFO LOCATION #exupl.eLocID#</h4>
       <div class="barcodeDsp" data-barcodeval="#exupl.eLocID#" data-barcodetype="location"></div>
       <hr>
</cfloop>

    
    </div>

    </section>
<section>
    <div>
<form id="downloadOrderForm" name="downloadOrderForm" action="_downloadPrint.cfm" method="post" target="_blank" style="display:none;">
    <input name="orderID" type="hidden" value="12345" />
    <input id="content" name="content" type="hidden" value="" />

</form>
    </div>
    </section>

<!--- *********************** THIS PAGE's specific javascript such as (datatables, flot, etc..) ***********************--->




<!--- *********************** _footer ***********************--->
<cfinclude template="/includes/chunks/_footer.cfm">

</cfoutput>