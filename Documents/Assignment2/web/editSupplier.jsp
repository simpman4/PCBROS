<%@page import="uts.isd.model.Supplier"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>Edit Supplier</title>
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
                var confirmed = confirm("Are you sure you want to delete this Supplier?");
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
        </style>
    </head>
    <body>
        <% 
            String supplierUpdated = (String) session.getAttribute("supplierUpdated");
            
            String existErr = (String) session.getAttribute("existErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String nameErr = (String) session.getAttribute("nameErr");
            Supplier supplier = (Supplier) request.getAttribute("supplier"); 
        %>
        
        <header>
            <div style="position: absolute; top: 20px; left: 5px;">
                <a class="button" style="font-size: 17px;" href="supplierManagement.jsp">< Back</a>
            </div>
            <h1>Edit Supplier Information<span class="message"><%=(existErr != null ? existErr : "")%></span></h1>
            <div class="logout" style="top: 20px; right: 5px">
                <a class="button" style="font-size: 17px;" href="AdminLogoutServlet">Logout</a>
            </div>
        </header>
        
        <form action="SearchSupplierServlet" method="post">
            <table style="padding: 10px; border-spacing: 5px;">
                <tr>
                    <td class="td2"><input class="inputText" type="text" placeholder="Search Company Name.." id="companyName" name="companyName" required/></td>
                    <td class="td2"style="padding-left: 0;"><input class="button" type="submit" value="Search"</td>
                </tr>
            </table>
        </form>
        
        <%  if (supplier != null) { %>
            <table style="border-collapse: collapse; border: 1px solid black;">
                <tr style="background-color: grey; color: white; font-weight: bold;">
                    <td>ID</td>
                    <td>Contact Name</td>
                    <td>Company Name</td>
                    <td>Email</td>
                    <td>Street</td>
                    <td>Suburb</td>
                    <td>State</td>
                    <td>Postcode</td>
                    <td>Status</td>
                </tr>
                <tr style="background-color: #efefef;">
                    <td style="padding: 8px;"><%=supplier.getId()%></td>
                    <td style="padding: 8px;"><%=supplier.getContactName()%></td>
                    <td style="padding: 8px;"><%=supplier.getCompanyName()%></td>
                    <td style="padding: 8px;"><%=supplier.getEmail()%></td>
                    <td style="padding: 8px;"><%=supplier.getStreet()%></td>
                    <td style="padding: 8px;"><%=supplier.getSuburb()%></td>
                    <td style="padding: 8px;"><%=supplier.getState()%></td>
                    <td style="padding: 8px;"><%=supplier.getPostcode()%></td>
                    <td <% if (supplier.isActive()) { %> style="background-color: green; padding: 8px; font-weight: bold; color: white;" <% } else { %> style="background-color: red; padding: 8px; font-weight: bold;" <% } %>><%=supplier.isActiveString()%></td>
                </tr>
            </table>
                
            <table style="border-spacing: 0; padding: 20px; padding-bottom: 5px;">
                <tr>
                    <td class="td2" style="padding: 0; padding-right: 5px;"><button class="button" onclick="toggleEditForm()">Edit</button></td>
                    <td class="td2" style="padding: 0; padding-left: 5px;">
                        <form id="deleteForm" onsubmit="return confirmDelete();" action="DeleteSupplierServlet" method="post">
                            <input class="button" type="submit" value="Delete">
                            <input style="display: none;" type="text" name="companyName" value="<%=supplier.getCompanyName()%>">
                        </form>
                    </td>
                </tr>
            </table>
                
            <form class="editForm" id="editForm" action="UpdateSupplierServlet" method="post">
                <table style="border-spacing: 0; padding-top: 20px; width: 400px;">
                    <tr>
                        <td class="td2" style="padding-top: 0;"><label for name="contactName">Contact Name</label></td>
                        <td class="td2" style="padding-top: 0;"><input class="inputText" type="text" value="<%=supplier.getContactName()%>" id="contactName" name="contactName" required/></td>
                    </tr>
                    <tr>
                        <td class="td2"><label for name="companyName">Company Name</label></td>
                        <td class="td2"><input class="inputText" type="text" value="<%=supplier.getCompanyName()%>" id="companyName" name="companyName" required/></td>
                    </tr>
                    <tr>
                        <td class="td2"><label for name="email">Email</label></td>
                        <td class="td2"><input class="inputText" type="text" value="<%=supplier.getEmail()%>" id="email" name="email" required/></td>
                    </tr>
                    <tr>
                        <td class="td2"><label for name="streetLine1">Address</label></td>
                        <td class="td2"><input class="inputText" type="text" value="<%=supplier.getStreet()%>" id="streetLine1" name="streetLine1" required/></td>
                    </tr>
                    <tr>
                        <td class="td2"></td>
                        <td class="td2"><input class="inputText" type="text" value="<%=supplier.getSuburb()%>" id="streetLine2" name="streetLine2" required/></td>
                    </tr>
                    <tr>
                        <td class="td2"><label for name="state">State</label></td>
                        <td class="td2"><input class="inputText" type="text" value="<%=supplier.getState()%>" id="state" name="state" size="4" maxlength="3" required/></td>
                    </tr>
                    <tr>
                        <td class="td2"><label for name="postcode">Postcode</label></td>
                        <td class="td2"><input class="inputText" type="text" value="<%=supplier.getPostcode()%>" id="postcode" name="postcode" size="4" maxlength="4" required/></td>
                    </tr>
                    <tr>
                        <td class="td2"><label for name="status">Active</label></td>
                        <td class="td2"><input class="inputText" type="checkbox" id="status" <% if (supplier.isActive()) { %> checked <% } %> name="status"/></td>
                    </tr>
                </table>
                <input style="margin-bottom: 15px;" class="button" onclick="showMessage()" type="submit" value="Update"></td>

            </form>
        <% } %>
        <p id="updatedTxt" style="color: #333333;"><span><%=(supplierUpdated != null ? supplierUpdated : "")%></span></p>
    </body>
</html>
