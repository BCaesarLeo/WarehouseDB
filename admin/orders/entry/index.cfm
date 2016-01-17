<cfoutput>




<!--- *********************** _header ***********************--->
<cfinclude template="/includes/chunks/_header.cfm">

		
<!--- *********************** _header ARGUMENTS ***********************--->
<!--- Only working if I remove outside Whassup with that? --->
<link href="/css/jquery.steps.css" rel="stylesheet" type="text/css" >

<cfsavecontent variable="extraCSS">
	<!--- Not working --->
<!--- <link href="/css/jquery.steps.css" rel="stylesheet" type="text/css" > --->
</cfsavecontent>
<!--- *********************** _mainMenu ***********************--->
<cfset activeNav = 'order-entry'> <!-- set the activeNav variable here before the include so the menu will have the proper thing selected -->
<cfinclude template="/includes/chunks/_mainMenu.cfm">


<!--- *********************** THIS PAGE'S INCLUDE FILE --- this is where your main logic goes for this page ***********************--->
<cfinclude template="/includes/admin/orders/_orderEntry.cfm">


<!--- *********************** _coreJavaScript ***********************--->
<cfinclude template="/includes/chunks/_coreJavaScript.cfm">

<!--- *********************** THIS PAGE's specific javascript such as (datatables, flot, etc..) ***********************--->
<cfsavecontent variable="extraJS">
	<!--Barcode Generator JS--->
<script type="text/javascript" src="/js/jquery-barcode.js"></script>
<!--- Lodash  --->
<script type="text/javascript" src="/js/lodash.js"></script>

<script class="include" type="text/javascript" src="/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="/js/jquery.scrollTo.min.js"></script>>
<script src="/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
<script src="/js/jquery.nicescroll.js"></script>
<script src="/js/jquery-steps/jquery.steps.js"></script>

