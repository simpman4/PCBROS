<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>Add Supplier</title>
    </head>
    <body>
        <% 
            String existErr = (String) session.getAttribute("existErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String nameErr = (String) session.getAttribute("nameErr");

            User admin = (User) session.getAttribute("admin");
        %>
        <header>
            <div style="position: absolute; top: 20px; left: 5px;">
                <a class="button" style="font-size: 17px;" href="supplierManagement.jsp">< Back</a>
            </div>
            <h1>Add Supplier<span class="message"><%=(existErr != null ? existErr : "")%></span></h1>
            <div class="logout" style="top: 20px; right: 5px;">
                <a class="button" style="font-size: 17px" href="AdminLogoutServlet">Logout</a>
            </div>
        </header>
        
        <form action="AddSupplierServlet" method="post">
            <table>
                <tr>
                    <td><label for name="contactName">Contact Name</label></td>
                    <td><input class="inputText" type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter full name..")%>" id="contactName" name="contactName" required/></td>
                </tr>
                <tr>
                    <td><label for name="companyName">Company Name</label></td>
                    <td><input class="inputText" type="text" id="companyName" name="companyName" required/></td>
                </tr>
                <tr>
                    <td><label for name="email">Email</label></td>
                    <td><input class="inputText" type="text" placeholder="<%=(emailErr != null ? emailErr : "Enter email..")%>" id="email" name="email" required/></td>
                </tr>
                <tr>
                    <td><label for name="streetLine1">Address</label></td>
                    <td><input class="inputText" type="text" id="streetLine1" name="streetLine1" required/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input class="inputText" type="text" id="streetLine2" name="streetLine2" required/></td>
                </tr>
                <tr>
                    <td><label for name="state">State</label></td>
                    <td><input class="inputText" type="text" id="state" name="state" size="4" maxlength="3" required/></td>
                </tr>
                <tr>
                    <td><label for name="postcode">Postcode</label></td>
                    <td><input class="inputText" type="text" id="postcode" name="postcode" size="4" maxlength="4" required/></td>
                </tr>
                <tr>
                    <td><label for name="status">Activate</label></td>
                    <td><input class="inputText" type="checkbox" id="status" name="status"/></td>
                </tr>
            </table>
            <div style="text-align: center; margin-bottom: 20px;">
                <a class="button" href="supplierManagement.jsp">Cancel</a>
                <input class="button" type="submit" value="Add">
            </div>
        </form>
    </body>
</html>

