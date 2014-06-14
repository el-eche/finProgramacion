<%-- 
    Document   : probarArrays
    Created on : 12/06/2014, 04:08:31 PM
    Author     : pico
--%>

<%@page import="conexion.buscar"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script language="JavaScript" type="text/javascript" src="jquery.js"></script>
        
        <script>
       function controlar(){ 
          var check = $("input[type='checkbox']:checked").length;
          if(check==""){ 
          alert("Debe seleccionar al menos una categoria");
      }
      else{
       var categorias = new Array();
       
        $("input[type='checkbox']:checked").each(function() {
          categorias.push($(this).val());
        });
       alert(categorias);
       document.getElementById("opcion").value=categorias;
       
       
    //    var dataString="opcion="+categorias;
 // $.ajax({
  //      type:"POST",
   //     url:"probarArrays",
    //    data:dataString,
    //    });
        
     var nombre=document.getElementById("nombre").value;
     var apellido=document.getElementById("apellido").value;
     texto=document.getElementById("opcion").value
     var ajax_data={
         "nombre":nombre,
         "apellido":apellido,
         "categorias":texto,
     };
  
        $.ajax({
        type:"POST",
        url:"probarArrays",
        data:ajax_data,
        });
    
  }
       }
        </script>
    </head>
    <body>
        <%
        ResultSet rs;
        buscar bu=new buscar();
        %>
       <div id="medio">  
          <div id="DistintoResto" style="position: absolute;left: 220px;">
                       <div id="mostrar">
            <form action="" method="post">
                <input type="text" id="nombre">
                <input type="text" id="apellido">
                <input type="text" id="opcion">
               </div>
              <div id="avizo">
            </div>
          </div>
               <div id="DistintoCategoria">  
               Categorias :<br>

                <%
                   
                    rs = bu.traerCategorias();
                     while (rs.next()) {%>           

                     <input type="checkbox" name="michek[]" id="michek" value="<%=rs.getString("tipo")%>"><%=rs.getString("tipo")%><br>       
                <%}%> 
                <input type="submit" value="Alta Juego" onclick="controlar();"> 
            </form> </div> 
             </div> 
    </body>
</html>
