<%-- 
    Document   : index
    Created on : 10/04/2014, 03:54:37 PM
    Author     : pico
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.*"%>
<%@page import="Logica.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorias y Juegos</title>
        <link type="text/css" href="estilo.css" rel="stylesheet">
         <link type="text/css" href="otroEstilo.css" rel="stylesheet">
        <script language="JavaScript" type="text/javascript" src="jquery.js" charset="utf-8"></script>
             <%
HttpSession ses=request.getSession(true);
String use=(String)ses.getAttribute("usuario");
String pass=(String)ses.getAttribute("pass");
           %>   
    </head>
    <body background="http://www.fotos-bonitas.com/wp-content/uploads/2014/01/Fondos-de-pantalla-gratis.jpg">
        <div id="mostrar" style="float:left;">
            <form>
            <table>
                <tr><h2>Categorias</h2></tr>
        <%
ResultSet rs;
        buscar bu=new buscar();
        rs=bu.traerCategorias();
        while(rs.next()){ %>           
  
 <tr><td> <input type="submit" name="caja" id="caja" class="button" value="<%=rs.getString("tipo")%>"></td></tr>       
       <%}%> 
            </table>
            </form>
        </div>
            <div id="iniciarSesion" style="float: right; border-color: aqua; height: 500px;">
                <a href="IniciarSesion.jsp"> Crear Cuenta :<img src="http://localhost/Imagenes/Registrarse.png" width="30" height="30"></a><br><br>
                <a href="IniciarSesion.jsp"> Iniciar Sesion :<img src="http://localhost/Imagenes/sesion.png" width="30" height="30"></a><br>  
                   </div>
            
               
            <div id="menuWrapper" style="float: left;margin: 5px;height: 40px;width: 700px; background: #ccc">
               <div class='menu'>
<ul>
<li><a href="URL del enlace">Pestaña 1</a></li>
<li><a href="#">Pestaña 2</a>
<ul>
<li><a href="URL del enlace">Pestaña 2.1</a></li>
<li><a href="URL del enlace">Pestaña 2.2</a></li>
<li><a href="URL del enlace">Pestaña 2.3</a></li>
<li><a href="URL del enlace">Pestaña 2.4</a></li>
</ul>
</li>
<li><a href="#">Pestaña 3</a>
<ul>
<li><a href="URL del enlace">Pestaña 3.1</a></li>
<li><a href="URL del enlace">Pestaña 3.2</a></li>
<li><a href="URL del enlace">Pestaña 3.3</a></li>
<li><a href="URL del enlace">Pestaña 3.4</a></li>
</ul>
</li>

<li><a href="#">Pestaña 4</a>
<ul>
<li><a href="URL del enlace">Pestaña 4.1</a></li>
<li><a href="URL del enlace">Pestaña 4.2</a></li>
<li><a href="URL del enlace">Pestaña 4.3</a></li>
<li><a href="URL del enlace">Pestaña 4.4</a></li>
</ul>
</li>

</ul>


<form action='/search' id='search' method='get' name='searchForm' style='display:inline;'>
<input id="search-box" name="q"  type='text' value="Buscar..."/></form>

</div>
                
                
                
                <%--<form id="todos">
                    <input type="submit" value="Todos los Juegos :"></form>    <input type="text" name="buscar" style="float: right" placeholder="Buscar juego :">
                    <input type="submit" name="tra" value="Buscar">--%>
            </div>
            <form id="llamarUnico">
       <div id="cargaimagen" style="float:center;">
    <% 
    //  HttpSession sesion=request.getSession();
   //   ResultSet res=(ResultSet)sesion.getAttribute("Resultado");
                String va="";
     String v=request.getParameter("caja"); 
     int a=bu.idCategoria(v);
     for(int i=0;i<bu.JuegoCategoria(a).size();i++){
      String nom=bu.JuegoCategoria(a).get(i).getNombre();
      String ur=bu.JuegoCategoria(a).get(i).getImagen();
  // response.reset();
//response.setContentType("image/jpeg");  
  %>
  <div id="borde" style=" float: left;background: #ccc">
      
      <div id="marcar" style="background: #ccc">
<a href="mostrarJuego.jsp?juego=<%=nom%>"><br/><%=nom%><br/>
       <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
            height="100" onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
		</a>
      </div>
      </div>
</div>
        <% }%>
        </form>
    </body>
</html>

