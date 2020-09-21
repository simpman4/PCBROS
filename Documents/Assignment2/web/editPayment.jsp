<%-- 
    Document   : edit
    Created on : 30 May 2020, 2:12:21 pm
    Author     : Joshua
--%>
<%@page import="uts.isd.model.User"%>
<%@page import="uts.isd.model.Payment"%>
<%-- 
    Document   : edit
    Created on : 28 May 2020, 7:18:43 pm
    Author     : Joshua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <script type="text/javascript" src="js/script.js"></script>
        <title>Payment Details</title>
        <style>
            td {
                padding: 10px;
                border: 1px solid #444444;
            }
            .td2 {
                padding: 10px;
                border: 0;
            }
            .editForm {
                display: none;
            }
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
            <h1>Payment Details<span class="message"><%=(existErr != null ? existErr : "")%></span></h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right">
                <a class="button" style="font-size: 17px" href="LogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 50px"><%=customer.getEmail()%></p>
            </div>
        </header>
        
           <form action="SearchPaymentServlet" method="post">
            <table style="margin-left: auto; margin-right: auto; padding-bottom: 15px; border-spacing: 10px; font-family: verdana">
                <tr>
                    <td class="td2"><input class="inputText" type="text" placeholder="Search CardNumber.." id="companyName" maxlength="16" name="CardNumber" required/></td>
                    <td class="td2"style="padding-left: 0;"><input class="button" type="submit" value="Search"</td>
                </tr>
            </table>
        </form>
        
        
         <%  Payment payment = (Payment) request.getAttribute("payment"); 
            if (payment != null) { %>
            <table style="border-collapse: collapse; border: 1px solid black; align-content: center">
                <tr style="background-color: grey; color: white; font-weight: bold;">
                    <td>Card Number</td>
                    <td>Payment Method</td>
                    <td>CVC</td>
                    <td>Expiry Date</td>
             
                </tr>
                <tr style="background-color: #efefef;">
                    <td style="padding: 8px;"><%=payment.getCardNumber()%></td>
                    <td style="padding: 8px;"><%=payment.getPaymentMethod()%></td>
                    <td style="padding: 8px;"><%=payment.getCVC()%></td>
                    <td style="padding: 8px;"><%=payment.getExpiryDate()%></td>
              
                </tr>
            </table>
                
            <table style="margin-left: auto; margin-right: auto; padding-bottom: 15px; border-spacing: 10px; font-family: verdana">
                <tr>
                    <td class="td2" style="padding: 0; padding-right: 5px;"><button class="button" onclick="editForm()">Edit</button></td>
                    <td class="td2" style="padding: 0; padding-left: 5px;">
                        <form id="deleteForm" onsubmit="return confirmDelete();" action="DeletePaymentServlet" method="post">
                            <input class="button" type="submit" value="Delete">
                            <input style="display: none;" type="text" name="CardNumber" value="<%=payment.getCardNumber()%>">
                        </form>
                    </td>
                </tr>
            </table>
                
            <form class="editForm" id="editForm" action="UpdatePaymentServlet" method="post">
                <table style="margin-left: auto; margin-right: auto; padding-bottom: 15px; border-spacing: 10px; font-family: verdana ">
                 <tr>
                        <td class="td2" style="padding-top: 0;"><label for name="CardNumber">Card Number<label/></td>
                        <td class="td2" style="padding-top: 0;"><input class="inputText" type="text" placeholder="<%=(CardNumberErr != null ? CardNumberErr : "")%>" maxlength="16" value="<%=payment.getCardNumber()%>" id="CardNumber" name="CardNumber" required/></td>
                    </tr>

                              <tr>
                            <td class="td2" style="padding-top: 0;">
                            <label for name="PaymentMethod">Payment Method</label>     
                            </td>
                            <td class="td2" style="padding-top: 0;">
                   
                    <input type="radio" id="Mastercard" name="PaymentMethod" value="Mastercard">
                    <label for="Mastercard">Mastercard</label><br>
                    <input type="radio" id="Visa" name="PaymentMethod" value="Visa">
                    <label for="Visa">Visa</label><br>
                    <input type="radio" id="Paypal" name="PaymentMethod" value="Paypal">
                    <label for="other">Other</label><br>
                     
                    </td></tr>
                    <tr>
                        <td class="td2"><label for name="CVC">CVC</label></td>
                        <td class="td2"><input class="inputText" type="text" value="<%=payment.getCVC()%>" maxlength="3" id="CVC" name="CVC" required/></td>
                    </tr>
                    <tr>
                        <td class="td2"><label for name="ExpiryDate">Expiry Date</label></td>
                        <td class="td2"><input class="inputText" type="text" value="<%=payment.getExpiryDate()%>" id="ExpiryDate" name="ExpiryDate" required/></td>
                    </tr>
                </table>
                <input class="button" type="submit" value="Update">

            </form>
        <% } %>
      
        <script>
            function editForm() {
                var x = document.getElementById("editForm");
                if (x.style.display === "block") {
                    x.style.display = "none";
                } else {
                    x.style.display = "block";
                }
            }
            function confirmDelete() {
                var x = confirm("Are you sure you want to delete these Payment Details?");
                if (!x) {
                    return false;
                }
            }
        </script>
    </body>
</html>
       