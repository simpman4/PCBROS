/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Access;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author Ethan
 */
public class AccessLogsSearchServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
       
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        String login_time = request.getParameter("login_time");
        
        
        
        try {
            Access access = manager.findAccessLog(login_time);
            if( access != null) {
                request.setAttribute("access", access);
                request.getRequestDispatcher("accessTest.jsp").forward(request, response);
            } 
            
            else {
                session.setAttribute("existErr", "Access Time does not exist");
                request.getRequestDispatcher("accessTest.jsp").forward(request, response);
            }
                
        }
        
        catch (SQLException ex) {
                Logger.getLogger(AccessLogsSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
       
        validator.clear(session);
    
    }
    
}
