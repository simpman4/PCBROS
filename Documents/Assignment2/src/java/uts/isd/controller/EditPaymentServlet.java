/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
*/

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

public class EditPaymentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    HttpSession session = request.getSession();
    String CardNumber = request.getParameter("CardNumber");
    DBManager manager = (DBManager) session.getAttribute("manager");
            
    
    Payment payment = null;
    try {
    payment = manager.findPayment(CardNumber);
    if (payment != null) {
    session.setAttribute("payment", payment);
    request.getRequestDispatcher("editPayment.jsp").include(request, response);
} else {
        session.setAttribute("existErr", "Student does not exist in the Database!");
        request.getRequestDispatcher("editPayment.jsp").include(request, response);
    }
    
} catch (SQLException ex) {
     Logger.getLogger(EditPaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
     System.out.println(ex.getErrorCode() + " and " + ex.getMessage());
}

request.getRequestDispatcher("editPayment.jsp").include(request, response);
}
}