<script>
	$(document).ready(function(){
		//case sensitive.. by logging i could tell this function wasn't getting called.
		//log this
		//console.log($('##fName'));
		//vs this
		//console.log($('##fname'));
 		$('##fName').keyup(function () {
 			var el = $(this);
 			//console.log( el.val() );
  			$('##displayfName').text(el.val());
  			
		});

		/*
        $('##fOrder').keyup(function () {
            var el = $(this);
 			console.log( el.val() );
  			$('##displayfOrder').text(el.val());
  			
		});
        */

		$('##fPhone').keyup(function () {
 			var el = $(this);
 			//console.log( el.val() );
  			$('##displayfPhone').text(el.val());
  			
		});
			$('##fEmail').keyup(function () {
 			var el = $(this);
 			//console.log( el.val() );
  			$('##displayfEmail').text(el.val());
  			
		});
			

	
        // Zipcode finder 
        $('##fZip').keyup(function(e){
        	var zipCode = $(this).val();

        	if (zipCode.length === 5 && $.isNumeric(zipCode)) {
        		var requestURL = 'http://ziptasticapi.com/' + zipCode + '?callback=?';
        		$.getJSON(requestURL, null, function(data){
        			console.log(data);

        			if (data.city) $('##fCity').val(data.city);
        				if (data.state) $('##fState').val(data.state);
        		});
        	}
        });

        // Barcode generator
        $('##fOrder').keyup(function(e) {
        	var bCodeNo = $(this).val();

            $("##bcTarget").barcode(bCodeNo, "code128",{barWidth:2, barHeight:60}); 
            var el = $(this);

            $('##displayfOrder').text(el.val());

        });

        //define AUTO COMPLETE as a variable so it can be reused for existing and newly created items
        var autoCompleteDefinitionObj = { 
            source: function(query, response) {
                //console.log(query);
                //console.log(response);
                $.ajax({
                    url: '/cfc/inventory/inventoryService.cfc?method=getInnbound&returnFormat=JSON',
                    dataType: "json",
                    data: {
                        searchPhrase: query.term
                    },
                    success: function(getInquArray) {
                        response(getInquArray);
                        //console.log('autocomplete success');
                        //console.log(getInquArray);
                    }
                });
            },
             // minLength: 2, //Sets a minimum length of input
             //Attempting to set field values and 
            select: function(event, ui) {
                event.preventDefault();

                
                // this represents the SKU so we go find a refrence to the current row so we can traverse back down
                var orderRow = $(this).closest('tr.orderRow');

                //since we know THIS is the one we want we can just put the value into the field no big deal
                $(this).val(ui.item.label);
                //orderRow.find('input[name=SKU]').val( ui.item.label );
                // the long description is in the value not label so we use ui.item.value vs ui.item.label
                orderRow.find('input[name=BriefDesc]').val( ui.item.value );

                // $('.form-control.input-lg.m-bot11').next(".form-control.input-lg.m-bot11").val(ui.item.label);
                // $(x.Event.target).previous().html("FOO")
                //console.log(event);
                //console.log(ui);
                //console.log(this);
                //this should take care of what needs to happen when you actually click 
            }
        };

        //Add Custom Row to Table
        // Call when AddButton Clicked
    	$(".addCF").click(function(){
    		// add lodash autoincrementing value
    		var rownum = $('##customFields tr.orderRow').length + 1;
        	// →  This would be add incrementing rownum to SKU <input id= "qSKU" name="SKU'+rownum+'"
        	
            // Append Custom Row HTML 
        	$("##customFields").append('<tr class="orderRow"><td>'+rownum+'</td><td><input name="SKU" class="form-control input-lg m-bot11 skuAutoComplete" type="text"  required="yes" autocomplete="off"></td><td><input class="form-control input-lg m-bot10" name="BriefDesc" type="text"  value="Item Description"></td><td class="something"><input name="Qty" type="text" class="form-control input-lg m-bot15" required="yes"autocomplete="off"></td><td class="text-center"><input name="Bundle" type="text" class="form-control input-lg m-bot15" required="no" default="b1"></td><td> <a href="javascript:void(0);" class="remCF btn btn-danger btn-sm">Remove</a></td></tr>');


            $('##customFields tr.orderRow:last').on('focusin' , '.skuAutoComplete', function(e) {
                $(this).autocomplete( autoCompleteDefinitionObj );
            });
        });

        // AUTO COMPLETE REGISTERED ONCE BUT WE told it add this action to all inputs that have the class of
        // .skuAutoComplete that is added to any ORDER ROW class in the custom fields table this way it delegates events even to new events like are added using the .addCF button
        $('##customFields tr.orderRow').on('focusin' , '.skuAutoComplete', function(e) {
            $(this).autocomplete( autoCompleteDefinitionObj );
        });
        
        // Remove Custom Row HTML 
        $("##customFields").on('click','.remCF',function(){
            $(this).closest('tr.orderRow').remove();
        });

        $("##wizard").steps({
            headerTag: "h2",
            bodyTag: "section",
            transitionEffect: "slideLeft"
        });

        $("##wizard-vertical").steps({
            headerTag: "h2",
            bodyTag: "section",
            transitionEffect: "slideLeft",
            stepsOrientation: "vertical"
        });
    }); //end document ready everything has to be in document ready...
</script>


<!--- Page Entries --->

<!-- Placed js at the end of the document so the pages load faster -->

<!--Core js-->

 <!--- Autocomplete Function called  ---> 
 <!--- <script>
$('.form-control.input-lg.m-bot11').on('focusin' , function() {
	console.log("focus working");
    $(this).autocomplete({
      source: function(query, response) {
                 $.ajax({
                       url: '/cfc/inventory/inventoryService.cfc?method=getInnbound&returnFormat=JSON',
                     dataType: "json",
                     data: {
                         searchPhrase: query.term
                     },
                     success: function(getInquArray) {
                         response(getInquArray);
                         console.log(getInquArray);
                   }
                });
            }
        });
    });
</script>--->
<!--- on Focus --->
<!--- <script type="text/javascript">
  $(".form-control.input-lg.m-bot12").focus(function(){
        
    });
</script> --->

</cfsavecontent>
<!--- <cfinclude template="/includes/_debug.cfm"> --->
<!--- *********************** _footer ***********************--->
<cfinclude template="/includes/chunks/_footer.cfm">

</cfoutput>
