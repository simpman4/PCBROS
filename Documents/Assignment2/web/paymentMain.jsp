<%-- 
    Document   : CRUDS
    Created on : 30 May 2020, 2:06:17 pm
    Author     : Joshua
--%>

<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>Payment Main</title>
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
            String PaymentAdded = (String) session.getAttribute("PaymentAdded");
            String CardNumberDeleted = (String) session.getAttribute("CardNumberDeleted");
        %>
        <header style="margin-bottom: 20px;">
            <div style="position: absolute; top: 20px; left: 5px;">
                <a class="button" style="font-size: 17px;" href="customerAccount.jsp">< Back</a>
            </div>
            <h1>Payment Management</h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right">
                <a class="button" style="font-size: 17px" href="LogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 50px"><%=customer.getEmail()%></p>
            </div>
        </header>
        <a class="button" href="createPayment.jsp">Add New Payment</a>
        <a class="button" href="editPayment.jsp">Edit Payment Details</a>
        <p style="color: #333333;"><span><%=(PaymentAdded != null ? PaymentAdded : "")%></span></p>
        <p style="color: #333333;"><span><%=(CardNumberDeleted != null ? CardNumberDeleted : "")%></span></p>

    </body>
</html>
