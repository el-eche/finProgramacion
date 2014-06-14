<%-- 
    Document   : paginaRedireccionada
    Created on : 13/06/2014, 04:48:02 PM
    Author     : pico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    </head>
    <body>

        <%
        String nombreJuego=request.getParameter("nombreJuego");
        %>
        
        <div id="medio">
        <form name="miform" action="recibeprobarMultipart.jsp" method="post" enctype="multipart/form-data">
            <img id="imgSalida" width="70" height="70" src="" style="position: absolute;left: 500px;"/><br>
     Seleccione Imagen : <input name="myFile" type="file" id="myFile" required="required" class="texto"/>
     <br> <input type="submit" value="Cargar Imagen" class="texto">  
        </form>
            </div>
            
           <div id="pie"><font id="mifuente">@2014 TPlay Store
            <font id="segundafuente"><a href="indexDes.jsp" style="color: #FFFFFF;">Home</a>
        </div>  
  </body>
</html>
