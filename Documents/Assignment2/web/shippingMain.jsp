<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>Shipping Details</title>
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
        <% User customer = (User) session.getAttribute("customer"); %>
        <header>
            <div style="position: absolute; top: 20px; left: 5px;">
                <a class="button" style="font-size: 17px;" href="customerAccount.jsp">< Back</a>
            </div>
            <h1>Shipping Details</h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right">
                <a class="button" style="font-size: 17px" href="LogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 50px"><%=customer.getEmail()%></p>
            </div>
        </header>

        <p style="text-align: center; font-family: arial">Saved shipping details<span class="message"></span></p>

        <table>
             <tr>
                 <td><a class="button" href="addShipping.jsp">Add</a></td>
                 <td><a><form action="viewShippingServlet" method="post"><input class="button navButton" type="submit" value="View All Suppliers"></form></a></td>
                 <td><a class="button" href="editShipping.jsp">Search</a></td>
                 <td><a class="button" href="deleteShipping">Delete</a></td>
             </tr>
        </table>                                
            
    </body>
</html>

