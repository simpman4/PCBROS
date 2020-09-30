<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>Home</title>
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
       
        
        <img src="images/PCBROS.png" alt="IoT">
        
        <div style="text-align: center; margin: 5px">
            <a class="button" href="login.jsp">Login</a>
            <a class="button" href="register.jsp">Register</a>
        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
    
    <script>src="main.js"></script>
</html>

