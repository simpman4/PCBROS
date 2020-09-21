<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.Supplier"%>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>Supplier Management</title>
        <style>
            .navButton {
                font-size: 15px;
            }
            td {
                padding: 0; 
                border: 0;
            }
        </style>
    </head>
    
    <body>
        <% 
            User admin = (User) session.getAttribute("admin");
            String supplierAdded = (String) session.getAttribute("supplierAdded");
            String supplierDeleted = (String) session.getAttribute("supplierDeleted");
        %>
        <header>
            <div style="position: absolute; top: 20px; left: 5px;">
                <a class="button" style="font-size: 17px;" href="adminMain.jsp">< Back</a>
            </div>
            <h1>Supplier Information Management</h1>
            <div class="logout" style="top: 20px; right: 5px">
                <a class="button" style="font-size: 17px;" href="AdminLogoutServlet">Logout</a>
            </div>
        </header>
        
        <table style="border-spacing: 10px; margin-bottom: 0; padding-bottom: 0;">
            <tr>
                <td><form action="ViewSuppliersServlet" method="post"><input class="button navButton" type="submit" value="View All Suppliers"></form></td>
                <td><a class="button navButton" href="addSupplier.jsp">Add Supplier</a></td>
                <td><a class="button navButton" href="editSupplier.jsp">Edit Supplier Information</a></td>
            </tr>
        </table>
        
        <p style="color: #333333;"><span><%=(supplierAdded != null ? supplierAdded : "")%></span><span><%=(supplierDeleted != null ? supplierDeleted : "")%></span></p>
        
    </body>
</html>
