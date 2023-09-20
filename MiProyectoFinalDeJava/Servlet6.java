/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package mi_servlet;

import entrada.Metodos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pedro
 */
public class Servlet6 extends HttpServlet {

   
    public double[] convertirCartesianaToPolar(double x, double y) {
        double[] res = new double[2];
        double radio = Metodos.redondear_decimal(Math.sqrt(x * x + y * y));
        double angulo = Metodos.redondear_decimal(Math.atan(y / x) * 180 / Math.PI);
        res[0] = radio;
        res[1] = angulo;
        return res;
    }



    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher rd = null;
        try ( PrintWriter out = response.getWriter()) {
            
            
             String x = "";
            String y = "";
            String r = "";
            String a = "";
            String m = "";
            if(request.getParameter("cmdCalcular") != null){
                
                try {
                    x = request.getParameter("txtX");
                    y = request.getParameter("txtY");

                    //PROCESO                    
                    double[] res = convertirCartesianaToPolar(Double.parseDouble(x), Double.parseDouble(y));

                    //SALIDA    
                    
                    r = res[0] + "";
                    a = res[1] + "";
                    m= "OK";
                    
                    request.setAttribute("r",r);
                    request.setAttribute("a",a);
                    request.setAttribute("x",x);
                    request.setAttribute("y",y);
                    request.setAttribute("m",m);
                    
                    rd=  request.getRequestDispatcher("ServLet/servlet3.jsp");
                    rd.include(request, response);
                    
                } catch (Exception e) {
                    m = "ENTRADA INCORRECTA";
                }
                
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
