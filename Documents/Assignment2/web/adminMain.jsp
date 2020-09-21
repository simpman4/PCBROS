<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>Main</title>
        <style>
            td {
                padding-bottom: 10px;
            }
            .adminButton {
                font-size: 15px;
            }
        </style>
    </head>
    
    <body>
        <% 
            User admin = (User) session.getAttribute("admin");
        %>
        <header>
            <h1>Administration</h1>
            <div class="logout" style="top: 20px; right: 5px;">
                <a class="button" style="font-size: 17px" href="AdminLogoutServlet">Logout</a>
            </div>
        </header>
        <table style="border-spacing: 20px;">
            <tr>
                <td class ="admintd"><a class="button adminButton" href="#">User Management</a></td>
                <td class ="admintd"><a class="button adminButton" href="#">Customer Management</a></td>
                <td class ="admintd"><a class="button adminButton" href="#">Staff Management</a></td>
            </tr>
            <tr>
                <td class ="admintd"><a class="button adminButton" href="supplierManagement.jsp">Supplier Management</a></td>
                <td class ="admintd"><a class="button adminButton" href="#">Data Management</a></td>
                <td class ="admintd"><a class="button adminButton" href="#">BI & Reporting</a></td>
            </tr>
        </table>
        
    </body>
</html>
