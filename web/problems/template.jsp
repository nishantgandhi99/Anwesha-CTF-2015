<%-- 
    Document   : template
    Created on : Jan 23, 2015, 10:41:31 PM
    Author     : Amar Sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../Images/favicon.ico">

        <title>CTF Dashboard</title>

        <!-- Bootstrap core CSS --> 
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="../css/problems.css" rel="stylesheet">
        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->


        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="glow" href="#">C4ptur3 Th3 F1ag 2015</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <a id="done" data-toggle="popover" data-trigger="" data-placement="bottom" data-content="Click here when you get the Flag &#x1F440;" href="../dashboard.jsp?q=<% out.print(request.getParameter("q"));%>" class="navbar-right glyphicon glyphicon-ok glow done" aria-hidden="true"></a>
                </div>
            </div>
        </nav>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------------->




        <!--Add Your Code Here-->




<!------------------------------------------------------------------------------------------------------------------------------------------------------------------->
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="../js/jquery.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/problems.js"></script>
    </body>
</html>

