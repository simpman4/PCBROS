
<%@page import="uts.isd.model.User"%>
<%@page import="uts.isd.model.Shipping"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>Edit Shipping</title>
        <script>
             
            function toggleEditForm() {
                var editForm = document.getElementById("editForm");
                var updatedTxt = document.getElementById("updatedTxt");
                if (editForm.style.display === "block") {
                    editForm.style.display = "none";
                    updatedTxt.style.display = "none";
                } else {
                    editForm.style.display = "block";
                    updatedTxt.style.display = "none";
                }
            }
            function confirmDelete() {
                var confirmed = confirm("Are you sure you want to delete this shipping detail?");
                if (!confirmed) {
                    return false;
                }
            }
            function showMessage() {
                var updatedTxt = document.getElementById("updatedTxt");
                updatedTxt.style.display = "block";
            }
        
        
        </script>
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
            String shippingUpdated = (String) session.getAttribute("shippingUpdated");
            User customer = (User) session.getAttribute("customer");
            
            String existErr = (String) session.getAttribute("existErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String nameErr = (String) session.getAttribute("nameErr");
        %>
        
        <header>
            <div style="position: absolute; top: 20px; left: 5px;">
                <a class="button" style="font-size: 17px;" href="shippingMain.jsp">< Back</a>
            </div>
            <h1>Edit Shipping Information<span class="message"><%=(existErr != null ? existErr : "")%></span></h1>
            <div class="logout" style="top: 20px; right: 5px; text-align: right">
                <a class="button" style="font-size: 17px;" href="LogoutServlet">Logout</a>
                <p class="message" style="color: white; margin-top: 50px"><%=customer.getEmail()%></p>
            </div>
        </header>
        
        <form action="SearchShippingServlet" method="post">
            <table style="padding: 10px; border-spacing: 5px;">
                <tr>
                    
                    <td class="td2"><input class="inputText" type="text" placeholder="Please enter Shipping ID" id="shipping_id" name="shipping_id" required/></td>
                   
                    <td class="td2"style="padding-left: 0;"><input class="button" type="submit" value="Search"</td>
                </tr>
            </table>
        </form>
        
        <%  Shipping shipping = (Shipping) request.getAttribute("shipping"); 
            if (shipping != null) { %>
            <table style="border-collapse: collapse; border: 1px solid black;">
                <tr style="background-color: grey; color: white; font-weight: bold;">
                    <td>Shipping ID</td>
                    <td>Street Address</td>
                    <td>Suburb</td>
                    <td>State</td>
                    <td>Postcode</td>
                    <td>Delivery Method</td>
                    <td>Date</td>
                  
                    
                </tr>
                <tr style="background-color: #efefef;">
                    <td style="padding: 8px;"><%=shipping.getShipping_id()%></td>
                    <td style="padding: 8px;"><%=shipping.getStreet()%></td>
                    <td style="padding: 8px;"><%=shipping.getSuburb()%></td>
                    <td style="padding: 8px;"><%=shipping.getState()%></td>
                    <td style="padding: 8px;"><%=shipping.getPostcode()%></td>
                    <td style="padding: 8px;"><%=shipping.getMethod()%></td>
                    <td style="padding: 8px;"><%=shipping.getDate()%></td>
                    
                   
                </tr>
            </table> 
                
            <table style="border-spacing: 0; padding: 20px; padding-bottom: 5px;">
                <tr>
                    <td class="td2" style="padding: 0; padding-right: 5px;"><button class="button" onclick="toggleEditForm()">Edit</button></td>
                    <td class="td2" style="padding: 0; padding-left: 5px;">
                        <form id="deleteForm" onsubmit="return confirmDelete();" action="DeleteShippingServlet" method="post">
                            <input class="button" type="submit" value="Delete">
                            <input style="display: none;" type="text" name="shipping_id" value="<%=shipping.getShipping_id()%>">
                        </form>
                    </td>
                </tr>
            </table>
                
            <form class="editForm" id="editForm" action="UpdateShippingServlet" method="post">
                <table style="border-spacing: 0; padding-top: 20px; width: 400px;">
                    <tr>
                        <td class="td2" style="padding-top: 0;"><label for name="street">Street Line</label></td>
                        <td class="td2" style="padding-top: 0;"><input class="inputText" type="text" placeholder="<%=(nameErr != null ? nameErr : "")%>" value="<%=shipping.getStreet()%>" id="street" name="street" required/></td>
                    </tr>
                    <tr>
                        <td class="td2"><label for name="suburb">Suburb</label></td>
                        <td class="td2"><input class="inputText" type="text" value="<%=shipping.getSuburb()%>" id="suburb" name="suburb" required/></td>
                    </tr>
                    <tr>
                        <td class="td2"><label for name="state">Email</label></td>
                        <td class="td2"><input class="inputText" type="text" placeholder="<%=(emailErr != null ? emailErr : "")%>" value="<%=shipping.getState()%>" id="state" name="state" required/></td>
                    </tr>
                    <tr>
                        <td class="td2"><label for name="postcode">Postcode</label></td>
                        <td class="td2"><input class="inputText" type="text" value="<%=shipping.getPostcode()%>" id="postcode" name="postcode" required/></td>
                    </tr>
                     <tr>
                        <td class="td2"><label for name="method">Delivery Method</label></td>
                        <td class="td2"><input class="inputText" type="text" value="<%=shipping.getMethod()%>" id="method" name="method" required/></td>
                    </tr>
                     <tr>
                        <td class="td2"><label for name="postcode">Preferred</label></td>
                        <td class="td2"><input class="inputText" type="text" value="<%=shipping.getDate()%>" id="date" name="date" required/></td>
                    </tr>
                    
                    
                </table>
                <input style="margin-bottom: 15px;" class="button" type="submit" value="Update"></td>

            </form>
        <% } %>
        <p id="updatedTxt" style="color: #333333;"><span><%=(shippingUpdated != null ? shippingUpdated : "")%></span></p>
    </body>
</html>
