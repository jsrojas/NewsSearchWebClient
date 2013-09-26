<%-- 
    Document   : index
    Created on : 25/09/2013, 01:43:34 PM
    Author     : JuanSebastian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>News Search Service Client</title>
                <style type="text/css">
            html,body{
                background-image: url(Resources/newspaper.jpg);
                font-style:oblique;
            }
            
        </style>
    </head>
    <body>
        <center>      
        <h1>News Search Web Service</h1>
        <br><br>
        This WebApp allows to search for news about a given topic and shows the title, subtitle and a youtube link of the new.
        <form method="get" action="NewsSearchServlet">
            <br><br><input type="text" name="query" value=""/>
            <br><input type="submit" value="Search News" name="SearchNews"/>
        </form>
        <br><br><br>
        <h4>This service is powered by Newsinapp API. More information in:</h4>
        <a href="http://www.newsinapp.io/">http://www.newsinapp.io/</a>
        <br><br><br><br><br><br><br><br>
        <img src="Resources/logo.png"/>
    </body>
</html>
