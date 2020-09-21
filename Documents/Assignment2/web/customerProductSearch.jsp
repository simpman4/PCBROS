<%-- 
    Document   : customerProductSearch
    Created on : Jun 8, 2020, 12:52:12 PM
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
        <title>Search Products</title>
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
            User customer = (User) session.getAttribute("customer");
        %>
        
        <header>
            <div class="logout" style="top: 20px; left: 5px; text-align: left;">
                <a class="button" style="font-size: 17px" href="customerMain.jsp">< Back</a>
            </div>
            <h1>Search Products</h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right">
                <a class="button" style="font-size: 17px" href="LogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 50px"><%=customer.getEmail()%></p>
            </div>
            
        </header>
        <h3 style="text-align: center;"> <span class="message"> <%=(existErr != null ? existErr : "")%></span> </h3>
        <form action="CustomerProductSearchServlet" method="post">
            <table style="padding: 10px; border-spacing: 5px; margin-left:auto;margin-right:auto;">
                <tr>
                    <td> <input class="inputText" type="text" placeholder="Search Product Name..." id="productName" name="productName" required/></td>
                    <td style="padding-left: 0;"> <input class="button" type="submit" value="Search"/> </td>
                </tr>
            </table>
        </form>
            
                
        <% Product product = (Product) request.getAttribute("product"); 
        if (product != null) { %>
        
            <table>
                   <tr style="background-color: #efefef;">
                       <td style="padding: 15px;"><%=product.getProductName()%></td>
                       <td style="padding: 15px;"><%=product.getDeviceType()%></td>
                       <td style="padding: 15px;"><%=product.getUnitPrice()%></td>
                       <td style="padding: 15px;"><%=product.getQuantity()%></td>      
                   </tr>
                <% } %>
            </table>
            
            
            
           
       
        
       
    </body>
</html>
