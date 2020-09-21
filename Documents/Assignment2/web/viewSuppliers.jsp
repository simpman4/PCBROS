<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.Supplier"%>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>All Suppliers</title>
        <style>
            td {
                padding: 15px;
                border: 1px solid #444444;
            }
        </style>
    </head>
    <body>
        <% 
            User admin = (User) session.getAttribute("admin");
        %>
        <header>
            <div style="position: absolute; top: 20px; left: 5px;">
                <a class="button" style="font-size: 17px;" href="supplierManagement.jsp">< Back</a>
            </div>
            <h1>All Suppliers</h1>
            <div class="logout" style="top: 20px; right: 5px">
                <a class="button" style="font-size: 17px;" href="AdminLogoutServlet">Logout</a>
            </div>
        </header>
        
        <table style="border-collapse: collapse; margin-top: 20px; margin-bottom: 20px; ">
            <tr style="background-color: grey; color: white; font-weight: bold;">
                <td>ID</td>
                <td>Contact Name</td>
                <td>Company Name</td>
                <td>Email</td>
                <td>Street</td>
                <td>Suburb</td>
                <td>State</td>
                <td>Postcode</td>
                <td>Status</td>
            </tr>
            <%  ArrayList<Supplier> suppliers = (ArrayList<Supplier>)request.getAttribute("suppliers"); 
                for (Supplier supplier : suppliers) { %>
                    <tr style="background-color: #efefef;">
                        <td style="padding: 8px;"><%=supplier.getId()%></td>
                        <td style="padding: 8px;"><%=supplier.getContactName()%></td>
                        <td style="padding: 8px;"><%=supplier.getCompanyName()%></td>
                        <td style="padding: 8px;"><%=supplier.getEmail()%></td>
                        <td style="padding: 8px;"><%=supplier.getStreet()%></td>
                        <td style="padding: 8px;"><%=supplier.getSuburb()%></td>
                        <td style="padding: 8px;"><%=supplier.getState()%></td>
                        <td style="padding: 8px;"><%=supplier.getPostcode()%></td>
                        <td <% if (supplier.isActive()) { %> style="background-color: green; padding: 8px; font-weight: bold; color: white;" <% } else { %> style="background-color: red; padding: 8px; font-weight: bold;" <% } %>><%=supplier.isActiveString()%></td>
                    </tr>
             <% } %>
            
        </table>
    </body>
</html>
