<%-- 
    Document   : chekContraseña
    Created on : 22/04/2014, 04:55:52 PM
    Author     : pico
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conexion.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="estilo.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            buscar bu=new buscar();
        String mail=request.getParameter("email");
 if(bu.existeEmail(mail)){   
       
     %>
 
     <div id="success" style="font-weight: bolder;"><font color="red"><h4> La contraseña ya está en uso</h4></div>
        <% }
        else{%>
     <div id="success" style="font-weight: bolder;"><font color="green"><h4>Contraseña disponible</h4></div>
        <% }%>
        
    </body>
</html>