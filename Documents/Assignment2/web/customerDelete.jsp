<%-- 
    Document   : customerDelete
    Created on : 31/05/2020, 1:15:46 AM
    Author     : napol
--%>

<%@page import="uts.isd.model.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>Delete</title>
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
            User customer = (User)session.getAttribute("customer");
            String deleted = (String)session.getAttribute("deleted");
            
         %>   
        <header style="margin-bottom: 20px;">
            <div style="position: absolute; top: 20px; left: 5px;">
                <a class="button" style="font-size: 17px;" href="customerAccount.jsp">< Back</a>
            </div>
            <h1>Delete Account<span> <%= (deleted != null ? deleted: "")%> </span></h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right">
                <a class="button" style="font-size: 17px" href="LogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 50px"><%=customer.getEmail()%></p>
            </div>
        </header>    
       
        <form action="CusDeleteServlet" method="post">
             
            <input style="display: none;" type="text" name="email" value="<%=customer.getEmail()%>">
            <input class="button" type="submit" value="Yes"> 
            <a class="button" href="customerAccount.jsp"> No </a>
        </form>
        
    </body>
</html>
