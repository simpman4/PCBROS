/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;



import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.dao.*;
import uts.isd.model.User;
import uts.isd.controller.Validator;

/**
 *
 * @author napol
 */

public class UpdateCustomerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
                    Validator validator = new Validator();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String street = request.getParameter("street");
        String suburb = request.getParameter("suburb");
        String state = request.getParameter("state");
        String postcode = request.getParameter("postcode");
        String dob = request.getParameter("dob");
        String phoneNum = request.getParameter("phoneNum");
        User customer = new User (email, password, name, street, suburb, state, postcode, dob, phoneNum);
        DBManager manager = (DBManager) session.getAttribute("manager");
                
        validator.clear(session);

        if(!validator.validateEmail(email)) {
            session.setAttribute("emailErr", "Error: Email format incorrect...");
            request.getRequestDispatcher("editCustomer.jsp").include(request, response);
        } else if (!validator.validatePassword(password)) {
            session.setAttribute("passErr", "Error: Password format incorrect...");
            request.getRequestDispatcher("editCustomer.jsp").include(request, response);
        } else if (!validator.validateName(name)) {
            session.setAttribute("nameErr", "Error: Name format incorrect...");
            request.getRequestDispatcher("editCustomer.jsp").include(request, response);
        } else {
        
        try {
            if (customer != null){
                session.setAttribute("customer", customer);
                manager.updateCustomer(email, password, name, street, suburb, state, postcode, dob, phoneNum);
                session.setAttribute("updated", "Update was successful");
                request.getRequestDispatcher("editCustomer.jsp").include(request, response);
                
            
            }   else    {
                    session.setAttribute("updated", "Updated was not succesful!");
                    request.getRequestDispatcher("editCustomer.jsp").include(request, response);
            
            
            }   

                    
            }catch (SQLException ex){Logger.getLogger(EditCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
        
        
        }
         response.sendRedirect("editCustomer.jsp");
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */

}
}