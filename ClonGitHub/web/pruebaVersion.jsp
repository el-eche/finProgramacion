<%-- 
    Document   : pruebaVersion
    Created on : 23/05/2014, 10:31:13 PM
    Author     : pico
--%>
<%@page import="Logica.*"%>
<%@page import="conexion.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        guardar gu=new guardar();
        
        int a=60;
        int o=1;
        String ve="1.0.0";
        String est="Pendiente";
        String rec="";
        String tam="1200";
        String lin="http://localhost/phpMyAdmin/";
       version ver=new version(a, ve, o, est, rec, tam, lin);
        gu.guardarVersion(ver);
        %>
    </body>
</html>
