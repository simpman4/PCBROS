
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

public class SearchSupplierServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        Validator validator = new Validator();

        String companyName = request.getParameter("companyName");

        try {
            Supplier supplier = manager.findSupplier(companyName);
            if (supplier !=  null) {
                request.setAttribute("supplier", supplier);
                request.getRequestDispatcher("editSupplier.jsp").forward(request, response);
            } else {
                session.setAttribute("existErr", " Supplier does not exist!");
                request.getRequestDispatcher("editSupplier.jsp").forward(request, response);
            }     
        } catch (SQLException ex) {
            Logger.getLogger(SearchSupplierServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        validator.clear(session);
    }
}
