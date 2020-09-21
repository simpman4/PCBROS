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

public class CreatePaymentServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ValidatorPayment validator2 = new ValidatorPayment();
        
        String CardNumber = request.getParameter("CardNumber");
        String PaymentMethod = request.getParameter("PaymentMethod");
        String CVC = request.getParameter("CVC");
        String ExpiryDate = request.getParameter("ExpiryDate");
     
        
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        if(!validator2.validateCardNumber(CardNumber)) {
            session.setAttribute("CardNumberErr", "Error: Card Number format incorrect...");
            request.getRequestDispatcher("CreatePayment.jsp").include(request, response);
        } 
        else {
            try { 
                if (manager.checkPayment(CardNumber)) {
                    session.setAttribute("existErr", " Payment Information already exists!");
                    request.getRequestDispatcher("CreatePayment.jsp").include(request, response);
                } else {
                    manager.addPayment(CardNumber, PaymentMethod, CVC, ExpiryDate);
                    session.setAttribute("PaymentAdded", "Payment Added!");
                    request.getRequestDispatcher("paymentMain.jsp").include(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(CreatePaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        validator2.clear2(session);
    }
}