<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>Shipping Details</title>
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
        <% User customer = (User) session.getAttribute("customer"); %>
        <header>
            <div style="position: absolute; top: 20px; left: 5px;">
                <a class="button" style="font-size: 17px;" href="shippingMain.jsp">< Back</a>
            </div>
            <h1>Create new shipping details</h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right">
                <a class="button" style="font-size: 17px" href="LogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 50px"><%=customer.getEmail()%></p>
            </div>
        </header>
          
        <p style="text-align: center; font-family: arial">Please fill in shipping details and press save<span class="message"> </span></p>
        <form action="addShippingServlet" method="post">
                
            
                <table style="margin-left: auto; margin-right: auto; padding-bottom: 15px; border-spacing: 10px; font-family: verdana ">
                 
                    
                    
                    
                    <tr>
                        <td><label  for name="shippingAddress">Street</label></td>
                        <td><input class="inputText" type="text" id="streetLine1" name="street" required/></td>
                    </tr>
                    <tr>
                        <td><label  for name="suburb">Suburb</label></td>
                        <td><input class="inputText" type="text" id="streetLine2" name="suburb" required/></td>
                    </tr>
                    <tr>
                        <td><label  for name="state">State</label></td>
                        <td><input class="inputText" type="text" id="state" name="state" size="4" maxlength="3" required/></td>
                    </tr>
                    <tr>
                        <td><label  for name="postcode">Postcode</label></td>
                        <td><input class="inputText" type="text" id="postcode" name="postcode" size="4" maxlength="4" required/></td>
                    </tr>
                    
                    
                    
                     
                     <tr>               
                          
                          <td><label for name ="method">Shipping Method:</label></td>
                          <td><select id="shippingMethod" name="method">
    <option value="expressDelivery">Express Delivery (1-3 business days)</option>
    <option value="standardDelivery">Standard Delivery (1-10 business days)</option>
    <option value="nextDayDelivery">Next day Delivery (any orders over $50)</option>
    
                              </select>
                          <td>
  </tr>
  
    <tr>
                        <td><label for name="date">When do you want it?</label></td>
                        <td><input class="inputText" type="date" id="date" name="date" required/></td>
                    </tr>
  
  
 
 
                      
                </table>
                <div style="text-align: center;"> 

                    <input class="button" type="submit" value="Add!">
                </div>
            </form>
    </body>
</html>
