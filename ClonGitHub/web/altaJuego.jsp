<%-- 
    Document   : altaJuegoPrueba
    Created on : 12/06/2014, 12:32:42 PM
    Author     : pico
--%>


<%@page import="Logica.*"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="conexion.buscar"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de Juego</title>
        <link type="text/css" href="EstiloPruebas.css" rel="stylesheet">
        
        <script language="JavaScript" type="text/javascript" src="jquery.js"></script>
        
        <script>
       function controlar(){  
          var check = $("input[type='checkbox']:checked").length;
          if(check==""){ 
          alert("Debe seleccionar al menos una categoria");
          return false;
      }
      
  }
       
        </script>
        
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
        <%--   <script type="text/javascript" language="javascript">
       function nobackbutton(){//funcion que evita que se pueda regresar
   window.location.hash="no-back-button";
   window.location.hash="Again-No-back-button" //chrome
   window.onhashchange=function(){window.location.hash="no-back-button";}
}
        </script>--%>
        
        <%
        ResultSet rs;
      buscar bu = new buscar();
      perfil per=new perfil();
     //  String vac="";
       HttpSession sesion=request.getSession(true);
      String ses=(String)sesion.getAttribute("usuario");
      per=bu.verEspecifico(ses);
      String ima=per.getImagen();
  //     if(ses==vac||ses==(null)){
  //   int a=JOptionPane.showOptionDialog(null,"El sitio solicita que inicie sesiòn", "Error de sesión",JOptionPane.YES_NO_OPTION, JOptionPane.INFORMATION_MESSAGE, null, null, null);
  //  if(a==0){ response.sendRedirect("IniciarSesion.jsp"); } 
  //  else{response.sendRedirect("indexDes.jsp");}
  //   } else{%>

   
    
    </head>
    <body background="http://localhost/Imagenes/Fondos-de-pantallaPrincipal.jpg">
     <div id="cabezera"><img src="http://localhost/Imagenes/iconoJuego.png"><img src="http://localhost/Imagenes/TPlay.jpg">
            <div id="buscar"> <form name="juegos" action="traerJuego.jsp" method="post">
                    <table> <tr>    <td><input type="text" name="criterio" class="criterio" id="criterio" style="width: 100px;border-radius: 25px;" placeholder="Buscar juegos :"/></td>
<%--<input type="image" src="http://localhost/Imagenes/search.png" class="image_buscar">--%>
                            <td><input type="image" src="http://localhost/Imagenes/lupaBuscar.jpg" width="30" height="25" style="position: absolute; top: 3px;"> </td> 
 </tr></table>       
    </form></div>
                            <div id="iniciarSesion" style="float: right; height: 500px"> 
          <a href="FinSession"> Cerrar Sesion :<img src="http://localhost/Imagenes/cerrar-sesion-icono.png" class="otromin"></a><br><br>  
          <a href="MiPerfil.jsp">Mi perfil<img src="http://localhost/Imagenes/<%=ima%>" class="otromin"></a>
      </div> 
          </div>                  
                            
                            <div id="inicio"><a href="indexDes.jsp" style="color: #FFFFFF;">
                <img id="mifoto" src="http://localhost/Imagenes/home.png" class="otromin">
                <font style="position: absolute; top:15px;left: 30px;">Inicio</a></div>
   <div id="reloj" class="reloj" style="position: absolute;left: 750px;top: 100px;">
              <embed src="http://www.clocklink.com/clocks/5005-white.swf?TimeZone=UYT&"  width="140" height="50" wmode="transparent" type="application/x-shockwave-flash">
          </div>
        
      <div id="medio">  
          <div id="DistintoResto" style="position: absolute;left: 220px;">
                       <div id="mostrar">
                           <form action="recibeprobarMultipart.jsp" method="post"  enctype="multipart/form-data" onsubmit="return controlar();">
                Nombre del Juego : <input type="text" name="nombreJuego" id="nombreJuego" class="texto" required="" ><br>
               Numero de version :<input type="text" name="numeroVersion" id="numeroVersion" class="texto" required=""><br>
               Tamaño (kb) :<input type="text" name="tamaño"  id="tamaño" class="texto" required=""><br>
               Direccion del archivo :<input type="text" name="archivo"  id="archivo" class="texto" required=""><br>
               Precio (u$u) :<input type="text" name="precio"  id="precio" class="texto" required=""><br>
               Descripcion del Juego <input type="text" name="descripcion"  id="descripcion" class="texto" required=""><br>
               <input type="text" id="opcion" hidden="hidden" ><br>
               
               </div>
              <div id="otro">
  
                  <%--  <form name="miform" action="recibeprobarMultipart.jsp" method="post" enctype="multipart/form-data">--%>
     Seleccione Imagen : <input name="myFile" type="file" id="myFile" required="required" class="texto"/><img id="imgSalida" width="70" height="70" src="" />
  <br>
            
        
              </div>
          </div>
               <div id="DistintoCategoria">  
               Categorias :<br>

                <%
                   
                    rs = bu.traerCategorias();
                     while (rs.next()) {%>           

                     <input type="checkbox" name="michek[]" class="texto"  id="michek" value="<%=rs.getString("tipo")%>"><%=rs.getString("tipo")%><br>       
                <%}%> 
                <input type="submit" value="Alta Juego" class="texto"> 
            </form> </div> 
             </div> 
                
                    <div id="pie"><font id="mifuente">@2014 TPlay Store
            <font id="segundafuente"><a href="indexDes.jsp" style="color: #FFFFFF;">Home</a>
        </div> 
    </body>
    <% //} %>
</html>
