<%-- 
    Document   : accessLogs
    Created on : 06/06/2020, 1:21:45 PM
    Author     : napol
--%>

<%@page import="uts.isd.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" href="css/styles.css">

        <title>Access Logs</title>
        <style>
            .button {
                background-color: #009bc9;
            }
            .button:hover {
                background-color: grey;
            }
            header {
                background-color: #009bc9;
            }
        </style>
    </head>
    <body>
        <% User staff = (User)session.getAttribute("staff"); %>
        <header style="margin-bottom: 20px;">
            <div style="position: absolute; top: 20px; left: 5px;">
                <a class="button" style="font-size: 17px;" href="accessTest.jsp">< Back</a>
            </div>
            <h1>View Access Logs</h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right">
                <a class="button" style="font-size: 17px" href="StaffLogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 50px"><%=staff.getEmail()%></p>
            </div>
        </header>
        
        <p>Here are your access logs for your account. This should be used to show your account activity:</p>
        <table style="text-align: center; border-collapse: collapse; margin-top: 20px; margin-bottom: 20px; ">
            <tr style="background-color: grey; color:white; font-weight: bold;">                
                <td>Email</td>
                <td>Login Time</td>
                <td>Logout Time</td>
                <td>Type </td>
            </tr>
        
        
        
        
               <% 
            ArrayList<List<String>> accessLogs = (ArrayList<List<String>>) request.getAttribute("accessLogs");
                 for (List<String> accessLog : accessLogs) { %>
               
                <tr style="background-color: #efefef;">
                    <td style="padding: 8px"><%= accessLog.get(0)%></td>
                    <td style="padding: 8px"><%= accessLog.get(1)%></td>
                    <td style="padding: 8px"><%= accessLog.get(2)%></td>
                    <td style="padding: 8px"><%= accessLog.get(3)%></td>
                    
                    
                    
                </tr>
        <% } %>

        </table> 

        
        
    </body>
</html>
