
package mi_servlet;

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
public class Servlet5 extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher rd = null; // esta clase es la que vamos a poder llamar al servlet2
        try ( PrintWriter out = response.getWriter()) {
         String opcion="";
           if((opcion = request.getParameter("cmdOperacion")) != null){
                String numero = request.getParameter("txtNumero");
                 double numeros = Double.parseDouble(numero);
                 double r =0;
                 
                switch (opcion){
                    
                    case "RAIZ": r= Math.sqrt(numeros);break;
                    case "CUADRADO": r= Math.pow(numeros,2);break;  
                    case "CUBICO": r= Math.pow(numeros,3);break;                          
                               
                }
                request.setAttribute("resultado", String.valueOf(r)); // creamos la variable 'resultado' que contiene el valor 'r'
                request.setAttribute("numero", numero);
                rd = request.getRequestDispatcher("ServLet/servlet2.jsp");// hacemos la conexion
               rd.include(request,response); // rd tiene que incluir request y response
           
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
