/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.dao.DBManager;
import uts.isd.model.Shipping;


/**
 *
 * @author Ethan
 */
public class UpdateShippingServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        
        String street = request.getParameter("street");
        String suburb = request.getParameter("suburb");
        String state = request.getParameter("state");
        String postcode = request.getParameter("postcode"); 
        String method = request.getParameter("method"); 
        String date = request.getParameter("date"); 

        DBManager manager = (DBManager) session.getAttribute("manager");
        
        try {
           manager.updateShipping(street,suburb,state,postcode,method,date);
           session.setAttribute("shippingUpdated", "Shipping Updated");
           request.getRequestDispatcher("editShipping.jsp").include(request, response);
        }
        
        catch (SQLException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
       
        validator.clear(session);
    
    }
    
}
