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

public class DeleteSupplierServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        String companyName = request.getParameter("companyName");
        
        try {
            manager.deleteSupplier(companyName);
            session.setAttribute("supplierDeleted", "Supplier Deleted!");
            request.getRequestDispatcher("supplierManagement.jsp").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteSupplierServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        validator.clear(session);
    }
}
