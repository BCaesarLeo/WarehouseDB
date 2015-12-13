<cfoutput>
<!--- *********************** _header ***********************--->
<cfinclude template="/includes/chunks/_header.cfm">

<cfsavecontent variable="extraCSS">
	<link href="/js/file-uploader/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css"  />
	<link href="/js/file-uploader/css/jquery.fileupload.css" rel="stylesheet" type="text/css"  />

</cfsavecontent>
<!--- *********************** _mainMenu ***********************--->
<cfset activeNav = 'register-inbound'> <!-- set the activeNav variable here before the include so the menu will have the proper thing selected -->
<cfinclude template="/includes/chunks/_mainMenu.cfm">


<!--- *********************** THIS PAGE'S INCLUDE FILE --- this is where your main logic goes for this page ***********************--->

 <cfif not isDefined("FORM.ecoSubmit1")>
<cfinclude template="/admin/receiving/register-inbound/_upload_file.cfm">
<cfelseif isDefined("FORM.ecoSubmit1")>
<cfinclude template="/admin/receiving/register-inbound/_verify_data.cfm">
<cfelseif isDefined("FORM.ecoSubmit2")>
<cfinclude template="/admin/receiving/register-inbound/_append_data.cfm">
</cfif>

<!--- *********************** THIS PAGE's specific javascript such as (datatables, flot, etc..) ***********************--->
<cfsavecontent variable="extraJS">
<!--Multiuple File Uploader-->
<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="/js/file-uploader/js/vendor/jquery.ui.widget.js"></script>
<!-- The Templates plugin is included to render the upload/download listings -->
<script src="http://blueimp.github.io/JavaScript-Templates/js/tmpl.min.js"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="http://blueimp.github.io/JavaScript-Load-Image/js/load-image.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="http://blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>

<!-- blueimp Gallery script -->
<script src="http://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="/js/file-uploader/js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="/js/file-uploader/js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="/js/file-uploader/js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="/js/file-uploader/js/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="/js/file-uploader/js/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="/js/file-uploader/js/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="/js/file-uploader/js/jquery.fileupload-validate.js"></script>
<!-- The File Upload user interface plugin -->
<script src="/js/file-uploader/js/jquery.fileupload-ui.js"></script>
	</cfsavecontent>

<!--- *********************** _coreJavaScript ***********************--->
<cfinclude template="/includes/chunks/_coreJavaScript.cfm">

<!--- *********************** _footer ***********************--->
<cfinclude template="/includes/chunks/_footer.cfm">

</cfoutput>