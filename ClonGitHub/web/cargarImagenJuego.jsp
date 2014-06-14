<%-- 
    Document   : probarMultipart
    Created on : 27/05/2014, 09:41:37 PM
    Author     : pico
--%>

<%@page import="Logica.*"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="conexion.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Imagen Juego</title>
        <link href="EstiloPruebas.css" type="text/css" rel="stylesheet">
        <script language="JavaScript" type="text/javascript" src="jquery.js" charset="utf-8"></script>
        <script type="text/javascript" language="javascript">
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
        <script type="text/javascript" language="javascript">
       function nobackbutton(){
   window.location.hash="no-back-button";
   window.location.hash="Again-No-back-button" //chrome
   window.onhashchange=function(){window.location.hash="no-back-button";}
}
        </script>

        <%
            buscar bu=new buscar();
            String nombre=request.getParameter("juego");
          int num=bu.numeroJuego(nombre);
          String numero=Integer.toString(num);
       String vac="";
       HttpSession sesion=request.getSession();
       String us=(String)sesion.getAttribute("usuario");
       if(us==vac||us==(null)){
     int a=JOptionPane.showOptionDialog(null,"El sitio solicita que inicie sesiòn", "Error de sesión",JOptionPane.YES_NO_OPTION, JOptionPane.INFORMATION_MESSAGE, null, null, null);
    if(a==0){ response.sendRedirect("IniciarSesion.jsp"); } 
    else{response.sendRedirect("indexDes.jsp");}
     } else{%>
    </head>
     <body onload="nobackbutton();">
  <div id="cabezera"><img src="http://localhost/Imagenes/iconoJuego.png"><img src="http://localhost/Imagenes/TPlay.jpg">
            <div id="buscar"> <form name="juegos" action="traerJuego.jsp" method="post">
                    <table> <tr>    <td><input type="text" name="criterio" class="criterio" id="criterio" style="width: 100px;border-radius: 25px;" placeholder="Buscar juegos :"/></td>
<%--<input type="image" src="http://localhost/Imagenes/search.png" class="image_buscar">--%>
                            <td><input type="image" src="http://localhost/Imagenes/lupaBuscar.jpg" width="30" height="25" style="position: absolute; top: 3px;"> </td> 
 </tr></table>       
    </form></div>
       
     
       <%
       perfil per=bu.verEspecifico(us);
       String ima=per.getImagen();
       %>
      <div id="iniciarSesion" style="float: right; height: 500px"> 
          <a href="FinSession"> Cerrar Sesion :<img src="http://localhost/Imagenes/cerrar-sesion-icono.png" class="otromin"></a><br><br>  
          <a href="MiPerfil.jsp">Mi perfil<img src="http://localhost/Imagenes/<%=ima%>" class="otromin"></a>
      </div> 
           
       
    
     <div id="inicio" style="top: 110px;left: 120px;"><a href="indexDes.jsp" style="color: #FFFFFF;">
                <img id="mifoto" src="http://localhost/Imagenes/home.png" class="otromin">
                <font style="position: absolute; top:15px;left: 30px;">Inicio</a></div>
          <div id="reloj" class="reloj" style="position: absolute;left: 750px;top: 100px;">
              <embed src="http://www.clocklink.com/clocks/5005-white.swf?TimeZone=UYT&"  width="140" height="50" wmode="transparent" type="application/x-shockwave-flash">
          </div>
   </div>
       <div id="medio">
        <h1>Un ultimo paso para el alta del juego</h1>
        <h2>Agregar imagen del juego</h2>
        <p><%=nombre%></p>
        <form name="miform" action="recibeprobarMultipart.jsp" method="post" enctype="multipart/form-data">
     Seleccione Imagen : <input name="myFile" type="file" id="myFile" required="required" class="texto"/><img id="imgSalida" width="70" height="70" src="" />
            <input type="text" name="nombre" id="nombre" hidden="" value=<%=numero%> >
            <br>
            <input type="submit" value="Cargar Imagen" class="texto">  
        </form>
            </div>
            
           <div id="pie"><font id="mifuente">@2014 TPlay Store
            <font id="segundafuente"><a href="indexDes.jsp" style="color: #FFFFFF;">Home</a>
        </div>  
            
    </body>
    <%} %>
</html>
