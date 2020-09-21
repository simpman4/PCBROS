<%-- 
    Document   : deleteProducts
    Created on : Jun 5, 2020, 6:17:42 PM
    Author     : Ethan
--%>

<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" href="css/styles.css">
       <title>Delete Product</title>
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
            <h1>Delete Product</h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right;">
                <a class="button" style="font-size: 17px" href="StaffLogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 50px"><%=staff.getEmail()%></p>
            </div>
        </header>
        <form action="DeleteProductServlet" method="post">
            <table style="margin-left: auto; margin-right: auto; padding-bottom: 15px; border-spacing: 10px; font-family: verdana ">
                 <h3 style="text-align: center;"> <span class="message"> <%=(existErr != null ? existErr : "")%></span> </h3>
                <tr>
                    <td><label for name="productName">Product Name<label/></td>
                    <td><input class="inputText" type="text" id="productName" name="productName" required/></td>
                </tr>
            </table>
            
            <div style="text-align: center; ">
                    <a class="button" href="staffMain.jsp">Cancel</a>
                    <input class="button" type="submit" value="Delete Product">
            </div>
            
        </form>
        
    </body>
</html>
