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
           <% 
               HttpSession sesion=request.getSession(true);
        String user=(String)sesion.getAttribute("usuario"); 
               int orden=1;
               String estado="Pendiente";
               buscar bu=new buscar();   
               guardar gu=new guardar();
               juego juego=new juego();
               String rec="";
               juego.setDesarrollador(user);
               version version=new version();
               version.setEstado(estado);
               version.setOrdenalta(orden);
               version.setRechazo(rec);
                String nomb="",numver="",tama="",pre="",arch="",desc="",opc="";
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
                            if(fileItemTemp.getFieldName().equals("nombreJuego")){
                            nomb=fileItemTemp.getString();
                            juego.setNombre(nomb);
                            }else
                             if(fileItemTemp.getFieldName().equals("numeroVersion")){
                            numver=fileItemTemp.getString();
                            version.setId_version(numver);
                            }else
                                 if(fileItemTemp.getFieldName().equals("tamaño")){
                            tama=fileItemTemp.getString();
                            version.setTamaño(tama);
                            }else
                             if(fileItemTemp.getFieldName().equals("archivo")){
                           arch=fileItemTemp.getString();
                           juego.setImagen(arch);
                           version.setDescarga(arch);
                            }else
                                 if(fileItemTemp.getFieldName().equals("precio")){
                           pre=fileItemTemp.getString();
                           double precio=Double.parseDouble(pre);
                           juego.setPrecio(precio);
                            }else
                             if(fileItemTemp.getFieldName().equals("descripcion")){
                            desc=fileItemTemp.getString();
                            juego.setDescripcion(desc);
                           if(bu.existeJuego(nomb)==false){
                           gu.guardarJuego(juego);
                           a=bu.numeroJuego(nomb);
                       
                           version.setId_juego(a);
                           
                           }
                             
                             }
                             
                             else
                                 if(fileItemTemp.getFieldName().equals("michek[]")){
                            opc=fileItemTemp.getString();
                            String opcion=new String(opc.getBytes(),"UTF-8");
                                    
                            StringTokenizer tokens = new StringTokenizer(opcion,",");
                             while(tokens.hasMoreTokens()){
        
        String var=tokens.nextToken();
        int cat=bu.idCategoria(var);
       gu.juegoXcategoria(a, cat);
        }
                            }

                    } 
                          else  {fileItem = fileItemTemp;}
                }
                if (fileItem != null) {
                    juego ju=new juego();
                    ju=bu.traerJuegoxNumero(a);
                    String fileName = fileItem.getName();
                    juego.setImagen(fileName);
                    gu.agregarImagenJuego(ju.getNombre(), fileName);
                    gu.guardarVersion(version);
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
