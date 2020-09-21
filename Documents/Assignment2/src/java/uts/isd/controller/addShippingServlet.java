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
import uts.isd.model.Shipping;

public class addShippingServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        //String type = request.getParameter("type");
        
        
        String street = request.getParameter("street");
        String suburb = request.getParameter("suburb");
        String state = request.getParameter("state");
        String postcode = request.getParameter("postcode");
        String method =request.getParameter("method");
        String date = request.getParameter("date");
        
        DBManager manager = (DBManager) session.getAttribute("manager");
        


            try {
                
                
            
               
        
                    manager.addShipping(street, suburb, state, postcode, method, date);
                   // Shipping shipping = new Shipping(shipping_id, street, suburb, state, postcode, method, date);
                  //session.setAttribute("shipping", shipping);
                    request.getRequestDispatcher("shippingMain.jsp").include(request, response);
               }
       catch (SQLException ex) {
               Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }