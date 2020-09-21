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
import uts.isd.model.Product;

/**
 *
 * @author Ethan
 */
public class AddProductServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        
        String productName = request.getParameter("productName");
        String deviceType = request.getParameter("deviceType");
        String unitPrice = request.getParameter("unitPrice");
        String quantity = request.getParameter("quantity");
        
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        try {
            manager.addProduct(productName, deviceType, unitPrice, quantity);
            session.setAttribute("addedProductMsg", "Product Added");
            request.getRequestDispatcher("staffMain.jsp").include(request, response);
        }
        
        catch (SQLException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
       
       validator.clear(session);
    }
}
