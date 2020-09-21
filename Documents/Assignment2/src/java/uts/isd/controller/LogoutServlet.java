package uts.isd.controller;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;

public class LogoutServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("customer");
        String email = user.getEmail();
        String type = user.getType();
        DBManager manager = (DBManager) session.getAttribute("manager");
        Date now = new Date();
        Date creationTimeUnf = new Date(session.getCreationTime() );
                        DateFormat formatter = DateFormat.getDateTimeInstance(DateFormat.MEDIUM,DateFormat.MEDIUM);
                        formatter.format(creationTimeUnf);
        try {
            manager.addLog(email,formatter.format(creationTimeUnf), formatter.format(now), type);
            session.invalidate();
        } catch (SQLException ex) {
            Logger.getLogger(LogoutServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        request.getRequestDispatcher("index.jsp").include(request, response);
    }
}
