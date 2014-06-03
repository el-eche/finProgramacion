<%-- 
    Document   : consultarPerfil
    Created on : 18/05/2014, 02:04:10 PM
    Author     : pico
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="conexion.buscar"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de Juego</title>
        <link type="text/css" href="EstiloUnico.css" rel="stylesheet">
        <script language="JavaScript" type="text/javascript" src="jquery.js"></script>
   <%
       String vac="";
       HttpSession sesion=request.getSession(true);
       String ses=(String)sesion.getAttribute("usuario");
       if(ses==vac||ses==(null)){
     int a=JOptionPane.showOptionDialog(null,"El sitio solicita que inicie sesiòn", "Error de sesión",JOptionPane.YES_NO_OPTION, JOptionPane.INFORMATION_MESSAGE, null, null, null);
    if(a==0){ response.sendRedirect("IniciarSesion.jsp"); } 
    else{response.sendRedirect("indexDes.jsp");}
     } else{%>

   
    
    </head>
    <body background="http://localhost/Imagenes/Fondos-de-pantallaPrincipal.jpg">
       
        <div id="divBuscar" style="position: absolute;
    top: 30px;
    left: 330px;
    width:400px;
    height: 30px;
    background:#2580a2;">
                  
      
    <!-- este div contendrá el listado de coincidencias -->
   
    <!-- este input contendra el criterio a buscar en autocompletado -->
    <form name="juegos" action="traerJuego.jsp" method="post">
     <table> <tr>    <td><input type="text" name="criterio" class="criterio" id="criterio" style="width: 100px;"/></td>
<%--<input type="image" src="http://localhost/Imagenes/search.png" class="image_buscar">--%>
        <td><input type="submit" value="Buscar Juego"> </td> 
 </tr></table>       
    </form>

          </div>
        
        <div id="mostrar" style="background: #ccc; opacity: 0.8;">
            <form action="altaJuego" method="post">
               Nombre del Juego : <input type="text" name="nombreJuego"><br>
               Numero de version :<input type="text" name="numeroVersion"><br>
               Tamaño :<input type="text" name="tamaño"><br>
               Direccion del archivo :<input type="text" name="archivo"><br>
               Precio :<input type="text" name="precio"><br>
               Descripcion del Juego <input type="text" name="descripcion"><br>
               
               Categorias :<br>

                <%
                    ResultSet rs;
                    buscar bu = new buscar();
                    rs = bu.traerCategorias();
                     while (rs.next()) {%>           

                <input type="checkbox" name="michek" value="<%=rs.getString("tipo")%>"><%=rs.getString("tipo")%><br>       
                <%}%> 
                <input type="submit"> 
            </form> </div> 
                
    </body>
    <%} %>
</html>
