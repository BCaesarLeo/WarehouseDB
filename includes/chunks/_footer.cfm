<cfparam name="extraJS" default="">


<cfoutput>
<!-- IMPORTANT common script init for all pages-->
<script src="/js/scripts.js"></script>

<!--- PUT Javascript that applies to ALL pages here don't put it in the one above so you don't mingle it with the template scripts above --->
<script src="/js/core.js"></script>

#trim(extraJS)#

</body>
</html>
</cfoutput>