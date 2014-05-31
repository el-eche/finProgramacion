<%-- 
    Document   : trearJuego
    Created on : 12/05/2014, 02:40:38 PM
    Author     : pico
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="Logica.*"%>
<%@page import="conexion.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
        <title>Buscar Juegos</title>
        <link type="text/css" href="estiloNuevo.css" rel="stylesheet">
        <link type="text/css" href="estilo.css" rel="stylesheet">
        </head>
        <body>
            <div id="tamaño2" style="position: relative">   
        <%
        String nom=request.getParameter("criterio");
        int cont=0;
        ResultSet rs;
        juego ju=new juego();
        buscar bu=new buscar();
        rs=bu.juegoAutoNombre(nom);
        
        while(rs.next()){
            String nombre=rs.getString("nombre");
            String ur=rs.getString("imagen");%>
        
                <div id="marcar" class="marcar" style="float: left;">  
                    <a href="mostrarJuego.jsp?juego=<%=nombre%>" id="referencia"><br/><font color="red"><%=nombre%><br/>
 <img class="min" src="http://localhost/Imagenes/<%=ur%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
</a><br>
      </div>
      
           <% 
      cont++;   }
        %>
    </div>     <div id="resultado" class="resultado" style="background: #77AADD;float: left">       
        <p>Resultados para <%=nom%> = <%=cont%></p></div>
            <%
        %>
    
    
  
    </body>
</html>
