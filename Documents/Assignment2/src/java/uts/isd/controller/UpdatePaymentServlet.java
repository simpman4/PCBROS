
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Payment;
import uts.isd.model.dao.DBManager;
/**
 *
 * @author Joshua
 */
public class UpdatePaymentServlet extends HttpServlet {
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
HttpSession session = request.getSession();
     DBManager manager = (DBManager) session.getAttribute("manager");
        ValidatorPayment validator2 = new ValidatorPayment();

String CardNumber = request.getParameter("CardNumber");
String PaymentMethod = request.getParameter("PaymentMethod");    
String CVC = request.getParameter("CVC");
String ExpiryDate = request.getParameter("ExpiryDate");



 try {
            manager.updatePayment(CardNumber, PaymentMethod, CVC, ExpiryDate);
            session.setAttribute("PaymentUpdated", "Payment Updated!");
            request.getRequestDispatcher("SearchPaymentServlet").include(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(CreatePaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        validator2.clear2(session);
    }
}

