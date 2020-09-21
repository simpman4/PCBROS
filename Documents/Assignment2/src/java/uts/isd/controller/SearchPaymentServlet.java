
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
import uts.isd.model.Payment;
import uts.isd.model.dao.DBManager;

public class SearchPaymentServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        ValidatorPayment validator2 = new ValidatorPayment();
        
        String CardNumber = request.getParameter("CardNumber");

        try {
            Payment payment = manager.findPayment(CardNumber);
            if (payment !=  null) {
                request.setAttribute("payment", payment);
                request.getRequestDispatcher("editPayment.jsp").forward(request, response);
            } else {
                session.setAttribute("existErr", " Payment does not exist!");
                request.getRequestDispatcher("editPayment.jsp").forward(request, response);
            }     
        } catch (SQLException ex) {
            Logger.getLogger(SearchPaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        validator2.clear2(session);
    }
}
