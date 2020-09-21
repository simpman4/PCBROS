<%-- 
    Document   : updateShipping
    Created on : 08/06/2020, 8:30:56 PM
    Author     : marcu
--%>
<%@page import="uts.isd.model.Shipping"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Here are the results!</h1>
        <%
                  Shipping shipping =(Shipping)request.getAttribute("shipping");
         
        %>
        
        <table
        <td>${shipping.shipping_id}</td>
    <td>${shipping.street}</td>
    <td>${shipping.suburb}</td>
        <td>${shipping.state}</td>
    <td>${shipping.postcode}</td>
    <td>${shipping.method}</td>
    <td>${shipping.date}</td>

    
    <td>${customer.phoneNumber}</td>
    <td>${customer.postalAddress}</td>
</table>
        
        
       
        
    </body>
</html>
