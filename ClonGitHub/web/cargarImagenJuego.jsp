<%-- 
    Document   : probarMultipart
    Created on : 27/05/2014, 09:41:37 PM
    Author     : pico
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="conexion.buscar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Imagen Juego</title>
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
        <body background="http://localhost/Imagenes/Fondos-de-pantallaPrincipal.jpg" onload="nobackbutton();">
        <%
            buscar bu=new buscar();
            String nombre=request.getParameter("juego");
          int num=bu.numeroJuego(nombre);
          String numero=Integer.toString(num);
       String vac="";
       HttpSession sesion=request.getSession();
       String ses=(String)sesion.getAttribute("usuario");
       if(ses==vac||ses==(null)){
     int a=JOptionPane.showOptionDialog(null,"El sitio solicita que inicie sesiòn", "Error de sesión",JOptionPane.YES_NO_OPTION, JOptionPane.INFORMATION_MESSAGE, null, null, null);
    if(a==0){ response.sendRedirect("IniciarSesion.jsp"); } 
    else{response.sendRedirect("indexDes.jsp");}
     } else{%>
    </head>
    
        <h1>Un ultimo paso para el alta del juego</h1>
        <h2>Agregar imagen del juego</h2>
        <p><%=nombre%></p>
        <form name="miform" action="recibeprobarMultipart.jsp" method="post" enctype="multipart/form-data">
     Seleccione Imagen : <input name="myFile" type="file" id="myFile" required="required"/><img id="imgSalida" width="70" height="70" src="" />
            <input type="text" name="nombre" id="nombre" hidden="" value=<%=numero%> >
            <br>
            <input type="submit">  
        </form>
    </body>
    <%} %>
</html>
