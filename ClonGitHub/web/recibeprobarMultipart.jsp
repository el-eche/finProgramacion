<%-- 
    Document   : recibeprobarMultipart
    Created on : 27/05/2014, 09:42:02 PM
    Author     : pico
--%>

<%@page import="Logica.*"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="conexion.*"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
           <%  buscar bu=new buscar();   
               guardar gu=new guardar();
                String nomb="";
                int a=0;
                if (ServletFileUpload.isMultipartContent(request)) {
                    ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
                    List fileItemsList = servletFileUpload.parseRequest(request);
                    String optionalFileName = "";
                    FileItem fileItem = null;
                    Iterator it = fileItemsList.iterator();
                    while (it.hasNext()) {
                        FileItem fileItemTemp = (FileItem) it.next();
                        if (fileItemTemp.isFormField()) {
           
                            if(fileItemTemp.getFieldName().equals("nombre")){
                            nomb=fileItemTemp.getString();
                            a=Integer.parseInt(nomb);
                            }

                    } 
                          else  {fileItem = fileItemTemp;}
                }
                if (fileItem != null) {
                    juego ju=new juego();
                    ju=bu.traerJuegoxNumero(a);
                    String fileName = fileItem.getName();
                    
                    gu.agregarImagenJuego(ju.getNombre(), fileName);
                     String nombreArchivo = fileName;
                        StringTokenizer token = new StringTokenizer(nombreArchivo);
                        nombreArchivo = "";
                        while (token.hasMoreTokens()) {
                            nombreArchivo += token.nextToken();
                        }

      
// construimos un objeto file para recuperar el trayecto completo
                        File fichero = new File(fileName);
// nos quedamos solo con el nombre y descartamos el path
                        
                        fichero = new File("F:\\AppServ\\www\\Imagenes\\" + nombreArchivo); 
                    
// escribimos el fichero colgando del nuevo path
                        fileItem.write(fichero);

                } 
           
                        }
                else{
                JOptionPane.showMessageDialog(null,"No es multipart");
                }
             response.sendRedirect("indexDes.jsp");
                
            %>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
