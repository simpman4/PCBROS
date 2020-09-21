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
/**
 *
 * @author napol
 */
public class EditCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        User customer = null;
        
        try {
            customer = manager.findCustomer(email, password);
            if (customer != null){
                session.setAttribute("customer", customer);
                request.getRequestDispatcher("editCustomer.jsp").include(request, response);
                 }  else {
                        session .setAttribute("existErr", "Customer does not exist in the Database!");
                        request.getRequestDispatcher("editCustomer.jsp").include(request, response);
            }
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(EditCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getErrorCode() + " and " + ex.getMessage());

        }
        request.getRequestDispatcher("editCustomer.jsp").include(request, response);

    }
}
