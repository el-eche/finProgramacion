<%-- 
    Document   : ordenarJuegos
    Created on : 04/06/2014, 09:08:47 AM
    Author     : pico
--%>
<%@page import="conexion.*"%>
<%@page import="Logica.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
     <%
        String val=request.getParameter("juego");
        String nom=request.getParameter("nombre");

%>
          <div id="resultado" class="resultado" >       
        <h2>Resultados para <%=val%>(resultados <%=nom%>)</h2></div>    
    </body>
</html>
