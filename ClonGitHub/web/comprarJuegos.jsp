<%-- 
    Document   : comprarJuegos
    Created on : 02/06/2014, 12:56:52 PM
    Author     : pico
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.*"%>
<%@page import="Logica.*"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
               <link type="text/css" href="EstiloUnico.css" rel="stylesheet">
        <%--  <link type="text/css" href="otroEstilo.css" rel="stylesheet">--%>
        <script language="JavaScript" type="text/javascript" src="jquery.js" charset="utf-8"></script>
  <%  String vac="";
  buscar bu=new buscar();
       HttpSession sesion=request.getSession();
       String ses=(String)sesion.getAttribute("usuario");
       if(ses==vac||ses==(null)){
     int a=JOptionPane.showOptionDialog(null,"El sitio solicita que inicie sesiòn", "Error de sesión",JOptionPane.YES_NO_OPTION, JOptionPane.INFORMATION_MESSAGE, null, null, null);
    if(a==0){ response.sendRedirect("IniciarSesion.jsp"); } 
    else{response.sendRedirect("indexDes.jsp");}
     } else{
  juego ju=new juego();
  ResultSet rs=bu.verTodosJuegos();
  
     while(rs.next()){
     String nom=rs.getString("nombre");
     String ur=rs.getString("imagen");
     double pre=rs.getDouble("precio");
  %>
    </head>
    <body>
       <div id="otromarcar" class="otromarcar" style="float: right;">  
 <a href="confirmarCompra?juego=<%=nom%>"><br/><font color="red"><%=nom%><br/>
 <img class="otromin" src="http://localhost/Imagenes/<%=ur%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
 <br/><font color="red">u$u<%=pre%><br/>
    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
</a>
       </div>&nbsp;&nbsp;
       <% }%>
    </body>
    <%}%>
</html>
