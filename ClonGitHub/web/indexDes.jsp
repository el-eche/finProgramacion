<%-- 
    Document   : indexDesasrrollador
    Created on : 23/04/2014, 02:02:36 PM
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
        <link type="text/css" href="EstiloUnico.css" rel="stylesheet">
     
        <%--  <link type="text/css" href="otroEstilo.css" rel="stylesheet">--%>
        <script language="JavaScript" type="text/javascript" src="jquery.js" charset="utf-8"></script>
<script type="text/javascript">
 $(document).ready(function(){
     $("#criterio").keyup(function(){
       var criterio=$(this).val();
       dataString='criterio='+criterio;
       $.ajax({
           url:"BuscarBorrar2.jsp",
           type:"POST",
           data:dataString,
           success:function (data){
               $("#opciones").fadeIn(1000).html(data);
           }
       });
     });
 });
</script>
             <style type="text/css">   
a:link   
{   
 text-decoration:none;   
}   
</style>
             <%
HttpSession ses=request.getSession(true);
String use=(String)ses.getAttribute("usuario");
String pass=(String)ses.getAttribute("pass");
           %>  
           <script type="text/javascript">
           function traerMisJuegos(){
           $.ajax({
              type:"POST",
              url:"MisJuegos.jsp",
              data:"",
              success:function (data){
                  $("#tamaño").fadeIn(1000).html(data);
              }
               
           });
           }  
         
           
           </script>
        <%--   <script type="text/javascript">
         function traerjuego(){
               jueg=document.getElementById("criterio").value;
               dataStr='juego='+jueg;
               $.ajax({
                 type:"POST",
                 url:"traerJuego.jsp",
                 data:dataStr,
                 success:function (data){
             $("#tamaño").fadeIn(1000).html(data);        
                 }
                   
               });
         }
           </script> --%>
           
    </head>
    <body background="http://localhost/Imagenes/Fondos-de-pantallaPrincipal.jpg">
        <div id="mostrar" style="float:left;background: #ccc; height: 742px " >
            <form>
            <table>
                <tr><h2><font color="red">Categorias</font></h2></tr>
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
       <%
       if(use==null||use==""){%>
        <div id="iniciarSesion" style="float: right; height: 500px">
                <a href="IniciarSesion.jsp"> Crear Cuenta :<img src="http://localhost/Imagenes/Registrarse.png" width="30" height="30"></a><br><br>
                <a href="IniciarSesion.jsp"> Iniciar Sesion :<img src="http://localhost/Imagenes/sesion.png" width="30" height="30"></a><br>  
                   </div>
       <%}else
       {
       perfil per=bu.verEspecifico(use);
       String ima=per.getImagen();
       %>
      <div id="iniciarSesion" style="float: right; height: 500px">
          <a href="MiPerfil.jsp">Mi perfil<img src="http://localhost/Imagenes/<%=ima%>" class="min"></a>
          
          <a href="FinSession"> Cerrar Sesion :<img src="http://localhost/Imagenes/cerrar-sesion-icono.png" width="30" height="30"></a><br>  
   </div> 
           
       <%}%>
           
            
          <%--  <div id="margen" style="float: left;margin: 5px;height: 150px;width: 700px;">--%>
              
           </div> 
           <div id="otro" style="background: #ccc;width: 450px;height: 50px;">
          <a href="altaJuego.jsp" >Agregar Juegos Nuevo</a>&nbsp;&nbsp;&nbsp;
          <a href="AltaVersion.jsp" >Alta Version Nueva</a>&nbsp;&nbsp;&nbsp;
          <a href="#" onclick="traerMisJuegos();">Todos mis Juegos</a> 
     
     </div>  
           
           <div id="divBuscar">
                  
      
    <!-- este div contendrá el listado de coincidencias -->
   
    <!-- este input contendra el criterio a buscar en autocompletado -->
    <form name="juegos" action="traerJuego.jsp" method="post">
     <table> <tr>    <td><input type="text" name="criterio" class="criterio" id="criterio" style="width: 100px;"/></td>
<%--<input type="image" src="http://localhost/Imagenes/search.png" class="image_buscar">--%>
        <td><input type="submit" value="Buscar Juego"> </td> 
 </tr></table>       
    </form>

          </div>
    <div id="tamaño" style="">
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
<div id="marcar" class="marcar" style="float: right;">  
 <a href="mostrarJuego.jsp?juego=<%=nom%>"><br/><font color="red"><%=nom%><br/>
 <img class="min" src="http://localhost/Imagenes/<%=ur%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
</a>
      </div>
   <% }%>
       </div>
        </form>
    </body>
</html>
