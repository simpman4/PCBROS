<%-- 
    Document   : updateProducts
    Created on : Jun 6, 2020, 1:28:26 PM
    Author     : Ethan
--%>

<%@page import="uts.isd.model.User"%>
<%@page import="uts.isd.model.Product"%>
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
            User staff = (User) session.getAttribute("staff");
        %>
        <header>
            <div style="position: absolute; top: 20px; left: 5px;">
                <a class="button" style="font-size: 17px;" href="staffMain.jsp">< Back</a>
            </div>
            <h1>Update Product</h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right">
                <a class="button" style="font-size: 17px" href="StaffLogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 50px"><%=staff.getEmail()%></p>
            </div>
        </header>
        <h3 style="text-align: center;"> <span style="color: #333333;"> <%=(existErr != null ? existErr : "")%></span> </h3>
        <form action="SearchProductServlet" method="post">
            <table style="padding: 10px; border-spacing: 5px; margin-left:auto;margin-right:auto;">
                <tr>
                    <td> <input class="inputText" type="text" placeholder="Search Product Name..." id="productName" name="productName" required/></td>
                    <td style="padding-left: 0;"> <input class="button" type="submit" value="Search"/> </td>
                </tr>
            </table>
        </form>
            
                
        <% Product product = (Product) request.getAttribute("product"); 
        if (product != null) { %>
        <form action="UpdateProductServlet" method="post">
            <table style="margin-left: auto; margin-right: auto; padding-bottom: 15px; border-spacing: 10px; font-family: verdana ">
               
                <tr>
                    <td><label for name="productName">Product Name<label/></td>
                    <td><input class="inputText" type="text" id="productName" name="productName" value="<%=product.getProductName()%>" required/></td>
                </tr>
                
                <tr>
                    <td><label for name="deviceType">Device Type<label/></td>
                    <td><input class="inputText" type="text" id="deviceType" name="deviceType" value="<%=product.getDeviceType()%>" required/></td>
                </tr>
                
                <tr>
                    <td><label for name="unitPrice">Unit Price<label/></td>
                    <td><input class="inputText" type="number" min="0.00" step="any" id="unitPrice" name="unitPrice" value="<%=product.getUnitPriceNormal()%>" required/></td>
                </tr>
                
                <tr>
                    <td><label for name="quantity">Quantity<label/></td>
                    <td><input class="inputText" type="number" min="1" step="1" id="quantity" name="quantity" value="<%=product.getQuantity()%>" required/></td>
                </tr>
                
                
                
            </table>
            
            
            
            <div style="text-align: center;">
                    <a class="button" href="staffMain.jsp">Cancel</a>
                    <input class="button" type="submit" value="Update Product">
            </div>
        </form>
        
        <% } %>
    </body>
</html>
