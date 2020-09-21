<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>Register</title>
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
            String emailErr = (String) session.getAttribute("emailErr");
            String passErr = (String) session.getAttribute("passErr");
            String nameErr = (String) session.getAttribute("nameErr");
        %>
        <header>
            <h1>Register<span class="message"> <%=(existErr != null ? existErr : "")%></span></h1>
        </header>
            <form action="RegisterServlet" method="post">
                <table>
                    <tr>
                        <td><label for name="email">Email</label></td>
                        <td><input class="inputText" type="text" placeholder="<%=(emailErr != null ? emailErr : "Enter email..")%>" id="email" name="email" required/></td>
                    </tr>
                    <tr>
                        <td><label for name="password">Password</label></td>
                        <td><input class="inputText" type="password" placeholder="<%=(passErr != null ? passErr : "Enter password..")%>" id="password" name="password" required/></td>
                    </tr>
                    <tr>
                        <td><label for name="fullName">Full Name</label></td>
                        <td><input class="inputText" type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter full name..")%>" id="fullName" name="fullName" required/></td>
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
                        <td><label for name="dob">Date of Birth</label></td>
                        <td><input class="inputText" type="date" id="dob" name="dob" required/></td>
                    </tr>
                    <tr>
                        <td><label for name="phoneNum">Phone Number</label></td>
                        <td><input class="inputText" type="text" id="phoneNum" name="phoneNum" maxlength="10" required/></td>
                    </tr>
                </table>
                <div style="text-align: center; margin-bottom: 20px;">
                    <a class="button" href="CancelServlet">Cancel</a>
                    <input class="button" type="submit" value="Register">
                </div>
            </form>
    </body>
</html>

