<%-- 
    Document   : probarRedireccion
    Created on : 13/06/2014, 04:45:10 PM
    Author     : pico
--%>
<%@page import="Logica.*"%>
<%@page import="conexion.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="EstiloPruebas.css" rel="stylesheet">
        
        <script language="JavaScript" type="text/javascript" src="jquery.js"></script>
             <script type="text/javascript">
              $(window).load(function(){

         $(function() {
          $('#myFile').change(function(e) {//necesitamos un input file para cargar el archivo y a este le asignamos al evento change un método llamado addImage() para que procese la imagen seleccionada. 
              addImage(e); 
             });

             function addImage(e){
              var file = e.target.files[0],//El método addImage() seleccionara el archivo y aplicara un filtro para que solo se pueda seleccionar imágenes.
              imageType = /image.*/;
    
              if (!file.type.match(imageType))
               return;
  
              var reader = new FileReader();
                        reader.onload = fileOnload;//Después se cargará el archivo en memoria y se asignará a un método fileOnload() el procesamiento de los datos. 
                        reader.readAsDataURL(file);
                    }

                    function fileOnload(e) {
                        var result = e.target.result;//Por último se guarda los datos de la imagen en una variable y se agregara los datos al atributo src del img. 
                        $('#imgSalida').attr("src", result);//La variable result contiene los datos de la imagen en codificación base64. 
                    }
                });
            }); 
             
         </script>
             
        <script type="text/javascript">
            function enviar(){
                   var check = $("input[type='checkbox']:checked").length;
          if(check==""){ 
          alert("Debe seleccionar al menos una categoria");
      }
           else{  
                var categorias = new Array();
        $("input[type='checkbox']:checked").each(function() {
            categorias.push($(this).val());
        });
      
              nombreJuego=document.getElementById("nombreJuego").value;
              numeroVersion=document.getElementById("numeroVersion").value;
              tamaño=document.getElementById("tamaño").value;
              archivo=document.getElementById("archivo").value;
              precio=document.getElementById("precio").value;
              descripcion=document.getElementById("descripcion").value;
              var ajax_data={
                "nombreJuego":nombreJuego,
                "numeroVersion":numeroVersion,
                "tamaño":tamaño,
                "archivo":archivo,
                "precio":precio,
                "descripcion":descripcion,
                  
              };
              
             $.ajax({
                 url:"probarRedireccion",
                 type: "POST",
                 data:ajax_data,
                 success:function(data){
                 $("#respuesta").fadeIn(1000).html(data)    
                 }
             }); 
              
        }   
            }
        </script>
        <%ResultSet rs;
        buscar bu=new buscar();%>
    </head>
    <body>
        <div id="cabezera"><img src="http://localhost/Imagenes/iconoJuego.png"><img src="http://localhost/Imagenes/TPlay.jpg">
            <div id="buscar"> <form name="juegos" action="traerJuego.jsp" method="post">
                    <table> <tr>    <td><input type="text" name="criterio" class="criterio" id="criterio" style="width: 100px;border-radius: 25px;" placeholder="Buscar juegos :"/></td>
<%--<input type="image" src="http://localhost/Imagenes/search.png" class="image_buscar">--%>
                            <td><input type="image" src="http://localhost/Imagenes/lupaBuscar.jpg" width="30" height="25" style="position: absolute; top: 3px;"> </td> 
 </tr></table>       
    </form></div>
                         
          </div>                  
                            
                            <div id="inicio"><a href="indexDes.jsp" style="color: #FFFFFF;">
                <img id="mifoto" src="http://localhost/Imagenes/home.png" class="otromin">
                <font style="position: absolute; top:15px;left: 30px;">Inicio</a></div>
   <div id="reloj" class="reloj" style="position: absolute;left: 750px;top: 100px;">
              <embed src="http://www.clocklink.com/clocks/5005-white.swf?TimeZone=UYT&"  width="140" height="50" wmode="transparent" type="application/x-shockwave-flash">
          </div>
                            <div id="medio">
                                <div id="completar" style="position: absolute;">
                             Categorias :<br>

                <%
                   
                    rs = bu.traerCategorias();
                     while (rs.next()) {%>           

                     <input type="checkbox" name="michek[]" class="texto"  id="michek" value="<%=rs.getString("tipo")%>"><%=rs.getString("tipo")%><br>       
                <%}%>        
                                    
                                </div>      
                                <div id="midiv" style="position: absolute;left: 200px;">
               Nombre del Juego : <input type="text" name="nombreJuego" required="required" id="nombreJuego" class="texto"><br>
               Numero de version :<input type="text" name="numeroVersion" required="required" id="numeroVersion" class="texto"><br>
               Tamaño (kb) :<input type="text" name="tamaño" required="required" id="tamaño" class="texto"><br>
               Direccion del archivo :<input type="text" name="archivo" required="required" id="archivo" class="texto"><br>
               Precio (u$u) :<input type="text" name="precio" required="required" id="precio" class="texto"><br>
               Descripcion del Juego <input type="text" name="descripcion" required="required" id="descripcion" class="texto"><br>
               <br><br><br><br><br><br><br>
               &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" onclick="enviar();" value="Subir Juego">
                </div>
                <div id="respuesta" style="position: absolute;top: 200px;"></div>
                                
                            </div>
                            <div id="pie"><font id="mifuente">@2014 TPlay Store
            <font id="segundafuente"><a href="indexDes.jsp" style="color: #FFFFFF;">Home</a>
        </div> 
    </body>
</html>
