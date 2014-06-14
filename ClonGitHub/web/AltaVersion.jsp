<%-- 
    Document   : AltaVersion
    Created on : 28/05/2014, 07:03:10 PM
    Author     : pico
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.*"%>
<%@page import="Logica.*"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de Version</title>
        <link href="EstiloPruebas.css" rel="stylesheet">
        <script language="JavaScript" type="text/javascript" src="jquery.js" charset="utf-8"></script>
        <script type="text/javascript" language="javascript">

           
        </script>
    </head>
  <body background="http://localhost/Imagenes/Fondos-de-pantallaPrincipal.jpg">
  

                            
                            
                            
      
      
      <%       
            buscar bu=new buscar();
            String vac = "";
            HttpSession sesion = request.getSession();
            String ses = (String) sesion.getAttribute("usuario");
            perfil per=new perfil();
            per=bu.verEspecifico(ses);
            String ima=per.getImagen();
             if(ses==vac||ses==(null)){
             int a=JOptionPane.showOptionDialog(null,"El sitio solicita que inicie sesiòn", "Error de sesión",JOptionPane.YES_NO_OPTION, JOptionPane.INFORMATION_MESSAGE, null, null, null);
             if(a==0){ response.sendRedirect("IniciarSesion.jsp"); } 
             else{response.sendRedirect("indexDes.jsp");}
             } else{     %>
          
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
    
      <div id="medio" style="background: #999999;opacity: 0.8;">
          
     

            <%
                String nom, ur;
                String aproba = "Aprobada";
                int bol = 0;
                version ver = new version();
                ResultSet rs;
                ResultSet sr;
                rs = bu.juegoXdesarrollador(ses);
                while (rs.next()) {
                    int jue = rs.getInt("id_juego");
                    nom = rs.getString("nombre");
                    ur = rs.getString("imagen");
                    
                    sr = bu.traerVersiones(jue);
                    while (sr.next()) {
                        String ap = sr.getString("estado");
                       
                        if (ap.equals(aproba)) {bol=1;}
                
                        
                    }//fin while sr
            if(bol==1){ %>
             
                   <div id="marcar" class="marcar" style="float: right;">  
                       <a href="mostrar.jsp?juego=<%=nom%>"><br/><font color="red"><%=nom%><br/>
                    <img class="min" src="http://localhost/Imagenes/<%=ur%>" 
                         onmouseover="this.style.opacity = 0.5" onmouseout="this.style.opacity = 1"  alt="#"/>
                    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
                     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
                </a>
            </div>
            <% }
      }//fin while rs
                if(bol==0){%>
            <h3><font color="red">Todavia no tienes un juego con alguna version aprobada<br>
            Por dudas comunicate con el administrador de esta web. Gracias
            </h3>       
            <%}
            %>  
       
         </div>  
     
             <div id="pie"><font id="mifuente">@2014 TPlay Store
            <font id="segundafuente"><a href="indexDes.jsp" style="color: #FFFFFF;">Home</a>
        </div> 
            
    </body>
    <%}%>
</html>
