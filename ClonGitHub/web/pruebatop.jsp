<%-- 
    Document   : pruebatop
    Created on : 03/06/2014, 12:57:45 AM
    Author     : pico
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Logica.*"%>
<%@page import="conexion.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="EstiloPruebas.css" rel="stylesheet"> 
        <script language="JavaScript" type="text/javascript" src="jquery.js" charset="utf-8"></script>
        <script type="text/javascript">
        </script>
        
    </head>
    <body>
        <div id="cabezera"><img src="http://localhost/Imagenes/iconoJuego.png"><img src="http://localhost/Imagenes/TPlay.jpg">
            <div id="buscar"> <form name="juegos" action="traerJuego.jsp" method="post">
                    <table> <tr>    <td><input type="text" name="criterio" class="criterio" id="criterio" style="width: 100px;border-radius: 25px;" placeholder="Buscar juegos :"/></td>
<%--<input type="image" src="http://localhost/Imagenes/search.png" class="image_buscar">--%>
                            <td><input type="image" src="http://localhost/Imagenes/lupaBuscar.jpg" width="30" height="25" style="position: absolute; top: 3px;"> </td> 
 </tr></table>       
    </form></div>
        <div id="inSesion">
            <a href="IniciarSesion.jsp"> Crear Cuenta :<img src="http://localhost/Imagenes/Registrarse.png" width="20" height="20"></a><br><br>
                <a href="IniciarSesion.jsp"> Iniciar Sesion :<img src="http://localhost/Imagenes/sesion.png" width="20" height="20"></a> 
                   </div>
                            
</div>
        <div id="inicio"><a href="indexDes.jsp" style="color: #FFFFFF;">
                <img id="mifoto" src="http://localhost/Imagenes/home.png" width="30" height="30">
                <font style="position: absolute; top:15px;left: 30px;">Inicio</a></div>
        
       
                            
                            <div id="medio">
            <div id="categoria">
                 <form>
            <table>
                <tr><h3><font color="red">Categorias</font></h3></tr>
        <%
ResultSet rs;
String tipo="";
        buscar bu=new buscar();
        rs=bu.traerCategorias();
        while(rs.next()){ %>           
  
            <tr><td><input type="submit" name="caja" id="caja" class="button" value="<%=rs.getString("tipo")%>" 
     style="border-radius: 25px; opacity: 0.8;height: 25px;"></td></tr>       
       <%}%> 
            </table>
            </form>
            </div>
            
            
                                
            
           
                                <div id="resto">
               <% 
    //  HttpSession sesion=request.getSession();
   //   ResultSet res=(ResultSet)sesion.getAttribute("Resultado");
                String va="";
                String estado="Aprobada";
     String v=request.getParameter("caja"); 
     int a=bu.idCategoria(v);
     for(int i=0;i<bu.JuegoCategoria(a).size();i++){
      String nom=bu.JuegoCategoria(a).get(i).getNombre();
      String ur=bu.JuegoCategoria(a).get(i).getImagen(); 
      String des=bu.JuegoCategoria(a).get(i).getDesarrollador();
      int num=bu.numeroJuego(nom);
      int uno=0;
      ResultSet res=bu.traerVersiones(num);
      while(res.next()){
        String est=res.getString("estado");
        if(est.equals(estado)){
        
        
      
      
      
  // response.reset();
//response.setContentType("image/jpeg");  
  %>

<div id="marcar" class="marcar" style="float: right;">  
 <a href="mostrarJuego.jsp?juego=<%=nom%>"><br/><font color="red"><%=nom%><br/>
 <img class="min" src="http://localhost/Imagenes/<%=ur%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
 <br>Desarollador :<br/><font color="red"><%=des%><br/>
    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
</a>
</div>
   <% }//fin if est
      }//fin while res
  }%>
      </div>  
                            </div>     
                
                
                
                
                
                
                
                
                
                
                
                
        
        <div id="pie"><font id="mifuente">@2014 TPlay Store
            <font id="segundafuente"><a href="indexDes.jsp" style="color: #FFFFFF;">Home</a>
        </div> 
    </body>
</html>
