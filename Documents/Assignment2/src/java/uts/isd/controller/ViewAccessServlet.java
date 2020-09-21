/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author napol
 */
public class ViewAccessServlet extends HttpServlet {
   
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  HttpSession session = request.getSession();
  DBManager manager = (DBManager) session.getAttribute("manager");
 User user = (User) session.getAttribute("customer");
 String email = user.getEmail();
 
       try {
           ArrayList<List<String>> accessLogs = manager.fetchAccessLogs(email);
           
           request.setAttribute("accessLogs", accessLogs);
           request.getRequestDispatcher("accessLogs.jsp").include(request, response);
           
           
           
           
           
           
           
       } catch (SQLException ex) {
           Logger.getLogger(ViewAccessServlet.class.getName()).log(Level.SEVERE, null, ex);
       }
          
        
        
        
    }

}
