<%-- 
    Document   : customerSettings
    Created on : 04/06/2020, 5:34:20 PM
    Author     : napol
--%>
<%@page import="uts.isd.model.User"%>
 
        
        


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>Account Settings</title>
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
            User customer = (User) session.getAttribute("customer");
        %>
        <header>
            <div style="position: absolute; top: 20px; left: 5px;">
                <a class="button" style="font-size: 17px;" href="customerMain.jsp">< Back</a>
            </div>
            <h1>Customer Account</h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right">
                <a class="button" style="font-size: 17px" href="LogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 50px"><%=customer.getEmail()%></p>
            </div>
        </header>
        <table>
            <tr>
                <td><a class="button" href="shippingMain.jsp">Shipping Details</a></td>
                <td><a class="button" href="paymentMain.jsp">Payment Details</a></td>
                <td><a class="button" href="accessTest.jsp">Access Logs</a></td>
                <td><a class="button" href="EditCustomerServlet?email='<%=customer.getEmail()%>'&password='<%=customer.getPassword()%>'"> Edit Account</a></td>
                <td><a class="button" href="customerDelete.jsp">Delete account</a></td> 
            </tr>
        </table>
    </body>
</html>
