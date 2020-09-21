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
public class ViewProductServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
       
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        
        
        try {
            ArrayList<Product> products = manager.fetchProducts();
            request.setAttribute("products", products);
            request.getRequestDispatcher("viewProducts.jsp").include(request, response);
        }
        
        catch (SQLException ex) {
                Logger.getLogger(ViewProductServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
       
        validator.clear(session);
    
    }
    
}
