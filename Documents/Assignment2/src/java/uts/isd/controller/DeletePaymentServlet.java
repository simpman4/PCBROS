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

public class DeletePaymentServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ValidatorPayment validator2 = new ValidatorPayment();
        
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        String CardNumber = request.getParameter("CardNumber");
        
        try {
            manager.deletePayment(CardNumber);
            session.setAttribute("CardNumberDeleted", "Payment Details Deleted!");
            request.getRequestDispatcher("paymentMain.jsp").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DeletePaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        validator2.clear2(session);
    }
}
