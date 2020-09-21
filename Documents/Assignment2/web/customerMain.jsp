<%@page import="uts.isd.model.User"%>
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
            User customer = (User) session.getAttribute("customer");
        %>
        <header>
            <div class="logout" style="top: 20px; left: 5px; text-align: left;">
                <a class="button" style="font-size: 17px" href="customerAccount.jsp">Account</a>
            </div>
            <h1>IoTBay</h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right">
                <a class="button" style="font-size: 17px" href="LogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 50px"><%=customer.getEmail()%></p>
            </div>
            
        </header>
        <h1>Welcome, ${customer.name} </h1>
        <p>You are now logged in as ${customer.email}, down below you can see your registration details:</p>
        
      <table style="width:100%">
          <tr>
              <th>Name</th>
              <th>Email</th> 
              <th>Password</th>
              <th>Phone Number</th>
              <th>Postal Address</th>
              <th>Type</th>
          </tr>
          <tr>
              <td>${customer.name}</td>
              <td>${customer.email}</td>
              <td>${customer.password}</td>
              <td>${customer.phoneNum}</td>
              <td>${customer.street} , ${customer.suburb} , ${customer.postcode}, ${customer.state}</td>
              <td>${customer.type}</td>
          </tr>
      </table>

        <table>
            <tr>
                <td><form action="ViewProductServlet" method="post"><input type="submit" class="button" href="viewProducts.jsp" value="View Products"></form></td>
                <td><a class="button" href="customerProductSearch.jsp">Search for Product</a></td>
            </tr>
        </table> 
        
        
        
        
    </body>
</html>
