<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.Payment"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>Payment Details</title>
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
            String CardNumberErr = (String) session.getAttribute("CardNumberErr");
            String CVCErr = (String) session.getAttribute("CVCErr");
            User customer = (User) session.getAttribute("customer");
        %>
        <header>
            <div style="position: absolute; top: 20px; left: 5px;">
                <a class="button" style="font-size: 17px;" href="paymentMain.jsp">< Back</a>
            </div>
            <h1>Add New Payment<span class="message"><%=(existErr != null ? existErr : "")%></span></h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right">
                <a class="button" style="font-size: 17px" href="LogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 50px"><%=customer.getEmail()%></p>
            </div>
        </header>
            <form action="CreatePaymentServlet" method="post">
                <table style="margin-left: auto; margin-right: auto; padding-bottom: 15px; border-spacing: 10px; font-family: verdana ">
              
                    <tr>
                        <td><label for name="CardNumber">Credit Card Number</label></td>
                        <td><input class="inputText" type="text" placeholder="<%=(CardNumberErr != null ? CardNumberErr : "Enter Card Number..")%>" maxlength="16" id="CardNumber" name="CardNumber" required/></td>
                    </tr>
                    
                         <tr>
                            <td>
                            <label for name="PaymentMethod">Payment Method</label>     
                            </td>
                            <td>
                   
                    <input type="radio" id="Mastercard" name="PaymentMethod" value="Mastercard">
                    <label for="Mastercard">Mastercard</label><br>
                     <input type="radio" id="Visa" name="PaymentMethod" value="Visa">
                    <label for="Visa">Visa</label><br>
                    <input type="radio" id="Paypal" name="PaymentMethod" value="Paypal">
                    <label for="other">Other</label><br>
  
                                
                    </td></tr>
                
                    <tr>
                        <td><label for name="CVC">CVC</label></td>
                        <td><input class="inputText" type="text" placeholder="<%=(CVCErr != null ? CVCErr : "Enter CVC..")%>" maxlength="3" id="CVC" name="CVC" required/></td>
                    </tr>
                    <tr>
                        <td><label for name="ExpiryDate">Expiry Date</label></td>
                        <td><input class="inputText" type="date" id="ExpiryDate" name="ExpiryDate" required/></td>
                    </tr>
                </table>
                <div style="text-align: center;">
                    <a class="button" href="paymentMain.jsp">Cancel</a>
                    <input class="button" type="submit" value="Submit">
                </div>
            </form>
    </body>
</html>

