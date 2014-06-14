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
      <meta content="text/html; charset=iso-8859-1" http-equiv=Content-Type>
       <link type="text/css" href="EstiloPruebas.css" rel="stylesheet"> 
    </head>
    <body>
   <div id="cabezera"><img src="http://localhost/Imagenes/iconoJuego.png"><img src="http://localhost/Imagenes/TPlay.jpg">
            <div id="buscar"> <form name="juegos" action="traerJuego.jsp" method="post">
                    <table> <tr>    <td><input type="text" name="criterio" class="criterio" id="criterio" style="width: 100px;border-radius: 25px;" placeholder="Buscar juegos :"/></td>
<%--<input type="image" src="http://localhost/Imagenes/search.png" class="image_buscar">--%>
                            <td><input type="image" src="http://localhost/Imagenes/lupaBuscar.jpg" width="30" height="25" style="position: absolute; top: 3px;"> </td> 
 </tr></table>       
    </form></div>
      
                            

       
         
        <%
            buscar bu=new buscar();
            HttpSession se=request.getSession(true);
            String us=(String)se.getAttribute("usuario");
            String pas=(String)se.getAttribute("pass");%>
      <%
       if(us==null||us==""){%>
  <div id="inSesion">
            <a href="IniciarSesion.jsp"> Crear Cuenta :<img src="http://localhost/Imagenes/Registrarse.png" width="20" height="20"></a><br><br>
                <a href="IniciarSesion.jsp"> Iniciar Sesion :<img src="http://localhost/Imagenes/sesion.png" width="20" height="20"></a> 
                   </div>
       <%}else
       {
       perfil per=bu.verEspecifico(us);
       String ima=per.getImagen();
       %>
      <div id="iniciarSesion" style="float: right; height: 500px"> 
          <a href="FinSession"> Cerrar Sesion :<img src="http://localhost/Imagenes/cerrar-sesion-icono.png" class="otromin"></a><br><br>  
          <a href="MiPerfil.jsp">Mi perfil<img src="http://localhost/Imagenes/<%=ima%>" class="otromin"></a>
      </div> 
           
       <%}%>
    
     <div id="inicio" style="top: 110px;left: 120px;"><a href="indexDes.jsp" style="color: #FFFFFF;">
                <img id="mifoto" src="http://localhost/Imagenes/home.png" class="otromin">
                <font style="position: absolute; top:15px;left: 30px;">Inicio</a></div>
          <div id="reloj" class="reloj" style="position: absolute;left: 750px;top: 100px;">
              <embed src="http://www.clocklink.com/clocks/5005-white.swf?TimeZone=UYT&"  width="140" height="50" wmode="transparent" type="application/x-shockwave-flash">
          </div>
   </div>
       
        <div id="medio">
            <div id="categoria" style="top: 5px;">
                 
            </div>
   
                                <div id="resto" style="top: 5px;">
              
      
       
       
       
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
    <h4>Descripcion del juego </h4>
    Nombre : <%=ju%>&nbsp;&nbsp;
    Imagen : <img src="http://localhost/Imagenes/<%=imagen%>" class="otromin"/><br/> 
    Precio (U$): <%=precio%><br/> 
   Descripcion : <%=descripcion%><br/> 
   Desarrollador : <%=desarrollador%>&nbsp;&nbsp;
 <img src="http://localhost/Imagenes/<%=imaDes%>" class="otromin"/><br/> 
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
    <h4>Para utilizar todas las funcionalidades de este sitio debes<br>
    <a href="IniciarSesion.jsp"> iniciar sesion</a> ó<a href="IniciarSesion.jsp"> crear una cuenta</a>. Gracias </h4>           

  <%  }%>
  
  </div>  
                            </div>
  
    <div id="pie"><font id="mifuente">@2014 TPlay Store
            <font id="segundafuente"><a href="indexDes.jsp" style="color: #FFFFFF;">Home</a>
        </div> 
    </body>
    <%--                           --%>
</html>
