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
import uts.isd.model.dao.*;

public class AddSupplierServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
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
        
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        if(!validator.validateEmail(email)) {
            session.setAttribute("emailErr", "Error: Email format incorrect...");
            request.getRequestDispatcher("addSupplier.jsp").include(request, response);
        } else if (!validator.validateName(contactName)) {
            session.setAttribute("nameErr", "Error: Name format incorrect...");
            request.getRequestDispatcher("addSupplier.jsp").include(request, response);
        } else {
            try { 
                if (manager.checkSupplier(companyName)) {
                    session.setAttribute("existErr", " Supplier already exists!");
                    request.getRequestDispatcher("addSupplier.jsp").include(request, response);
                } else {
                    manager.addSupplier(contactName, companyName, email, street, suburb, state, postcode, status);
                    session.setAttribute("supplierAdded", "Supplier Added!");
                    request.getRequestDispatcher("supplierManagement.jsp").include(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(AddSupplierServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        validator.clear(session);
    }
}
