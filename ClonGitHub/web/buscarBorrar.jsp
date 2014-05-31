<%-- 
    Document   : buscarBorrar
    Created on : 09/05/2014, 03:32:39 PM
    Author     : pico
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link type="text/css" href="otroEstilo.css" rel="stylesheet">
        <script language="JavaScript" type="text/javascript" src="jquery.js" charset="utf-8"></script>
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

</head>

<body>
    
    <div style="float: left;" class="buscador">
    
    <!-- este div contendrá el listado de coincidencias -->
    
    <!-- este input contendra el criterio a buscar en autocompletado -->
   <%
 String dato=request.getParameter("dato");
if(dato==null){
%>
<input type="text" name="criterio" class="criterio" id="criterio" />
<input type="image" src="http://localhost/Imagenes/search.png" class="image_buscar">
    <%   
}else{%>
<input type="text" name="criterio" class="criterio" id="criterio" value="<%=dato%>"/>
<input type="image" src="http://localhost/Imagenes/search.png" class="image_buscar">
<% }
%>
    

    </div><br>

    <br><div id="opciones"></div>
    </body>
</html>
