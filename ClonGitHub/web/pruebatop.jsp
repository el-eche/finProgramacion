<%-- 
    Document   : pruebatop
    Created on : 03/06/2014, 12:57:45 AM
    Author     : pico
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Logica.*"%>
<%@page import="conexion.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="EstiloUnico.css" rel="stylesheet"> 
    </head>
    <body>
       
        <div id="tamaño2" class="tamaño2" style="  position: absolute;
    top: 150px;
    left: 200px;
 width: 600px;
 height: 600px;
 background: #333333;
 opacity: 0.9;">
             <%
        buscar bu=new buscar();
        ResultSet rs;
        String ju="at";
        rs=bu.juegosPrecioMenorDiez(ju);
        int con=0;
        while(rs.next()){
        String nom=rs.getString("nombre");
        String ima=rs.getString("imagen");
        con++;
        
        %>
            <br><div id="marcar" class="marcar" style="">  
 <a href="#"><br/><font color="red"><%=nom%><br/>
 <img class="min" src="http://localhost/Imagenes/<%=ima%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
</a>
            </div><br>
        <%
        }
        %>
       </div> <h1> Resultado  <%=con%></h1>
    </body>
</html>
