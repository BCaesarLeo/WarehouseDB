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
	<script>
		$(document).ready(function(){
			//case sensitive.. by logging i could tell this function wasn't getting called.
			//log this
			console.log($('##fName'));
			//vs this
			console.log($('##fname'));
	 		$('##fName').keyup(function () {
	 			var el = $(this);
	 			console.log( el.val() );
	  			$('##displayfName').text(el.val());
	  			
			});

			// $('##fOrder').keyup(function () {
	 		//var el = $(this);
	 	// 		console.log( el.val() );
	  // 			$('##displayfOrder').text(el.val());
	  			
			});

			$('##fPhone').keyup(function () {
	 			var el = $(this);
	 			console.log( el.val() );
	  			$('##displayfPhone').text(el.val());
	  			
			});
				$('##fEmail').keyup(function () {
	 			var el = $(this);
	 			console.log( el.val() );
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
$('##fOrder').keyup(function(e){
	var bCodeNo = $(this).val();

$("##bcTarget").barcode(bCodeNo, "code128",{barWidth:2, barHeight:60}); 
var el = $(this); 
$('##displayfOrder').text(el.val());
});


//Add Custom Row to Table

// Call when AddButton Clicked
	$(".addCF").click(function(){
		// add lodash autoincrementing value
		var rownum = _.uniqueId();
		// →  This would be add incrementing rownum to SKU <input id= "qSKU" name="SKU'+rownum+'"
	
// Append Custom Row HTML 
		$("##customFields").append('<tr valign="top"><td>'+rownum+'</td><td><input class="form-control input-lg m-bot10" id= "qDescription'+rownum+'"  name="BriefDesc"  type="text"  value="Item Description"></td><td><input id= "qSKU'+rownum+'" name="SKU" class="form-control input-lg m-bot11" type="text"  required="yes" autocomplete="off"></td><td id="1"class="something"><input name="Qty" type="text" class="form-control input-lg m-bot10" required="yes"></td><td class="text-center"></td><td> &nbsp;  &nbsp; <a href="javascript:void(0);" class="remCF">Remove</a></td></tr>');

// Autocomplete Function called again to run after input
		$('.form-control.input-lg.m-bot11').on('focusin' , function(e) {
	console.log("focus working");
	//outputting the active selection
	var x=document.activeElement;
	console.log(x);
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
            },
             // minLength: 2, //Sets a minimum length of input
             //Attempting to set field values and 
        select: function(event, ui) {
            $(x).val(ui.item.label);
            $("##qSKU").val(ui.item.label);
        // $('.form-control.input-lg.m-bot11').next(".form-control.input-lg.m-bot11").val(ui.item.label);
            // $(x.Event.target).previous().html("FOO")`



console.log(event);
console.log(ui);
console.log(this);
            //this should take care of what needs to happen when you actually click 
        }
    });
	});
// Remove Custom Row HTML 
    $("##customFields").on('click','.remCF',function(){
        $(this).parent().parent().remove();




    });
    });
	</script>


<!--- Page Entries --->

<!-- Placed js at the end of the document so the pages load faster -->

<!--Core js-->

<script class="include" type="text/javascript" src="/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="/js/jquery.scrollTo.min.js"></script>>
<script src="/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
<script src="/js/jquery.nicescroll.js"></script>
<script src="/js/jquery-steps/jquery.steps.js"></script>


<script>
    $(function ()
    {
			console.log($('##wizard'));
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
    });
</script>




 <!--- Autocomplete Function called  --->
<script>
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
</script>
<!--- on Focus --->
<script type="text/javascript">
  $(".form-control.input-lg.m-bot12").focus(function(){
        
    });
</script>

</cfsavecontent>
<!--- <cfinclude template="/includes/_debug.cfm"> --->
<!--- *********************** _footer ***********************--->
<cfinclude template="/includes/chunks/_footer.cfm">

</cfoutput>
