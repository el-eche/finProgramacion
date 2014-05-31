<%-- 
    Document   : probarPosicion
    Created on : 30/04/2014, 09:12:25 AM
    Author     : pico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <link type="text/css" href="otroEstilo.css" rel="stylesheet">
          
        <script language="JavaScript" type="text/javascript" src="jquery.js" charset="utf-8"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function autocompletar(){
                var autocom=document.getElementById("autocom").value;
                var lista=document.getElementById("lista");
                document.getElementById("lista").style.display="";
      document.getElementById("lista").value=autocom;
                
            }
        function foco(){
            document.getElementById("tablaJuegos").focus();
        }    
            
        </script>
         <script type="text/javascript">
    $(document).ready(function(){
        $('#buscar').keyup(function(){
            
            var juego=$(this).val();
            if(juego.length>=2){
                
            dataString='juego='+juego;
            $.ajax({
             type:"POST",
             url:"buscarJuego",
             data:dataString,
             success:function (data){
                 $("#Info").fadeIn(1000).html(data);
                     //Al hacer click en algua de las sugerencias
              //  $("#area").click( function(){
                    //Obtenemos la id unica de la sugerencia pulsada
                    
              //     var id = $(this).val();
               //    document.write(id);
                    //Editamos el valor del input con data de la sugerencia pulsada
                //    $('#buscar').val(id);
                    //Hacemos desaparecer el resto de sugerencias
               //    $('#Info').fadeOut(1000);
            //  });   
                 
             }
            });}
            else
            if(juego.length<2){
            document.getElementById("Info").value="";
            
}
        });
    });
    
    $(document).ready(function(){
     $("#mitabla").click(function(){
         elegido=$(this).val();
         document.write(elegido);
         
     });
    
    });
    
    
        </script>     
    </head>
    <body>
    <div class="buscador">
        <form name="auto" action="buscarJuego" method="post">
            <input type="text" class="buscar" name="buscar" id="buscar" autocomplete="off" onblur="$('#mitabla').focus();">
        <input type="image" src="http://localhost/Imagenes/search.png" class="image_buscar">
        <div id="Info" actions="mostrarid(this.val());"></div>
    </form>
</div>
        
       
        <%-- <form name="auto" action="buscarJuego" method="post">
            <input type="text" name="autocom" id="autocom" autocomplete="off">
            <input type="text" name="lista" id="lista" style="display: none">
        </form>--%>

    </body>
</html>
