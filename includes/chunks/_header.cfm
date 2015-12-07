<cfparam name="pageTitle" default="">
<cfparam name="extraCSS" default="">
<cfparam name="extraHeaderJS" default="">

<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="EcoFlex - Inventory Solution for Fourwaywarehouse">
    <meta name="author" content="Dynamix Computers">

    <meta http-equiv=”X-UA-Compatible” content=”IE=EmulateIE9”>
    <meta http-equiv=”X-UA-Compatible” content=”IE=9”>

    <link rel="shortcut icon" href="images/favicon.png">
    <title>EcoFlex Database</title>
    <!--Core CSS -->
    <link href="/bs3/css/bootstrap.min.css" rel="stylesheet">
    <link href="/js/jquery-ui/jquery-ui-1.10.1.custom.min.css" rel="stylesheet">
    <link href="/css/bootstrap-reset.css" rel="stylesheet">
    <link href="/font-awesome/css/font-awesome.css" rel="stylesheet">

    #trim(extraCSS)#
    <!--- <link href="/js/jvector-map/jquery-jvectormap-1.2.2.css" rel="stylesheet">
    <link href="/css/clndr.css" rel="stylesheet">
    <!--clock css-->
    <link href="/js/css3clock/css/style.css" rel="stylesheet">
    <!--Morris Chart CSS -->
    <link href="js/morris-chart/morris.css" rel="stylesheet" > --->
    <!-- Custom styles for this template -->
    <link href="/css/style.css" rel="stylesheet">
    <link href="/css/style-responsive.css" rel="stylesheet"/>
    
    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]>
    <script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

</head>
<body>

<header class="header fixed-top clearfix">
    <!--logo start-->
    <div class="brand">

        <a href="index.html" class="logo">
            <img src="/images/ECOFLEX.png"  width="175px" height="auto" alt="EcoFlex"/>
        </a>
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars"></div>
        </div>
    </div>
    <!--logo end-->

<!--- NOTIFY NAV - if you want it...  --->
<!--- <cfinclude template="/includes/chunks/navNotify.cfm" /> --->

<!--- TOP RIGHT NAV - logout and what not --->
<cfinclude template="/includes/chunks/_topRightNav.cfm" />

</header>
</cfoutput>