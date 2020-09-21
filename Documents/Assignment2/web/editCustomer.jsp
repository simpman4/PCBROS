<%-- 
    Document   : edit
    Created on : 30/05/2020, 10:21:35 PM
    Author     : napol
--%>

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
            User customer = (User)session.getAttribute("customer");
            String updated = (String)session.getAttribute("updated");
            
         %>   
        
         <!--<a class="button" href="MainServlet?email='<%=customer.getEmail()%>'&password='<%=customer.getPassword()%>'"> Main </a> -->
         <header>
            <div style="position: absolute; top: 20px; left: 5px;">
                <a class="button" style="font-size: 17px;" href="customerAccount.jsp">< Back</a>
            </div>
            <h1>Edit User Profile<span class="message"> <%= (updated != null ? updated: "")%></span></h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right">
                <a class="button" style="font-size: 17px" href="LogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 50px"><%=customer.getEmail()%></p>
            </div>
        </header> 
         
         
         
        <form method="post" action="UpdateCustomerServlet">
          <table style="margin-left: auto; margin-right: auto; padding-bottom: 15px; border-spacing: 10px; font-family: verdana ">
                
              
              <tr><td id="rego">Email</td><td><input type="text" name="email" value=""></td></tr>
                <tr><td id="rego">Password</td><td><input type="password" name="password" value=""></td></tr>
                <tr><td id="rego">Name</td><td><input type="text" name="name" value=""></td></tr>
                <tr><td id="rego">Street</td><td><input type="text" name="street" value=""></td></tr>
                <tr><td id="rego">Suburb</td><td><input type="text" name="suburb" value=""></td></tr>
                <tr><td id="rego">State</td><td><input type="text" name="state" value=""></td></tr>
                <tr><td id="rego">Postcode</td><td><input type="text" name="postcode" value=""></td></tr>
                <tr><td id="rego">Date of Birth</td><td><input type="date" name="dob" value=""></td></tr>
                <tr><td id="rego">Phone Number</td><td><input type="text" name="phoneNum" value= ""></td></tr>
                <tr><td></td>
                    <td>
                        <input class="button" type="submit" value="Update">
                    </td>
                </tr>                       
            </table>
        </form>  
            <%--    <% 
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    String name = request.getParameter("name");
                    String street = request.getParameter("street");
                    String suburb = request.getParameter("suburb");
                    String state = request.getParameter("state");
                    String postcode = request.getParameter("postcode");
                    String dob = request.getParameter("dob");
                    String phoneNum = request.getParameter("phoneNum");   
                    //point the new instance (user) to a new bean using the user new information
                    customer = new User (email, password, name, street, suburb, state, postcode, dob, phoneNum);
                    session.setAttribute("customer", customer);
                %>
                
                --%> 
    </body>
</html>
