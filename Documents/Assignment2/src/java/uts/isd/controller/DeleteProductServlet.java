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
public class DeleteProductServlet extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        Validator validator = new Validator();
        
        String productName = request.getParameter("productName");
       
        
        
        
        try {
            Product product = manager.findProduct(productName);
            if (product != null) {
                manager.deleteProduct(productName);
                session.setAttribute("deletedProductMsg", "Product Deleted");
                request.getRequestDispatcher("staffMain.jsp").include(request, response);
            }
            
            else {
                session.setAttribute("existErr", "Product does not exist");
                request.getRequestDispatcher("deleteProducts.jsp").include(request, response);
            }
            
        }
        
        catch (SQLException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
       
        validator.clear(session);
    
    }
    
}
