package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.dao.*;
import uts.isd.model.User;

public class LoginServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        User admin = new User();
        if (email.equals(admin.getEmail()) && password.equals(admin.getPassword())) {
            session.setAttribute("admin", admin);
            request.getRequestDispatcher("adminMain.jsp").include(request, response);
        } else {
            DBManager manager = (DBManager) session.getAttribute("manager");
            User customer;
            User staff;

            if(!validator.validateEmail(email)) {
                session.setAttribute("emailErr", "Error: Email format incorrect...");
                request.getRequestDispatcher("login.jsp").include(request, response);
            } else if (!validator.validatePassword(password)) {
                session.setAttribute("passErr", "Error: Password format incorrect...");
                request.getRequestDispatcher("login.jsp").include(request, response);
            } else {
                try {
                    customer = manager.findCustomer(email, password);
                    staff = manager.findStaff(email, password);
                    if (customer != null && staff == null) {
                        session.setAttribute("customer", customer);
                        request.getRequestDispatcher("customerMain.jsp").include(request, response);
                    } else if (staff != null && customer == null) {
                      session.setAttribute("staff", staff);
                      request.getRequestDispatcher("staffMain.jsp").include(request, response);
                    } else {
                        session.setAttribute("existErr", " User does not exist!");
                        request.getRequestDispatcher("login.jsp").include(request, response);
                    }
                } catch (SQLException | NullPointerException ex) {
                    System.out.println(ex.getMessage() == null ? "Customer does not exist" : "Weclome");
                }   
            }
            validator.clear(session);
        }
    }
}
