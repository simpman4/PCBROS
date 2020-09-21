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
    
    <body >
        
        <% 
            User staff = (User) session.getAttribute("staff");
            String addedProductMsg = (String) session.getAttribute("addedProductMsg");
            String deletedProductMsg = (String) session.getAttribute("deletedProductMsg"); 
        %>
        <header>
            <div class="logout" style="top: 15px; left: 5px; text-align: left;">
                <a class="button" style="font-size: 17px;" href="accessTest.jsp">Access Logs</a>
            </div>
            <h1>Staff Menu</h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right">
                <a class="button" style="font-size: 17px" href="StaffLogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 50px"><%=staff.getEmail()%></p>
            </div>
        </header>
        <h1>Welcome, ${staff.name} </h1>
        <p>You are now logged in as ${staff.email}, down below you can see your registration details:</p>
        
      <table style="width:100%">
          <tr>
              <th>ID</th>
              <th>Email</th> 
              <th>Name</th>
              <th>Password</th>
              <th>Position</th>
              <th>Phone</th>
              <th>Type</th>
          </tr>
          <tr>
              <td>${staff.id}</td>
              <td>${staff.email}</td>
              <td>${staff.name}</td>
              <td>${staff.password}</td>
              <td>${staff.position}</td>
              <td>${staff.phoneNum}</td>
              <td>${staff.type}</td>
          </tr>
        </table>
          
        <h3 style="text-align: center;"> <span style="color: #333333;"> <%=(addedProductMsg != null ? addedProductMsg : "")%></span> </h3>
        <h3 style="text-align: center;"> <span style="color: #333333;"> <%=(deletedProductMsg != null ? deletedProductMsg : "")%></span> </h3>
        
        <table>
            <tr>
                <td><a class="button" href="addProduct.jsp">Add Product</a></td>
                <td><form action="ViewProductServlet" method="post"><input type="submit" class="button" href="viewProducts.jsp" value="View Products"></form></td>
                <td><a class="button" href="updateProductSearch.jsp" >Update Product Details</a></td>
                <td><a class="button" href="deleteProducts.jsp" >Delete Products</a></td>
            </tr>
        </table>
    </body>
</html>
