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
	<!--Barcode Generator--->
<script type="text/javascript" src="/js/jquery-barcode.js"></script>
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
				

		
// zipcode finder 
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

// barcode generator
$('##fOrder').keyup(function(e){
	var bCodeNo = $(this).val();

$("##bcTarget").barcode(bCodeNo, "code128",{barWidth:2, barHeight:60}); 
var el = $(this); 
$('##displayfOrder').text(el.val());
});


//Add on to Table
	$(".addCF").click(function(){
		$("##customFields").append('<tr valign="top"><td>3</td><td><h4>Service Two</h4><p>Service Four Description Lorem ipsum dolor sit amet.</p></td><td class="text-center">2</td><td class="text-center">5</td><td class="text-center">$1300.00</td><td> &nbsp;  &nbsp; <a href="javascript:void(0);" class="remCF">Remove</a></td></tr>');
	});
    $("##customFields").on('click','.remCF',function(){
        $(this).parent().parent().remove();
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
    {//log this
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


</cfsavecontent>
<!--- *********************** _footer ***********************--->
<cfinclude template="/includes/chunks/_footer.cfm">

</cfoutput>
