<%-- 
    Document   : mostrar
    Created on : 28/05/2014, 10:18:09 PM
    Author     : pico
--%>

<%@page import="conexion.*"%>
<%@page import="Logica.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de Version</title>
        <link href="EstiloUnico.css" type="text/css" rel="stylesheet">
    </head>
    <body background="http://localhost/Imagenes/Fondos-de-pantallaPrincipal.jpg">
        <%
        String nom=request.getParameter("juego");
  buscar bu=new buscar();
        juego ju=new juego();
        ju=bu.traerJuegoUn(nom);
        String nombre=ju.getNombre();
        String ur=ju.getImagen();
        %>
      
        <div id="solo" style="top: 150px;left: 400px;">
                <div id="marcar" class="marcar">  
                       <a href="#"><br/><font color="red"><%=nom%><br/>
                    <img class="min" src="http://localhost/Imagenes/<%=ur%>" 
                         onmouseover="this.style.opacity = 0.5" onmouseout="this.style.opacity = 1"  alt="#"/>
                    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
                     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
                </a>
            </div>
        </div><br>
                <form name="alta" action="altaVersion" method="post">
                <br>Numero de version :<input type="text" name="version">
                <br>Tamaño de versión :<input type="text" name="tama">
               <br> Link de descarga :<input type="text" name="descarga">
               <br> Orden alta :<input type="text" name="alta">
                <input type="text" name="nombre" hidden="" value="<%=nombre%>">
                <br> <input type="submit" value="Alta Version">
                </form>
    </body>
</html>
