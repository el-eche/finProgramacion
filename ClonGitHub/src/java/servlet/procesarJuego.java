/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import Logica.juego;
import Logica.version;
import conexion.buscar;
import conexion.guardar;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.StringTokenizer;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author pico
 */
@WebServlet(name = "procesarJuego", urlPatterns = {"/procesarJuego"})
public class procesarJuego extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession sesion=request.getSession(true);
        String user=(String)sesion.getAttribute("usuario"); 
        String nomb=request.getParameter("nombreJuego");
        String vers=request.getParameter("numeroVersion");
        String dire=request.getParameter("archivo");
        String pre=request.getParameter("precio");
      
        double pr=Double.parseDouble(pre);
        String des=request.getParameter("descripcion");
        String tama=request.getParameter("tamaño");
        String opciones=request.getParameter("opciones");
        StringTokenizer tokens = new StringTokenizer(opciones,",");
//        String[] opcion=opciones.split(",");
        guardar gu=new guardar();
        buscar bu=new buscar();
        juego ju=new juego();
        user="yo";
        ju.setjuego(nomb, pr, des, user, dire);
        gu.guardarJuego(ju);
        int a=bu.numeroJuego(nomb);
//        for(int i=0;i<opcion.length;i++){
//            String var=new String(opcion[i].getBytes(),"UTF-8");//soluciona tildes y ñ.
//            JOptionPane.showMessageDialog(null, var);
//            int cat=bu.idCategoria(var);
//        }
        while(tokens.hasMoreTokens()){
        
        String var=tokens.nextToken();
        int cat=bu.idCategoria(var);
       gu.juegoXcategoria(a, cat);
        }
        int orden=1;
        String esta="Pendiente";
        String rech="";
        version ve=new version(a,vers ,orden, esta, rech, tama, dire);
   
        gu.guardarVersion(ve);     
      response.sendRedirect("cargarImagenJuego.jsp");
     
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
