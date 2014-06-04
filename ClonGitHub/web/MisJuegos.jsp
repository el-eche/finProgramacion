<%-- 
    Document   : MisJuegos
    Created on : 15/05/2014, 03:20:04 PM
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
   </head>
   <body background="http://localhost/Imagenes/Fondos-de-pantallaPrincipal.jpg"> 
       <%
HttpSession ses=request.getSession(true);
String use=(String)ses.getAttribute("usuario");
String pass=(String)ses.getAttribute("pass");
ResultSet rs;
        if(use==""||use==null){%>
        
        <p><font style="font-size: large" color="red">Para ver sus Juegos inicie sesiòn</p>  
     
        <% }else{
 
        perfil per=new perfil();
        buscar bu=new buscar();
        per=bu.verEspecifico(use);
        if(per.getTipo().equals("Desarrollador")){
       rs=bu.juegoXdesarrollador(use);
      while(rs.next()){
       String ju=rs.getString("nombre");
        String ima=rs.getString("imagen");
        %>
      <div id="marcar" class="marcar" style="float: right;">  
 <a href="mostrarJuego.jsp?juego=<%=ju%>"><br/><font color="red"><%=ju%><br/>
 <img class="min" src="http://localhost/Imagenes/<%=ima%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
</a>
      </div>
        <%}
   }
        
        else{
         rs=bu.juegoXcliente(use);
      while(rs.next()){
       String ju=rs.getString("nombre");
        String ima=rs.getString("imagen");
        %>
      <div id="marcar" class="marcar" style="float: right;">  
 <a href="mostrarJuego.jsp?juego=<%=ju%>"><br/><font color="red"><%=ju%><br/>
 <img class="min" src="http://localhost/Imagenes/<%=ima%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
</a>
      </div>
        <%}
       // }
        }
        }

   %>
    
        
    </body>
</html>
