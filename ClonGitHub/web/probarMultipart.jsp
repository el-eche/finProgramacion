<%-- 
    Document   : probarMultipart
    Created on : 27/05/2014, 09:41:37 PM
    Author     : pico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="miform" action="recibeprobarMultipart" method="multipart/from-data">
            <input type="file" name="mifoto" id="mifoto">
            <input type="checkbox" name="micheck" value="uno">
            <input type="checkbox" name="micheck" value="dos">
            <input type="checkbox" name="micheck" value="tres">
            <input type="checkbox" name="micheck" value="cuatro">
            <input type="submit">  
        </form>
    </body>
</html>
