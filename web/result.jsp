<%-- 
    Document   : result
    Created on : 25/09/2013, 01:49:10 PM
    Author     : JuanSebastian
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%! private List<String> news = null;
%>

<%
    news = (List<String>) session.getAttribute("news");//se obtiene la lista que trae las noticias a traves del metodo JSONNewsparsing
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>News Search Result</title>
        <style type="text/css">
            html,body{
                background-image: url(Resources/newspaper.jpg);
                font-style:oblique;
            }

        </style>
    </head>
    <body>
    <center>
        <h1>SEARCH RESULTS</h1>
        <br><br>
        <%
            int i;
            for (i = 0; i < news.size(); i++) {
        %>
        <%
            String n = news.get(i);//se extraen las noticias una por una de la lista
            String[] parts = n.split("♣");//se divide el contenido de cada noticia a traves del caracter ♣ 
            //La información es dividida en Titulo, Subtitulo, enlace a youtube y fecha de publicación
        %>
        <%
            //Se asignan las divisiones realizadas a Strings nombrados de tal manera que puedan ser identificados
            //facilmente y se realiza un substring para eliminar caracteres innecesarios
            String title = parts[0];
            String Titulo = title.substring(1, title.length());
            String subtitle = parts[1];
            String Subtitulo = subtitle.substring(1, subtitle.length());
            String video = parts[2];
            String publicacion = parts[3];
            String date = publicacion.substring(1, 11);
            String Hour = publicacion.substring(12, 20);
            String Date = date + "-" + Hour;
            //Finalmente se despliega la información de las noticias obtenidas.
        %> 
        <h1>NEW</h1><h2>Title:</h2><%=Titulo%><br><h2>Subtitle:</h2><%=Subtitulo%><br><h2>Link:</h2><a href=<%=video%>><%=video%></a><br><h2>Date:</h2><%=Date%><br><br><br>  
        <%
            }
        %>

        <form method="get" action="NewsSearchServlet">
            <a href="index.jsp">Back</a>
        </form>
    </center>
</body>
</html>
