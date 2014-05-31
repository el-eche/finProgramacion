<%-- 
    Document   : AutocompletaRindexDes
    Created on : 12/05/2014, 05:18:01 PM
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
        <link type="text/css" href="estiloNuevo.css" rel="stylesheet">
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
           function buscar(){
            var juego=document.getElementById("buscar");  
            dataString='juego='+juego;
           $.ajax({
              type:"POST",
              url:buscarJuego,
              data:dataString,
              success:function (data){
                  $("#tamaño").fadeIn(1000).html(data);
              }
               
           });
           }  
         
           
           </script>
           <script type="text/javascript">
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
           </script> 
           
    </head>
    <body background="http://www.fotos-bonitas.com/wp-content/uploads/2014/01/Fondos-de-pantalla-gratis.jpg">
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
            <div id="iniciarSesion" style="float: right; height: 500px">
                <a href="IniciarSesion.jsp"> Crear Cuenta :<img src="http://localhost/Imagenes/Registrarse.png" width="30" height="30"></a><br><br>
                <a href="IniciarSesion.jsp"> Iniciar Sesion :<img src="http://localhost/Imagenes/sesion.png" width="30" height="30"></a><br>  
                   </div>
            
          <%--  <div id="margen" style="float: left;margin: 5px;height: 150px;width: 700px;">--%>
              
           </div> 
               

           
           <div id="tamaño1" style="top: 100px; left: 200px;"><div style="float: right"> 
    <div style="float: left;" class="buscador">
    
    <!-- este div contendrá el listado de coincidencias -->
    
    <!-- este input contendra el criterio a buscar en autocompletado -->
   <%
 String dato=request.getParameter("dato");
if(dato==null){
%>
<input type="text" name="criterio" class="criterio" id="criterio" style="width: 250px;"/>
<%--<input type="image" src="http://localhost/Imagenes/search.png" class="image_buscar">--%>
<input type="submit" value="Buscar Juego" id="botonBuscar" onclick="traerjuego();">  <%   
}else{%>
<input type="text" name="criterio" class="criterio" id="criterio" value="<%=dato%>" style="width: 250px;"/>
<%--<input type="image" src="http://localhost/Imagenes/search.png" class="image_buscar">--%>
<input type="submit" value="Buscar Juego" id="botonBuscar" onclick="traerjuego();">
<% }
%>
    

    </div><br>

    <br><div id="opciones"></div>
               
    <div id="tamaño" style="top: 50px; left: 0px;position: static;">
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
<div id="marcar" class="marcar" style="float: right; width: 120px; height: 130px;">  
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

