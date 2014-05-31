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
        <link href="EstiloUnico.css" rel="stylesheet">
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
             } else{%>
             
            <div id="iniciarSesion" style="float: right; height: 500px">
          <a href="MiPerfil.jsp">Mi perfil<img src="http://localhost/Imagenes/<%=ima%>" class="min"></a>
          
          <a href="FinSession"> Cerrar Sesion :<img src="http://localhost/Imagenes/cerrar-sesion-icono.png" width="30" height="30"></a><br>  
   </div>        
        <div id="tamaño">
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
            %>  
        </div>
            
    </body>
    <%}%>
</html>
