package uts.isd.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.dao.*;
import uts.isd.model.User;

public class RegisterServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        
        //String type = request.getParameter("type");
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String fullName = request.getParameter("fullName");
        String street = request.getParameter("streetLine1");
        String suburb = request.getParameter("streetLine2");
        String state = request.getParameter("state");
        String dob = request.getParameter("dob");
        String postcode = request.getParameter("postcode");
        String phoneNum = request.getParameter("phoneNum");
        
        DBManager manager = (DBManager) session.getAttribute("manager");

        if(!validator.validateEmail(email)) {
            session.setAttribute("emailErr", "Error: Email format incorrect...");
            request.getRequestDispatcher("register.jsp").include(request, response);
        } else if (!validator.validatePassword(password)) {
            session.setAttribute("passErr", "Error: Password format incorrect...");
            request.getRequestDispatcher("register.jsp").include(request, response);
        } else if (!validator.validateName(fullName)) {
            session.setAttribute("nameErr", "Error: Name format incorrect...");
            request.getRequestDispatcher("register.jsp").include(request, response);
        } else {
            try {
                if (manager.checkCustomer(email, password)) {
                    session.setAttribute("existErr", " User already exists!");
                    request.getRequestDispatcher("register.jsp").include(request, response);
                } else {
                    manager.addCustomer(email, password, fullName, street, suburb, state, postcode, dob, phoneNum);
                    User customer = new User(email, password, fullName, street, suburb, state, postcode, dob, phoneNum);
                    session.setAttribute("customer", customer);
                    request.getRequestDispatcher("customerMain.jsp").include(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        validator.clear(session);
        
    }

}
