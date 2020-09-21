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
public class CusDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        try {
        
                manager.deleteCustomer(email);
                request.getRequestDispatcher("LogoutServlet").include(request, response);
                
                //session.setAttribute("deleted", "delete was successful");
                
            
            

                    
            }catch (SQLException ex){Logger.getLogger(CusDeleteServlet.class.getName()).log(Level.SEVERE, null, ex);
        
        
        }
                   response.sendRedirect("LogoutServlet");
      
        
    }
}

  
    
