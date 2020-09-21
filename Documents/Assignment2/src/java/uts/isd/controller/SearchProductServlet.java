/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Product;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author Ethan
 */
public class SearchProductServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
       
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        String productName = request.getParameter("productName");
        
        
        
        try {
            Product product = manager.findProduct(productName);
            if( product != null) {
                request.setAttribute("product", product);
                request.getRequestDispatcher("updateProductSearch.jsp").forward(request, response);
            } 
            
            else {
                session.setAttribute("existErr", "Product does not exist");
                request.getRequestDispatcher("updateProductSearch.jsp").forward(request, response);
            }
                
        }
        
        catch (SQLException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
       
        validator.clear(session);
    
    }
    
}
