<%-- 
    Document   : traerJuegoBien
    Created on : 14/05/2014, 02:50:03 PM
    Author     : pico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juego Encontrado</title>
        <link type="text/css" href="EstiloUnico.css" rel="stylesheet">
    </head>
    <body>
        <div id="portada">
              <div id="tamaño1" style="top: 100px; left: 200px;">
    <div style="float: left;" class="buscador">
    
    <!-- este div contendrá el listado de coincidencias -->
    
    <!-- este input contendra el criterio a buscar en autocompletado -->
    <form name="juegos" action="traerJuego.jsp" method="post">
<input type="text" name="criterio" class="criterio" id="criterio" style="width: 250px;"/>
<%--<input type="image" src="http://localhost/Imagenes/search.png" class="image_buscar">--%>
<input type="submit" value="Buscar Juego">    
    </form>
    </div></div>  
        </div>
        <div id="contenido">
            Contenido
        </div>
        <div id="pie">
            Pie
        </div>
        
    </body>
</html>
