<%-- 
    Document   : customerProductSearch
    Created on : Jun 8, 2020, 12:52:12 PM
    Author     : Ethan
--%>

<%@page import="uts.isd.model.User"%>
<%@page import="uts.isd.model.Access"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>Main</title>
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
        <% 
            String existErr = (String) session.getAttribute("existErr");
            User customer = (User) session.getAttribute("customer");
            User staff = (User) session.getAttribute("staff");
            
        if (customer == null && staff != null) { %>
        <header>
            <div style="position: absolute; top: 20px; left: 5px;">
                <a class="button" style="font-size: 17px;" href="staffMain.jsp">< Back</a>
            </div>
            <h1>Search Access Logs</h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right">
                <a class="button" style="font-size: 17px" href="StaffLogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 50px"><%=staff.getEmail()%></p>
            </div>
        </header>
        <% } else { %>
        <header>
            <div style="position: absolute; top: 20px; left: 5px;">
                <a class="button" style="font-size: 17px;" href="customerAccount.jsp">< Back</a>
            </div>
            <h1>Search Access Logs</h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right">
                <a class="button" style="font-size: 17px" href="LogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 50px"><%=customer.getEmail()%></p>
            </div>
        </header>
        <% } %>
            
        <h3 style="text-align: center;"> <span class="message"> <%=(existErr != null ? existErr : "")%></span> </h3>
        <form action="AccessLogsSearchServlet" method="post">
            <table style="padding: 10px; border-spacing: 5px; margin-left:auto;margin-right:auto;">
                <tr>
                    <td> <input class="inputText" type="text" placeholder="(xxxx/xx/xx) + time" id="login_time" name="login_time" required/></td>
                    <td style="padding-left: 0;"> <input class="button" type="submit" value="Search"/> </td>
                </tr>
            </table>
        </form>
            
                
        <% Access access = (Access) request.getAttribute("access"); 
        if (access != null) { %>
        
            <table style="padding: 10px; border-spacing: 5px; margin-left:auto;margin-right:auto;">
                   <tr style="background-color: #efefef;">
                       <td style="padding: 15px;"><%=access.getEmail()%></td>
                       <td style="padding: 15px;"><%=access.getLogin_time()%></td>
                       <td style="padding: 15px;"><%=access.getLogout_time()%></td>
                       <td style="padding: 15px;"><%=access.getType()%></td>      
                   </tr>
                <% } %>
            </table>
            
            
            <% if (customer != null && staff == null) { %>
            <form action="ViewAccessServlet" method="post" ><input class="button" type="submit" value="Show All Access Logs"></form>
            <% } else { %>
            <form action="StaffAccessServlet" method="post" ><input class="button" type="submit" value="Show All Access Logs"></form>
            <% } %>
       
    </body>
</html>
