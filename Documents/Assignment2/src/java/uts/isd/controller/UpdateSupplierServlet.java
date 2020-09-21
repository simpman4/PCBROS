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
import uts.isd.model.Supplier;
import uts.isd.model.dao.DBManager;

public class UpdateSupplierServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        Validator validator = new Validator();

        String contactName = request.getParameter("contactName");
        String companyName = request.getParameter("companyName");
        String email = request.getParameter("email");
        String street = request.getParameter("streetLine1");
        String suburb = request.getParameter("streetLine2");
        String state = request.getParameter("state");
        String postcode = request.getParameter("postcode");
        boolean status = false;
        if (request.getParameter("status") != null) {
            status = true;
        }
        
        try {
            if (validator.validateEmail(email) && validator.validateName(contactName)) {
                manager.updateSupplier(contactName, companyName, email, street, suburb, state, postcode, status);
                session.setAttribute("supplierUpdated", "Supplier Updated!");
                request.getRequestDispatcher("SearchSupplierServlet").include(request, response);
            } else {
                session.setAttribute("supplierUpdated", "Update Failed!");
                request.getRequestDispatcher("SearchSupplierServlet").include(request, response);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AddSupplierServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        validator.clear(session);
    }
}
