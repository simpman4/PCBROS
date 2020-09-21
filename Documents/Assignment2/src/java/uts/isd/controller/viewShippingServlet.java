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
import uts.isd.model.dao.*;
import uts.isd.model.Shipping;


public class viewShippingServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        try {
            ArrayList<Shipping> shippings = manager.fetchShipping();
            request.setAttribute("shippings", shippings);
            request.getRequestDispatcher("viewShipping.jsp").forward(request, response);
        } catch (SQLException ex) {
                Logger.getLogger(ViewSuppliersServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
