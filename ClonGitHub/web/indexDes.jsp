<%-- 
    Document   : pruebatop
    Created on : 03/06/2014, 12:57:45 AM
    Author     : pico
--%>
<%@page import="javax.swing.JOptionPane"%>
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
        
        <script src="http://www.clocklink.com/embed.js"></script><script type="text/javascript" language="JavaScript"></script>
        
        <script type="text/javascript">
 $(document).ready(function(){
     $("#criterio").keyup(function(){
       var criterio=$(this).val();
       dataString='criterio='+criterio;
       $.ajax({
           url:"BuscarBorrar2.jsp",
           type:"POST",
           data:dataString,
           success:function (data){
               $("#opciones").fadeIn(1000).html(data);
           }
       });
     });
 });
</script>
   <script type="text/javascript">
           function traerMisJuegos(){
           $.ajax({
              type:"POST",
              url:"MisJuegos.jsp",
              data:"",
              success:function (data){
                  $("#resto").fadeIn(1000).html(data);
              }
               
           });
           }  
         
           
           </script>
           <script type="text/javascript">
            function traerJuegosparaComprar(){
           $.ajax({
              type:"POST",
              url:"comprarJuegos.jsp",
              data:"",
              success:function (data){
                  $("#resto").fadeIn(1000).html(data);
              }
               
           });
           }  
           </script>
        <%
        HttpSession sesion=request.getSession(true);
        String use=(String)sesion.getAttribute("usuario");
        buscar bu=new buscar();
        String tipo="";
        String ti="Desarrollador";
        String cli="Cliente";
        
        %>
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
            
           <%
       if(use==null||use==""){%>
       
                <a href="IniciarSesion.jsp"> Crear Cuenta :<img src="http://localhost/Imagenes/Registrarse.png" width="30" height="30"></a><br>
                <a href="IniciarSesion.jsp"> Iniciar Sesion :<img src="http://localhost/Imagenes/sesion.png" width="30" height="30"></a><br>  
                 
       <%}else
       {
       perfil per=bu.verEspecifico(use);
       String ima=per.getImagen();
      tipo=per.getTipo();
       %>
      
       <a href="MiPerfil.jsp">Mi perfil<img src="http://localhost/Imagenes/<%=ima%>" width="30" height="25"></a><br>
          
          <a href="FinSession"> Cerrar Sesion :<img src="http://localhost/Imagenes/cerrar-sesion-icono.png" width="30" height="30"></a><br>  
 
           
       <%}%>   </div>
                            
</div>
        <div id="inicio"><a href="indexDes.jsp" style="color: #FFFFFF;">
                <img id="mifoto" src="http://localhost/Imagenes/home.png" width="30" height="30">
                <font style="position: absolute; top:15px;left: 30px;">Inicio</a>
        
        <%if(tipo.equals(ti)){%>    
           
           <div id="otro" style="position: absolute;left: 100px;width: 600px;">
          <a href="altaJuego.jsp" >Agregar Juegos Nuevo</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="AltaVersion.jsp" >Alta Version Nueva</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="#" onclick="traerMisJuegos();">Todos mis Juegos</a> 
          <div id="reloj" class="reloj" style="position: absolute;left: 520px;top: -10px;">
              <embed src="http://www.clocklink.com/clocks/5005-white.swf?TimeZone=UYT&"  width="140" height="50" wmode="transparent" type="application/x-shockwave-flash">
          </div>
           
           </div>
           <%}else if(tipo.equals(cli)){%>     
         <div id="otrootro" style="position: absolute;left: 100px;width: 600px;">   
          <a href="#" onclick="traerMisJuegos();">Mis Compras de Juegos</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="#" onclick="traerJuegosparaComprar();">Comprar Juego</a>&nbsp;&nbsp;&nbsp;&nbsp
         <div id="reloj" class="reloj" style="position: absolute;left: 520px;top: -10px;">
              <embed src="http://www.clocklink.com/clocks/5005-white.swf?TimeZone=UYT&"  width="140" height="50" wmode="transparent" type="application/x-shockwave-flash">
          </div>
         </div>
      <%}else{%>
      <div style="position: absolute;top: -30px;left: 100px;width: 500px;">
      <h4 >Para utilizar todas las funcionalidades de este sitio debes
    <a href="IniciarSesion.jsp"> iniciar sesion</a> ó<a href="IniciarSesion.jsp"> crear una cuenta</a>. Gracias </h4>
      <div id="reloj" class="reloj" style="position: absolute;left: 520px;top: 20px;">
              <embed src="http://www.clocklink.com/clocks/5005-white.swf?TimeZone=UYT&"  width="140" height="50" wmode="transparent" type="application/x-shockwave-flash">
          </div>
      </div>           

<%}%>
       
        
        
        </div>
        
       
                            
                            <div id="medio">
            <div id="categoria">
                 <form>
            <table>
                <tr><h3><font color="red">Categorias</font></h3></tr>
        <%
ResultSet rs;     
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
      int cont=0;
      ResultSet res=bu.traerVersiones(num);
      while(res.next()){
        String est=res.getString("estado");
        if(est.equals(estado)){
      
        
      
      
      
  // response.reset();
//response.setContentType("image/jpeg");  
  %>
  <div id="cuadro" class="cuadro" style=" width: 140px;
    height: 160px; 
    float: right;">
<div id="marcar" class="marcar" >  
 <a href="mostrarJuego.jsp?juego=<%=nom%>"><br/><font color="red"><%=nom%><br/>
 <img class="min" src="http://localhost/Imagenes/<%=ur%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
 <br>Desarollador :<br/><font color="red"><%=des%><br/>
    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
</a>
</div></div>
    <%                   }//fin if est
      }//fin while res
  }%>
      </div>  
                            </div>     
                
                
                
                
                
                
                
                
                
                
                
                
        
        <div id="pie"><font id="mifuente">@2014 TPlay Store
            <font id="segundafuente"><a href="indexDes.jsp" style="color: #FFFFFF;">Home</a>
        </div> 
    </body>
</html>
