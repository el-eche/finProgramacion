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
        <link type="text/css" href="EstiloUnico.css" rel="stylesheet">
         <script language="JavaScript" type="text/javascript" src="jquery.js" charset="utf-8"></script>
         <script type="text/javascript">
           $(document).ready(function(){
    $("select[name=select1]").change(function(){
           juego=$('select[name=select1]').val();
           nombre=document.getElementById("oculto").value;
          var ajax_data = {
  "juego"     : juego,
  "nombre"   : nombre,

};
           $.ajax({
               url:"ordenarJuegos.jsp",
               type:"POST",
               data:ajax_data,
               success:function (data){
               $("#tamaño2").fadeIn(1000).html(data);    
               }
               
           });
        });
        $("select[name=select2]").change(function(){
            juego=$('select[name=select2]').val();
            nombre=document.getElementById("oculto").value;
            dataString='juego='+juego+'oculto='+nombre;
      var ajax_data = {
  "juego"     : juego,
  "nombre"   : nombre,

};
           $.ajax({
               url:"ordenarJuegos.jsp",
               type:"POST",
               data:ajax_data,
               success:function (data){
               $("#tamaño2").fadeIn(1000).html(data);    
               }
               
           });
        });

});
         </script>
        </head>
        <body background="http://localhost/Imagenes/Fondos-de-pantallaPrincipal.jpg">
              
        <%
        String nom=request.getParameter("criterio");
        int cont=0;
        ResultSet rs,sr;
        juego ju=new juego();
        buscar bu=new buscar();
        sr=bu.juegoAutoNombre(nom);
        rs=bu.juegoAutoNombre(nom);
        while(sr.next()){
        cont++;
        }%>
          <div id="resultado" class="resultado" style="background: #999999;float: left;width: auto;-webkit-border-radius: 40px;-moz-border-radius: 40px;border-radius: 40px;">       
        <h2>Resultados para <%=nom%> (<%=cont%> resultados)</h2></div>
        <input type="text" id="oculto" name="oculto" value="<%=nom%>" hidden="">
        <div style="  position: absolute;top: 100px;left: 200px;width: 600px;
 height: auto;
 background: #999999;
 opacity: 0.9;">Ordenado por <select name="select1"><option value="Alfabetica">Alfabeticamente(a-z)</option>
                <option value="Ventas">Por ventas (desc)</option></select>&nbsp;&nbsp;Precio<select name="select2"><option value="menostres">$0 - 3</option>
                
                    <option value="menosdiez">$3 - $10</option><option value="masdiez">Mas de $10</option></select></div>  
        
        <div id="tamaño2" style="  position: absolute;
    top: 150px;
    left: 200px;
 width: 600px;
 height: auto;
 background: #333333;
 opacity: 0.9;">
             
 <%--  <div class="ribbon"><div class="ribbon-stitches-top"></div><strong class="ribbon-content"><h1>Resultados para <%=nom%> (<%=cont%> resultados) </h1></strong><div class="ribbon-stitches-bottom"></div></div>           
    --%>         
        <%while(rs.next()){
            String nombre=rs.getString("nombre");
            String ur=rs.getString("imagen");
            double pre=rs.getDouble("precio");
            int num=bu.numeroJuego(nombre);
            ResultSet otrosr=bu.traerCat(num);
            
        %>
        
          <div id="divotromarcar" class="divotromarcar">  
 <br/><font color="red"><%=nombre%><br/>
 <img class="otromin" src="http://localhost/Imagenes/<%=ur%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
 <br/><font color="red">Precio u$u<%=pre%> /<%while(otrosr.next()){
            String cate=otrosr.getString("tipo");%><%=cate%> ,<% }//fin while otrosr%>
    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
     <br/> </div>&nbsp;&nbsp;
      
           <%  
   }//fin while rs
        %>
    </div> 
    </div> 
    </body>
</html>
