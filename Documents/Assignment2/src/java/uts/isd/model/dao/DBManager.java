package uts.isd.model.dao;

import uts.isd.model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import uts.isd.model.Access;
import uts.isd.model.Payment;
import uts.isd.model.Product;
import uts.isd.model.Shipping;
import uts.isd.model.Supplier;

/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
*/

public class DBManager {

    private Statement st;

    public DBManager(Connection conn) throws SQLException {       
        st = conn.createStatement();
    }

    //Find customer by email and password in the database   
    public User findCustomer(String email, String password) throws SQLException {       
        String fetch = "SELECT * FROM IOTBAYUSER.CUSTOMERS WHERE EMAIL = '" +email+ "' AND PASSWORD = '" +password+ "'";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            String customerEmail = rs.getString(2);
            String customerPass = rs.getString(3);
            if (customerEmail.equals(email) && customerPass.equals(password)) {
                String name = rs.getString(4);
                String street = rs.getString(5);
                String suburb = rs.getString(6);
                String state = rs.getString(7);
                String postcode = rs.getString(8);
                String dob = rs.getString(9);
                String phoneNum = rs.getString(10);
                return new User (email, password, name, street, suburb, state, postcode, dob, phoneNum);
            }
        }
        return null;   
    }
    
    public User findStaff(String email, String password) throws SQLException {       
        String fetch = "SELECT * FROM IOTBAYUSER.STAFF WHERE EMAIL = '" +email+ "' AND PASSWORD = '" +password+ "'";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            String userEmail = rs.getString(2);
            String userPass = rs.getString(3);
            if (userEmail.equals(email) && userPass.equals(password)) {
                int id = rs.getInt(1);
                String name = rs.getString(4);
                String position = rs.getString(5);
                String phoneNum = rs.getString(6);
                return new User (id, email, password, name,  position, phoneNum);
            }
        }
        return null;   
    }
    
    //Add a customer into the database   
    public void addCustomer(String email, String password, String name, String street, String suburb, String state, String postcode, String dob, String phoneNum) throws SQLException {                   //code for add-operation       
        st.executeUpdate("INSERT INTO IOTBAYUSER.CUSTOMERS (EMAIL, PASSWORD, FULLNAME, STREET, SUBURB, STATE, POSTCODE, DOB, PHONENUM) "
                + "VALUES ('" +email+ "', '" +password+ "', '" +name+ "', '" +street+ "', '" +suburb+ "', '" +state+ "', '" +postcode+ "', '" +dob+ "', '" +phoneNum+ "')");
    }
    
    public void addLog(String email, String login_time, String logout_time, String type) throws SQLException{
                 st.executeUpdate("INSERT INTO IOTBAYUSER.ACCESS (EMAIL, LOGIN_TIME, LOGOUT_TIME, TYPE) "
                + "VALUES ('" +email+ "', '" +login_time+ "', '" +logout_time+ "', '"+type+"')");       
    }
    
    public Access findAccessLog(String login_time) throws SQLException {       
        String fetch = "SELECT * FROM IOTBAYUSER.ACCESS WHERE LOGIN_TIME = '" +login_time+ "'";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            String accessTimeConfirm = rs.getString(2);
            
            if (accessTimeConfirm.equals(login_time)) {
                String email = rs.getString(1);
                String logout_time = rs.getString(3);
                String type = rs.getString(4);
                
                
                return new Access (email, login_time, logout_time, type);
            }
        }
        return null;   
    }

    //update a user details in the database   
    public void updateCustomer(String email, String password, String name, String street, String suburb, String state, String postcode, String dob, String phoneNum) throws SQLException {       
        st.executeUpdate("UPDATE IOTBAYUSER.CUSTOMERS "
                + "SET PASSWORD = '"+password+"', FULLNAME = '"+name+"', STREET = '"+street+"', SUBURB = '"+suburb+"', STATE = '"+state+"', POSTCODE = '"+postcode+"', DOB = '"+dob+"', PHONENUM = '"+phoneNum+"' "
                + "WHERE EMAIL = '"+email+"'");
    }

    //delete a user from the database   
    public void deleteCustomer(String email) throws SQLException{       
        st.executeUpdate("DELETE FROM IOTBAYUSER.CUSTOMERS WHERE EMAIL = '" +email+ "'");
    }
    
    public ArrayList<User> fetchCustomers() throws SQLException {
    
        String fetch = "SELECT * FROM IOTBAYUSER.CUSTOMERS";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<User> users =  new ArrayList();
        
        while (rs.next()) {
            String email = rs.getString(2);
            String password = rs.getString(3);
            String name = rs.getString(4);
            String street = rs.getString(5);
            String suburb = rs.getString(6);
            String state = rs.getString(7);
            String postcode = rs.getString(8);
            String dob = rs.getString(9);
            String phoneNum = rs.getString(10);
            
            users.add(new User(email, password, name, street, suburb, state, postcode, dob, phoneNum));
        }
        return users;
    }
    
    public ArrayList<List<String>> fetchAccessLogs(String email) throws SQLException {
        String fetch = "SELECT * FROM IOTBAYUSER.ACCESS WHERE EMAIL = '" +email+ "'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<List<String>> accessLogs =  new ArrayList();
        
        while (rs.next()) {
            String emailUnf = rs.getString(1);
            String login_time = rs.getString(2);
            String logout_time = rs.getString(3);
            String type = rs.getString(4);
            List<String> accessLog = Arrays.asList(emailUnf,login_time ,logout_time, type);
            
            accessLogs.add(accessLog);
        }
        return accessLogs;
    }
    
    public boolean checkCustomer(String email, String password) throws SQLException {
        
        String fetch = "SELECT * FROM IOTBAYUSER.CUSTOMERS WHERE EMAIL = '" +email+ "' AND PASSWORD = '" +password+ "'";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            String customerEmail = rs.getString(2);
            String customerPass = rs.getString(3);
            if (customerEmail.equals(email) && customerPass.equals(password)) {
                return true;
            }
        }
        return false;
    }
    
    
    public boolean checkStaff(String email, String password) throws SQLException {
        
        String fetch = "SELECT * FROM IOTBAYUSER.STAFF WHERE EMAIL = '" +email+ "' AND PASSWORD = '" +password+ "'";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            String staffEmail = rs.getString(2);
            String staffPass = rs.getString(3);
            if (staffEmail.equals(email) && staffPass.equals(password)) {
                return true;
            }
        }
        return false;
    }
    
    public Supplier findSupplier(String companyName) throws SQLException {       
        String fetch = "SELECT * FROM IOTBAYUSER.SUPPLIERS WHERE COMPANYNAME = '" +companyName+ "' ";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            String supplierCompanyName = rs.getString(3);
            if (supplierCompanyName.equals(companyName)) {
                int id = rs.getInt(1);
                String contactName = rs.getString(2);
                String email = rs.getString(4);
                String street = rs.getString(5);
                String suburb = rs.getString(6);
                String state = rs.getString(7);
                String postcode = rs.getString(8);
                boolean status = rs.getBoolean(9);
                return new Supplier (id, contactName, companyName, email, street, suburb, state, postcode, status);
            }
        }
        return null;   
    }
    
    //Add a user-data into the database   
    public void addSupplier(String contactName, String companyName, String email, String street, String suburb, String state, String postcode, boolean status) throws SQLException {                   //code for add-operation       
        st.executeUpdate("INSERT INTO IOTBAYUSER.SUPPLIERS (CONTACTNAME, COMPANYNAME, EMAIL, STREET, SUBURB, STATE, POSTCODE, STATUS) "
                + "VALUES ('" +contactName+ "', '" +companyName+ "', '" +email+ "', '" +street+ "', '" +suburb+ "', '" +state+ "', '" +postcode+ "', " +status+ ")");
    }
    
    public void updateSupplier(String contactName, String companyName, String email, String street, String suburb, String state, String postcode, boolean status) throws SQLException {       
        st.executeUpdate("UPDATE IOTBAYUSER.SUPPLIERS " +
                "SET CONTACTNAME = '" +contactName+ "', COMPANYNAME = '" +companyName+ "', EMAIL = '" +email+ "', STREET = '" +street+ "', SUBURB = '" +suburb+ "', STATE = '" +state+ "', POSTCODE = '" +postcode+ "', STATUS = " +status+ " " +
                "WHERE COMPANYNAME = '" +companyName+ "' ");
    }
    
    public void deleteSupplier(String companyName) throws SQLException{
        st.executeUpdate("DELETE FROM IOTBAYUSER.SUPPLIERS WHERE COMPANYNAME = '" +companyName+ "'");
    }
    
    public ArrayList<Supplier> fetchSuppliers() throws SQLException {
    
        String fetch = "SELECT * FROM IOTBAYUSER.SUPPLIERS";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Supplier> suppliers =  new ArrayList();
        
        while (rs.next()) {
            int id = rs.getInt(1);
            String contactName = rs.getString(2);
            String companyName = rs.getString(3);
            String email = rs.getString(4);
            String street = rs.getString(5);
            String suburb = rs.getString(6);
            String state = rs.getString(7);
            String postcode = rs.getString(8);
            boolean status = rs.getBoolean(9);
            suppliers.add(new Supplier(id, contactName, companyName, email, street, suburb, state, postcode, status));
        }
        return suppliers;
    }
    
    public boolean checkSupplier(String companyName) throws SQLException {
        
        String fetch = "SELECT * FROM IOTBAYUSER.SUPPLIERS WHERE COMPANYNAME = '" +companyName+ "'";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            String supplierCompanyName = rs.getString(3);
            if (supplierCompanyName.equals(companyName)) {
                return true;
            }
        }
        return false;
    }
    
    public Product findProduct(String productName) throws SQLException {       
        String fetch = "SELECT * FROM IOTBAYUSER.PRODUCTS WHERE PRODUCTNAME = '" +productName+ "'";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            String productNameConfirm = rs.getString(1);
            
            if (productNameConfirm.equals(productName)) {
                String deviceTypeConfirm = rs.getString(2);
                String unitPriceConfirm = rs.getString(3);
                String quantityConfirm = rs.getString(4);
                
                
                return new Product (productName, deviceTypeConfirm, unitPriceConfirm, quantityConfirm);
            }
        }
        return null;   
    }
    
    public void addProduct(String productName, String deviceType, String unitPrice, String quantity) throws SQLException {
        st.executeUpdate("INSERT INTO IOTBAYUSER.PRODUCTS (PRODUCTNAME, DEVICETYPE, UNITPRICE, QUANTITY) VALUES ('" +productName+ "', '" +deviceType+ "', '" +unitPrice+ "', '" +quantity+ "')");
    }
    
    public void deleteProduct(String productName) throws SQLException {
        st.executeUpdate("DELETE FROM IOTBAYUSER.PRODUCTS WHERE PRODUCTNAME = '" +productName+ "'");
    }
    
    public void updateProduct(String productName, String deviceType, String unitPrice, String quantity) throws SQLException {
        st.executeUpdate("UPDATE IOTBAYUSER.PRODUCTS SET DEVICETYPE = '" +deviceType+ "', UNITPRICE = '" +unitPrice+ "', QUANTITY = '" +quantity+ "' WHERE PRODUCTNAME = '" +productName+ "'");
    }
    
    public ArrayList<Product> fetchProducts() throws SQLException {
    
        String fetch = "SELECT * FROM IOTBAYUSER.PRODUCTS";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Product> products =  new ArrayList();
        
        while (rs.next()) {
            String productName = rs.getString(1);
            String deviceType = rs.getString(2);
            String unitPrice = rs.getString(3);
            String quantity = rs.getString(4);
            
            
            products.add(new Product(productName, deviceType, unitPrice, quantity));
        }
        return products;
    }
    
    
    public Payment findPayment(String CardNumber) throws SQLException {       
        String fetch = "SELECT * FROM IOTBAYUSER.PAYMENT WHERE CARDNUMBER = '" +CardNumber+ "'";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            String paymentCardNumber = rs.getString(1);
            if (paymentCardNumber.equals(CardNumber)) {
                String PaymentMethod = rs.getString(2);
                String CVC = rs.getString(3);
                String ExpiryDate = rs.getString(4);
                return new Payment (CardNumber, PaymentMethod, CVC, ExpiryDate);
            }
        }
        return null;   
    }

    
    //Add a user-data into the database   
    public void addPayment(String CardNumber, String PaymentMethod, String CVC, String ExpiryDate) throws SQLException {                   //code for add-operation       
        st.executeUpdate("INSERT INTO IOTBAYUSER.PAYMENT (CARDNUMBER, PAYMENTMETHOD, CVC, EXPIRYDATE) "
                + "VALUES ('" +CardNumber+ "', '" +PaymentMethod+ "', '" +CVC+ "', '" +ExpiryDate+ "')");
    }

     
    public void updatePayment(String CardNumber, String PaymentMethod, String CVC, String ExpiryDate) throws SQLException {
        st.executeUpdate("UPDATE IOTBAYUSER.PAYMENT SET CARDNUMBER = '" +CardNumber+ "', PAYMENTMETHOD = '" +PaymentMethod+ "', CVC = '" +CVC+ "', EXPIRYDATE = '"+ExpiryDate+"' WHERE CARDNUMBER = '" +CardNumber+ "'");
    }
    
    //delete a user from the database   
    public void deletePayment(String CardNumber) throws SQLException{       
        st.executeUpdate("DELETE FROM IOTBAYUSER.PAYMENT WHERE CARDNUMBER = '" +CardNumber+ "'");
    }
    
    public ArrayList<Payment> fetchPayment() throws SQLException {
    
        String fetch = "SELECT * FROM IOTBAYUSER.PAYMENT";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Payment> payments =  new ArrayList();
        
        while (rs.next()) {
            String CardNumber = rs.getString(1);
            String PaymentMethod = rs.getString(2);
            String CVC = rs.getString(3);
            String ExpiryDate = rs.getString(4);
            payments.add(new Payment(CardNumber, PaymentMethod, CVC, ExpiryDate));
        }
        return payments;
    }
    
    public boolean checkPayment(String CardNumber) throws SQLException {
        
        String fetch = "SELECT * FROM IOTBAYUSER.PAYMENT WHERE CARDNUMBER = '" +CardNumber+ "'";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            String paymentCardNumber = rs.getString(1);
            if (paymentCardNumber.equals(CardNumber)) {
                return true;
            }
        }
        return false;
    }
    
    public boolean checkShipping(String shipping_id) throws SQLException {
        
        String fetch = "SELECT * FROM IOTBAYUSER.SHIPPING WHERE SHIPPING_ID = '" +shipping_id+"'";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            String shipping_id1 = rs.getString(1);
           
            if (shipping_id1.equals(shipping_id)) {
                return true;
            }
        }
        return false;
    }
    
    
     public void addShipping(String street, String suburb, String state, String postcode, String method, String date) throws SQLException {                   //code for add-operation       
        st.executeUpdate("INSERT INTO IOTBAYUSER.SHIPPING (STREET, SUBURB, STATE, POSTCODE, METHOD, DATE) "
                + "VALUES ('" +street+ "', '" +suburb+ "', '" +state+ "', '" +postcode+ "', '" +method+ "', '" +date+ "')");
    }
    
    
     
     public Shipping findShipping(int shipping_id) throws SQLException {       
      //  String fetch = "SELECT * FROM IOTBAYUSER.SHIPPING WHERE SHIPPING_ID = '" +shipping_id+ "' AND DATE= '"+date+"' ";
              String fetch = "SELECT * FROM IOTBAYUSER.SHIPPING WHERE SHIPPING_ID = " +shipping_id+ " ";

        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            int ship = rs.getInt(1);
           // String date123 = rs.getString(7);
           // if (shipping_id123.equals(shipping_id) && date123.equals(date)){
             if (ship == shipping_id){
                String street = rs.getString(2);
                String suburb = rs.getString(3);
                String state = rs.getString(4);
                String postcode = rs.getString(5);
                String method = rs.getString(6);
                String date = rs.getString(7);
               
                return new Shipping(shipping_id, street,suburb,state, postcode, method,date);
            }
        }
        return null;   
    }
    
     
     
     
     
     public ArrayList<Shipping> fetchShipping() throws SQLException {
    
        String fetch = "SELECT * FROM IOTBAYUSER.SHIPPING";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Shipping> shippings =  new ArrayList();
        
        while (rs.next()) {
            int shipping_id = rs.getInt(1);
            String street = rs.getString(2);
            String suburb = rs.getString(3);
            String state = rs.getString(4);
            String postcode = rs.getString(5);
            String method = rs.getString(6);
            String date = rs.getString(7);
          
            shippings.add(new Shipping(shipping_id, street, suburb, state, postcode, method, date));
        }
        return shippings;
    }
     
      public void updateShipping(String street, String suburb, String state, String postcode, String method, String date) throws SQLException {       
        st.executeUpdate("UPDATE IOTBAYUSER.SHIPPING "
                + "SET STREET = '"+street+"', SUBURB = '"+suburb+"', STATE = '"+state+"', POSTCODE = '"+postcode+"', METHOD = '"+method+"', DATE= '"+date+"'");
               
    }
      
      public void deleteShipping(String street) throws SQLException{
        st.executeUpdate("DELETE FROM IOTBAYUSER.SHIPPING WHERE STREET = '" +street+ "'");
    }
      
}
