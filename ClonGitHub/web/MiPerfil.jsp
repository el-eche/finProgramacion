<%-- 
    Document   : MiPerfil
    Created on : 21/05/2014, 06:40:59 PM
    Author     : pico
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="conexion.*"%>
<%@page import="Logica.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="EstiloUnico.css" rel="stylesheet"> 
        <title>Mi Perfil</title>
        <%
            HttpSession sesion=request.getSession(true);
        %>
    </head>
   
    <body background="http://localhost/Imagenes/Fondos-de-pantallaPrincipal.jpg" style="background-attachment: fixed; opacity: 0.8;">
      <%
      calculoEdad ed=new calculoEdad();
        String us=(String)sesion.getAttribute("usuario");
        perfil per=new perfil();
        buscar bu=new buscar();
        per=bu.verEspecifico(us);
        String nic=per.getNick();
        String ema=per.getEmail();
        String nom=per.getNombre();
        String ape=per.getApellido();
        String fech=per.getFechanac();
        int edad=ed.getedad(fech);
        String ima=per.getImagen();
        String tip=per.getTipo();
        String desa="Desarrollador";
       
        %>
        <h2>Mis Datos</h2>
        <div id="mostrar" style="float:left; background: #ccc; height:auto ">
            <h4>Nick : <%=nic%></h4>
            <h4>Correo Electronico : <%=ema%></h4>
            <h4>Nombre : <%=nom%></h4>
            <h4>Apellido : <%=ape%></h4>
            <h4>Tipo : <%=tip%></h4>
            <h4>Fecha de Nacimiento : <%=fech%></h4>
            <h4>Edad : <%=edad%></h4>
            <h4>Imagen <img src="http://localhost/Imagenes/<%=ima%>" width="80" height="80"/></h4>
        <%
        
        if(per.getTipo().equals(desa)){
        String web=per.getLinkweb();
        ResultSet rs,otrors;
        int jue;
        rs=bu.juegoXdesarrollador(nic);
        while(rs.next()){
        jue=rs.getInt("id_juego");
       String nomju=rs.getString("nombre");
        %>
                        <table>
            <%
            String pendiente="Pendiente";
            String rechazada="Rechazada";
        otrors=bu.traerVersiones(jue);
        while(otrors.next()){
        String idv=otrors.getString("id_version");
        String est=otrors.getString("estado");
        String mot=otrors.getString("rechazo");
        if(est.equals(pendiente)||est.equals(rechazada)){%>
        <tr>
                 <td><h4>Nombre Juego <%=nomju%></h4></td></tr>
                                   
 <tr> <td>   <h4>Version :<%=idv%></h4></td>
            <td>   <h4>Estado :<%=est%></h4></td>&nbsp;&nbsp;<%
            if(est.equals(rechazada)){
            %>
            <td><h4>&nbsp;&nbsp;  Motivo : <%=mot%></h4></td></tr>
                                    
            <%}
        
        }
        }
        }
       
        }
    %>  
  </tr></table>
        </div>
    </body>
</html>
