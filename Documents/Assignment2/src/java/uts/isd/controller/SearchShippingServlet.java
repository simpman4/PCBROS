
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
import uts.isd.model.Shipping;
import uts.isd.model.*;

import uts.isd.model.dao.DBManager;

public class SearchShippingServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        Validator validator = new Validator();
        
        int shipping_id = 0;
        if(request.getParameter("shipping_id") !=null){
         shipping_id = Integer.parseInt(request.getParameter("shipping_id"));
       // String date = request.getParameter("date");
        }
        try {
            Shipping shipping = manager.findShipping(shipping_id);
            if (shipping !=  null) {
                request.setAttribute("shipping", shipping);
               
             
                  
                request.getRequestDispatcher("editShipping.jsp").forward(request, response);
            } else {
                session.setAttribute("existErr", " Shipping does not exist!");
                request.getRequestDispatcher("editShipping.jsp").forward(request, response);
            }     
        } catch (SQLException ex) {
            Logger.getLogger(SearchSupplierServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        validator.clear(session);
    }
}
