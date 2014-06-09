<%-- 
    Document   : IniciarSesion
    Created on : 10/04/2014, 03:56:07 PM
    Author     : pico
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conexion.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesion</title>
        <link type="text/css" href="EstiloPruebas.css" rel="stylesheet">
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
<script type="text/javascript">
 $(document).ready(function() {	
            $('#usuario').keyup(function(){
                usuario=$(this).val();
            var dataString = 'usuario='+usuario;
             
        $.ajax({   
                 type: "POST",
                url: "chekUsuario.jsp",
                 data: dataString,
                 success: function(data) {
                                     $('#Info').fadeIn(1000).html(data);
                                     //alert(data);
                     }
                });
         });
        });

</script>
<script type="text/javascript">
 $(document).ready(function() {	

            $('#pass').keyup(function(){
                email=$(this).val();
              if(rebisar(email)!=1){
            var dataString = 'email='+email;
             
        $.ajax({   
                 type: "POST",
                url: "chekContraseña.jsp",
                 data: dataString,
                 success: function(data) {
                                     $('#masInfo').fadeIn(1000).html(data);
                                     //alert(data);
                     }
                });
        } }); 
        });
        
              function rebisar(texto){
              buscar=/[ºª!|@·$€~%&()=?¿''Ç]/;
            if(buscar.test(texto)) {
                alert("Ilegal caracteres en contraseña \n \nºª!|@·$€~%&()=?¿''Ç");
                caja=document.getElementById("pass");
               caja.innerHTML=""; 
               document.getElementById("pass").value="";
               return 1;
            }}

</script>
<script type="text/javascript">
function comprobar(){
    var una=document.getElementById("pass").value;
    var otra=document.getElementById("otrapass").value;
    borrar=document.getElementById("otrapass");
    if(una!=otra){  
        alert("Las contraseñas son diferentes");
       document.getElementById("otrapass").value="";
       document.getElementById("otrapass").focus(); 
    }
  
}   

</script>

<script type="text/javascript">
    function repasar(){
        tex=document.getElementById("pass").value;
        if(tex==""){
            alert("La contraseña no puede ser vacía");
            document.getElementById("pass").focus();
        }
    }
    </script>
    
    <script type="text/javascript">
$(document).ready(function (){
    $('#boton').click(function (){
    nick=document.getElementById("nick").value;
    contra=document.getElementById("contra").value;
   var dataString={
       "nick":nick,
       "contraseña":contra,
                   };
    
  $.ajax({
        type:"POST",
        url:"validarInicio",
        data:dataString,
        success:function (data){
        $('#resp').fadeIn(1000).html(data);
        }
        
    });
    }); 
});
    
    </script>
    <script type="text/javascript">
     window.onload=function cambiar() {
      document.getElementById("linke").style.display='none';
      document.mostrarimagen.reset(); 
      
}
function cambiarDisplay() {
   var seleccion=document.getElementById("menu"); 
   elegido=seleccion.selectedIndex;
  if(elegido==1){
      document.getElementById("linke").style.display='';
  }
}
    </script>

    </head>
    <%String url="http://localhost/Imagenes/Fondos-de-pantallaPrincipal.jpg";%>
    <body> 
    <div id="cabezera"><img src="http://localhost/Imagenes/iconoJuego.png"><img src="http://localhost/Imagenes/TPlay.jpg">
            <div id="buscar"> <form name="juegos" action="traerJuego.jsp" method="post">
                    <table> <tr>    <td><input type="text" name="criterio" class="criterio" id="criterio" style="width: 100px;border-radius: 25px;" placeholder="Buscar juegos :"/></td>
<%--<input type="image" src="http://localhost/Imagenes/search.png" class="image_buscar">--%>
                            <td><input type="image" src="http://localhost/Imagenes/lupaBuscar.jpg" width="30" height="25" style="position: absolute; top: 3px;"> </td> 
 </tr></table>       
    </form></div>   
                            
                            <div id="inicio"><a href="indexDes.jsp" style="color: #FFFFFF;">
                <img id="mifoto" src="http://localhost/Imagenes/home.png" class="otromin">
                <font style="position: absolute; top:15px;left: 30px;">Inicio</a></div>
    </div>
                            
                            
    <div id="medio">       
<div id="miinicio" style="position: absolute;left: 20px; ">
            <form id="iniciar" action="validarInicio" method="post">
            <table name="iniciarSesion" border="10">
                <h3>Iniciar Sesion </h3>
            <% String error=request.getParameter("Error");
     if(error!=null){%>
            <tr><td><div id="resp"><%=error%></div></td></tr> 
       <%} %> 
    <tr>
        <td><input type="text" name="nick" id="nick" placeholder="Usuario :"></td></tr> 
       <tr>
     <td> <input type="password" name="contra" id="contra" placeholder="Contraseña :"></td></tr>
    <tr>
        <td> <button id="boton" type="submit" onclick=""><img src="http://localhost/Imagenes/Login.jpg" width="30" height="20">
                Iniciar Sesion</button></td></tr>       
            
            </table>
              </form>
        </div>
  <div id="registro" style="position: absolute; left: 400px;">
            <form name="mostrarimagen" action="registrarNuevo.jsp" method="post" enctype="multipart/form-data">
            <table name="registrarse" border="5">   
                <tr><h3>Registrarse </h3></tr>
            <tr><td>      
          Ingrese Nick :   <input type="text" name="usuario" id="usuario" placeholder="Nick :" required="required">
          <div id="Info" style="float: right"></div>
</td></tr>
            <tr><td>Ingrese Contraseña : <input type="password" name="pass" id="pass" placeholder="Contraseña :" onblur="repasar();" required="required">
                <div id="masInfo" style="float: right"></div></td></tr>
            <tr><td>Repita la Contraseña anterior : <input type="password" name="otrapass" id="otrapass" placeholder="Repetir Contraseña :" onblur="comprobar();" required="required">
                <div id="otraInfo" style="float: right"></div></td></tr>
            <tr><td>Seleccione una opción : <select name="menu" id="menu"  onchange="cambiarDisplay();">
  <option selected="selected" value="Cliente">Cliente</option>
  <option value="Desarrollador">Desarrollador</option>
</select></td></tr>
 
            <tr><td>Ingrese Email : <input type="text" name="email" placeholder="Correo Electronico :" required="required"></td></tr>
  <tr><td>Ingrese Nombre : <input type="text" name="nombre" placeholder="Nombre :" required="required"></td></tr>
  <tr><td>Ingrese Apellido : <input type="text" name="apellido" placeholder="Apellido :" required="required"></td></tr>
  <tr><td>Ingrese Fecha Nacimiento : <input type="date" name="nacimiento" required="required"></td></tr>
  <tr id="linke"><td>Ingrese Link de su Web : <input type="text" name="link"></td></tr>
  <tr><td>Seleccione Imagen : <input name="myFile" type="file" id="myFile" required="required"/><img id="imgSalida" width="50" height="50" src="" /></td></tr>
  <tr><td><input type="submit"></td></tr>
            </table></form>
        </div></center> 
        <div id="mio"></div>
        </div> 
    
  <div id="pie"><font id="mifuente">@2014 TPlay Store
            <font id="segundafuente"><a href="indexDes.jsp" style="color: #FFFFFF;">Home</a>
        </div>    
    </body>
</html>
