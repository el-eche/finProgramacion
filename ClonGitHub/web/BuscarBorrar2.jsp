<%-- 
    Document   : BuscarBorrar2
    Created on : 09/05/2014, 03:33:58 PM
    Author     : pico
--%>

<%@page import="conexion.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="estilo.css" rel="stylesheet" type="text/css" />
        <link href="estiloNuevo.css" rel="stylesheet" type="text/css" />
        <%--  <style type="text/css">   
a:link   
{   
 text-decoration:none; 
} 
a:visited {text-decoration:none;color:#000000;}
a:hover {text-decoration:underline;color:crimson;} 
a:link {text-decoration:none;color:#000000;} 
a:active {text-decoration:none;color:#000000;} 
</style>--%>

    </head>
    <body>
    <table id="mitabla"><tr>
      <%
           String nom;
           ResultSet rs;
       String criterio=request.getParameter("criterio");
       buscar bu=new buscar();
       rs=bu.juegoAutoNombre(criterio);
       while(rs.next()){
       nom=rs.getString("nombre");%>
        <a href="indexDes.jsp?dato=<%=nom%>" id="milink"><%=nom%></a><br> 
      <% }
      
      %></tr></table>
    
        
    </body>
</html>
