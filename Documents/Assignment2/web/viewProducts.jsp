<%-- 
    Document   : viewProducts
    Created on : Jun 3, 2020, 11:28:19 PM
    Author     : Ethan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.Product"%>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" href="css/styles.css">
       <title>View Products</title>
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
            User customer = (User) session.getAttribute("customer");
        
        if (customer == null && staff != null) { %>
        <header>
            <div style="position: absolute; top: 20px; left: 5px;">
                <a class="button" style="font-size: 17px;" href="staffMain.jsp">< Back</a>
            </div>
            <h1>View Products</h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right">
                <a class="button" style="font-size: 17px" href="StaffLogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 50px"><%=staff.getEmail()%></p>
                
            </div>
        </header>
        <% } else { %>
        <header>
            <div style="position: absolute; top: 20px; left: 5px;">
                <a class="button" style="font-size: 17px;" href="customerMain.jsp">< Back</a>
            </div>
            <h1>View Products</h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right">
                <a class="button" style="font-size: 17px" href="LogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 10px"><%=customer.getEmail()%></p>
                <p class="cart" style="color: white; margin-top: 10px" href="cart.html">Cart <span>0</span></p>
                          
            </div>
                
        </header>
        <% } %>
            <table>
                <% 
                ArrayList<Product> products = (ArrayList<Product>)request.getAttribute("products");
                for (Product product : products) { %>
                   <tr style="background-color: #efefef;">
                       <td style="padding: 15px;"><%=product.getProductName()%></td>
                       <td style="padding: 15px;"><%=product.getDeviceType()%></td>
                       <td style="padding: 15px;"><%=product.getUnitPrice()%></td>
                       <td style="padding: 15px;"><%=product.getQuantity()%></td>     
                       
                   </tr>
                <% } %>
                
            </table>
                <table><tr><td <button type="button">Add to cart</button> </td></tr>  </table>
                
                
                <div class ="image">
    
    <img src="images/laptop.jpg" alt="img1">
    <h3>Laptop</h3>
    <h3>$3000.00</h3>
    <a class="add-cart cart1" href="#"> Add Cart</a>
    </div>
    
    <div class ="image">
    
    <img src="images/headphones.jpg" alt="img1">
    <h3>Headphones</h3>
    <h3>$50.00</h3>
    <a class="add-cart cart2" href="#"> Add Cart</a>
    </div>
            
     <div class ="image">
    <img src="images/keyboard.jpg" alt="img1">
    <h3>Keyboard</h3>
    <h3>$10.00</h3>
    <a class="add-cart cart3" href="#"> Add Cart</a>
    </div>
                
                
    <div class ="image">
    <img src="images/xbox.jpg" alt="img1">
    <h3>Xbox</h3>
    <h3>$120.00</h3>
    <a class="add-cart cart4" href="#"> Add Cart</a>
    </div>


      
    </body>
    
    
    <script src="main.js"></script>
</html>
