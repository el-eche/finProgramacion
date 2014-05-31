<%-- 
    Document   : probarcss
    Created on : 12/05/2014, 01:57:44 PM
    Author     : pico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" href="estiloNuevo.css" rel="stylesheet">
        <script language="JavaScript" type="text/javascript" src="jquery.js" charset="utf-8"></script>
              <script type="text/javascript">
         function traerjuego(){
              var jueg=document.getElementById("criterio").value;
              var dataStr='juego='+jueg;
               $.ajax({
                 url:"traerJuego.jsp",
                 type:"POST",
                 data:dataStr,
                 success:function (data){
             $("#tamaño").fadeIn(1000).html(data);        
                 }
                   
               });
         }
           </script>    
    </head>
    <body>
        <div id="otro"></div>
        <div id="opciones"><a id="milink">cambiar sobre el</a></div>
        <input type="text" name="criterio" class="criterio" id="criterio" value="Amazing Alex" style="width: 250px;"/>
<%--<input type="image" src="http://localhost/Imagenes/search.png" class="image_buscar">--%>
<input type="submit" value="Buscar Juego" id="botonBuscar" onclick="traerjuego();">
<div id="tamaño"></div>
       
    </body>
</html>
