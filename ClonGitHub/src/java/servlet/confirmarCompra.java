/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;
import Logica.*;
import conexion.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
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
@WebServlet(name = "confirmarCompra", urlPatterns = {"/confirmarCompra"})
public class confirmarCompra extends HttpServlet {

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
        HttpSession sesion=request.getSession(true);
        String user=(String)sesion.getAttribute("usuario");
       String jue=request.getParameter("juego");
       
      int a=JOptionPane.showOptionDialog(null,"Desea confirmar la siguiente compra \nJuego : "+jue+"\nUsuario:  "+user, "Confirmar Compra",JOptionPane.OK_CANCEL_OPTION, JOptionPane.INFORMATION_MESSAGE, null, null, null);
      if(a==2){response.sendRedirect("indexDes.jsp");}
      else{
          buscar bu=new buscar();
          guardar gu=new guardar();
          int numj=bu.numeroJuego(jue);
          
          if(bu.existeCompra(numj, user)){

          JOptionPane.showMessageDialog(null,"Lo sentimos pero usted yá a comprado este juego\nDescargué la ultima version del juego");
          response.sendRedirect("mostrarJuego.jsp?juego="+jue);
          }else{
              compra com=new compra();
                     //Instanciamos el objeto Calendar
        //en fecha obtenemos la fecha y hora del sistema
        Calendar fecha = new GregorianCalendar();
        //Obtenemos el valor del año, mes, día,
        //hora, minuto y segundo del sistema
        //usando el método get y el parámetro correspondiente
        int año = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH);
        int dia = fecha.get(Calendar.DAY_OF_MONTH);
        mes=mes+1;
        String fechaCompra=año+"-"+mes+"-"+dia;
        com.setCliente(user);
        com.setId_juego(numj);
        com.setFecom(fechaCompra);
        gu.guardarCompra(com);
      response.sendRedirect("indexDes.jsp");
          }
      
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
