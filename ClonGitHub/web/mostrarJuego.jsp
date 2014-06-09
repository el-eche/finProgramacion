<%-- 
    Document   : mostrarJuego
    Created on : 25/04/2014, 09:35:53 AM
    Author     : pico
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.*"%>
<%@page import="Logica.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
      
      <title>Mostrar Juego</title>
        <LINK href="estilo.css" rel="stylesheet" type="text/css">
      <meta content="text/html; charset=iso-8859-1" http-equiv=Content-Type>
    </head>
    <body id="MiBody" background="http://www.fotos-bonitas.com/wp-content/uploads/2014/01/Fondos-de-pantalla-gratis.jpg" style="background-attachment: fixed">
  
         
        <%
            buscar bu=new buscar();
            HttpSession se=request.getSession(true);
            String us=(String)se.getAttribute("usuario");
            String pas=(String)se.getAttribute("pass");%>
      <%
       if(us==null||us==""){%>
        <div id="iniciarSesion" style="float: right; height: 500px">
                <a href="IniciarSesion.jsp"> Crear Cuenta :<img src="http://localhost/Imagenes/Registrarse.png" width="30" height="30"></a><br><br>
                <a href="IniciarSesion.jsp"> Iniciar Sesion :<img src="http://localhost/Imagenes/sesion.png" width="30" height="30"></a><br>  
                   </div>
       <%}else
       {
       perfil per=bu.verEspecifico(us);
       String ima=per.getImagen();
       %>
      <div id="iniciarSesion" style="float: right; height: 500px">
          <a href="MiPerfil.jsp">Mi perfil<img src="http://localhost/Imagenes/<%=ima%>" class="min"></a>
          
          <a href="FinSession"> Cerrar Sesion :<img src="http://localhost/Imagenes/cerrar-sesion-icono.png" width="30" height="30"></a><br>  
   </div> 
           
       <%}%>
        <%
        
    String ju=request.getParameter("juego");
    juego Juego=new juego();
    Juego=bu.traerJuegoUn(ju);
    String desarrollador=Juego.getDesarrollador();
     String imagen=Juego.getImagen();
      String descripcion=Juego.getDescripcion();
       double precio=Juego.getPrecio();
    perfil per=new perfil();
    per=bu.verEspecifico(desarrollador);
    String imaDes=per.getImagen();
   
    int jue=bu.numeroJuego(ju);
    ResultSet rs=bu.traerCat(jue);
    boolean si=bu.existeCompra(jue, us);
     
    
    %>
    <h2>Descripcion del juego </h2>
   <h4> Nombre : <%=ju%><br/> 
    Imagen : <br/><img src="http://localhost/Imagenes/<%=imagen%>" width="60" height="60"/><br/> 
    Precio (U$): <%=precio%><br/> 
   Descripcion : <%=descripcion%><br/> 
     Desarrollador : <%=desarrollador%><br/>
 <img src="http://localhost/Imagenes/<%=imaDes%>" width="60" height="60"/><br/> 
  <br/> Categorias : <br/>
    <%
    while(rs.next()){
    String tip=rs.getString("tipo");
    %>
    <%=tip%><br/> 
   <% }%>
   
  
   <% String estado="Aprobada";
   String otraver="";
    ResultSet res=bu.traerVersiones(jue);
    ResultSet otrores=bu.traerVersiones(jue);
   int ord=0;
   int orden=0;
   int otrord=0;
   while(otrores.next()){//acá me quedo con el mayor orden de alta que esté aprobado
        String esta=otrores.getString("estado");
       String vera=otrores.getString("id_version");
       if(esta.equals(estado)){
           orden=otrores.getInt("ordenalta");
          if(otrord<orden){
           otrord=orden;
           
          }
            
         }//fin if est.equals
       }//fin otrores 

       while(res.next()){
       String est=res.getString("estado");
       String ver=res.getString("id_version");
       ord=res.getInt("ordenalta");
        String desca=res.getString("linkdescarga");
        String tama=res.getString("tamaño");
       if(est.equals(estado)&&ord==otrord){%>
           
    <br/> Ultima Version Aprobada : <%=ver%><br>
       Tamaño(kb) :&nbsp;&nbsp;&nbsp;&nbsp;<%=tama%><br>     
      <% if(si==true){%>
         <a href="<%=desca%>">Descarga Aquí </a>
 
       <% } }//fin if est.equals
           
           
       }   //fin while res
       
   %>
   
  <br/>  Comentarios : <br/>
   <table  border="5">
 <%  ArrayList<comentario> comenta=bu.comentarioXjuego(jue);
              for(comentario Comentario: comenta){
  int com=Comentario.getId_juego();
   String texto=Comentario.getTexto();
   String fecha=Comentario.getFecha();
   String cliente=Comentario.getCliente();
   %>
   <tr BGCOLOR="#ccc">
       <td>
       <%=com%>    
       </td><td>
       <%=cliente%>    
       </td><td>
       <%=texto%>    
       </td><td>
       <%=fecha%> </td>
          <table BGCOLOR="#fff">    
            <%  
          ArrayList<comentario> comen=bu.comentarioHijos(com);
          if(comen!=null){for(comentario Comenta: comen){ 
              com=Comenta.getId_juego();
              cliente=Comenta.getCliente();
              texto=Comenta.getTexto();
              fecha=Comenta.getFecha();
         %>
         
          
   <tr><td>Respuesta </td>
       <td> <%=com%></td>
       <td><%=cliente%>    
       </td><td>
       <%=texto%>    
       </td><td>
       <%=fecha%></td>         
   <table BGCOLOR="#fff">    
            <%  
          ArrayList<comentario> come=bu.comentarioHijos(com);
          if(comen!=null){for(comentario Comen: come){ 
              com=Comen.getId_juego();
              cliente=Comen.getCliente();
              texto=Comen.getTexto();
              fecha=Comen.getFecha();
         %>
         
          
   <tr><td>Respuesta </td>
       <td> <%=com%></td>
       <td><%=cliente%>    
       </td><td>
       <%=texto%>    
       </td><td>
       <%=fecha%></td><br> </tr> </table> 
 
           <%
              
          }}%><br> </tr> </table> 
 
           <%
              
          }}%></td></tr>
                   
             
 <%  }%><h4> </table>
   
 <%
    if(us==null&&pas==null){%>
    <h2>Para utilizar todas las funcionalidades de este sitio debes<br>
    <a href="IniciarSesion.jsp"> iniciar sesion</a> ó<a href="IniciarSesion.jsp"> crear una cuenta</a>. Gracias </h2>           

  <%  }%>
    </body>
</html>
