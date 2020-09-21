<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>Login</title>
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
        %>
        <header>
            <h1>Login<span class="message"> <%=(existErr != null ? existErr : "")%></span></h1>
        </header>
        
        <form action="LoginServlet" method="post">
            <table>
                <tr>
                    <td><label for name="email">Email</label></td>
                    <td><input class="inputText" type="text" placeholder="<%=(emailErr != null ? emailErr : "Enter email..")%>" id="email" name="email" required/></td>
                </tr>
                <tr>
                    <td><label for name="password">Password</label></td>
                    <td><input class="inputText" type="password" placeholder="<%=(passErr != null ? passErr : "Enter password..")%>" id="password" name="password" required/></td>
                </tr>
            </table>
            <div style="text-align: center; margin-bottom: 20px;">
                <a class="button" href="CancelServlet">Cancel</a>
                <input class="button" type="submit" value="Login"> 
            </div>
        </form>
    </body>
</html>

