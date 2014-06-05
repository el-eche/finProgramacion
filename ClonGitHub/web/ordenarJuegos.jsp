<%-- 
    Document   : ordenarJuegos
    Created on : 04/06/2014, 09:08:47 AM
    Author     : pico
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="conexion.*"%>
<%@page import="Logica.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
     <%
         String alfa="Alfabetica";
         String venta="Ventas";
         String menostres="menostres";
         String menosdies="menosdiez";
         String masdies="masdiez";
        String val=request.getParameter("juego");
        String nom=request.getParameter("nombre");
        buscar bu=new buscar();
        
        ResultSet rs;
        if(val.equals(menostres)){
            rs=bu.juegosPrecioMenorTres(nom);
           while(rs.next()){
            String nombre=rs.getString("nombre");
            String ur=rs.getString("imagen");
            double pre=rs.getDouble("precio");
            int num=bu.numeroJuego(nombre);
            ResultSet otrosr=bu.traerCat(num);
           
        %>
        
          <div id="divotromarcar" class="divotromarcar">  
 <br/><font color="red"><%=nombre%><br/>
 <img class="otromin" src="http://localhost/Imagenes/<%=ur%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
 <br/><font color="red">Precio u$u<%=pre%> /<%while(otrosr.next()){
            String cate=otrosr.getString("tipo");%><%=cate%> ,<% }//fin while otrosr%>
    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
     <br/> </div>&nbsp;&nbsp;
      
           <%  
   }//fin while rs
         
        }//fin if menostres
    else  if(val.equals(menosdies)){
            rs=bu.juegosPrecioMenorDiez(nom);
           while(rs.next()){
            String nombre=rs.getString("nombre");
            String ur=rs.getString("imagen");
            double pre=rs.getDouble("precio");
            int num=bu.numeroJuego(nombre);
            ResultSet otrosr=bu.traerCat(num);
            
        %>
        
          <div id="divotromarcar" class="divotromarcar">  
 <br/><font color="red"><%=nombre%><br/>
 <img class="otromin" src="http://localhost/Imagenes/<%=ur%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
 <br/><font color="red">Precio u$u<%=pre%> /<%while(otrosr.next()){
            String cate=otrosr.getString("tipo");%><%=cate%> ,<% }//fin while otrosr%>
    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
     <br/> </div>&nbsp;&nbsp;
      
           <%  
   }//fin while rs
         
        }//fin if menosdiez
       else    if(val.equals(masdies)){
            rs=bu.juegosPrecioMayorDies(nom);
           while(rs.next()){
            String nombre=rs.getString("nombre");
            String ur=rs.getString("imagen");
            double pre=rs.getDouble("precio");
            int num=bu.numeroJuego(nombre);
            ResultSet otrosr=bu.traerCat(num);
           
        %>
        
          <div id="divotromarcar" class="divotromarcar">  
 <br/><font color="red"><%=nombre%><br/>
 <img class="otromin" src="http://localhost/Imagenes/<%=ur%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
 <br/><font color="red">Precio u$u<%=pre%> /<%while(otrosr.next()){
            String cate=otrosr.getString("tipo");%><%=cate%> ,<% }//fin while otrosr%>
    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
     <br/> </div>&nbsp;&nbsp;
      
           <%  
   }//fin while rs
         
        }//fin if menosdies
        else    if(val.equals(alfa)){
            rs=bu.juegoAutoNombre(nom);
           while(rs.next()){
            String nombre=rs.getString("nombre");
            String ur=rs.getString("imagen");
            double pre=rs.getDouble("precio");
            int num=bu.numeroJuego(nombre);
            ResultSet otrosr=bu.traerCat(num);
           
        %>
        
          <div id="divotromarcar" class="divotromarcar">  
 <br/><font color="red"><%=nombre%><br/>
 <img class="otromin" src="http://localhost/Imagenes/<%=ur%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
 <br/><font color="red">Precio u$u<%=pre%> /<%while(otrosr.next()){
            String cate=otrosr.getString("tipo");%><%=cate%> ,<% }//fin while otrosr%>
    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
     <br/> </div>&nbsp;&nbsp;
      
           <%  
   }//fin while rs
         
        }//fin if alfa
        
         else    if(val.equals(venta)){
            rs=bu.juegoXventas(nom);
           while(rs.next()){
            String nombre=rs.getString("nombre");
            String ur=rs.getString("imagen");
            double pre=rs.getDouble("precio");
            int num=bu.numeroJuego(nombre);
            ResultSet otrosr=bu.traerCat(num);
           
        %>
        
          <div id="divotromarcar" class="divotromarcar">  
 <br/><font color="red"><%=nombre%><br/>
 <img class="otromin" src="http://localhost/Imagenes/<%=ur%>" 
 onmouseover="this.style.opacity=0.5" onmouseout="this.style.opacity=1"  alt="#"/>
 <br/><font color="red">Precio u$u<%=pre%> /<%while(otrosr.next()){
            String cate=otrosr.getString("tipo");%><%=cate%> ,<% }//fin while otrosr%>
    <%--  <img class="min" src="http://localhost/Imagenes/<%=ur%>"width="100" 
     height="100" onmouseover="this.width=150;this.height=150;"  onmouseout="this.width=100;this.height=100;" alt="#"/>	--%>				
     <br/> </div>&nbsp;&nbsp;
      
           <%  
   }//fin while rs
         
        }//fin if menosdies
        
%>   
    </body>
</html>
