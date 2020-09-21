package uts.isd.model;
import java.io.Serializable;

public class User implements Serializable {
    
    private String type;
    private String email;
    private String password;
    private String name;
    private String street;
    private String suburb;
    private String state;
    private String postcode;
    private String dob;
    private String phoneNum;
    private int id;
    
    private String position;
    
    // Default system admin
    public User() { 
        this.type = "Admin";
        this.email = "iotbayadmin";
        this.password = "password123";
    }
    
    // Customer user
    public User (String email, String password, String name, String street, String suburb, String state, String postcode, String dob, String phoneNum) {
        this.type = "Customer";
        this.email = email;
        this.password = password;
        this.name = name;
        this.street = street;
        this.suburb = suburb;
        this.state = state;
        this.postcode = postcode;
        this.dob = dob;
        this.phoneNum = phoneNum;
    }
    
    // Staff user
    public User (int id, String email, String password, String name, String position, String phoneNum) {
        this.type = "Staff";
        this.id = id;
        this.email = email;
        this.password = password;
        this.name = name;
        this.position = position;
        this.phoneNum = phoneNum;
    }

    public int getId() {return id;}
    public void setId(int id) {this.id = id;}

    public String getPosition() {return position;}
    public void setPosition(String position) {this.position = position;}

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getStreet() { return street; }
    public void setStreet(String street) { this.street = street; }

    public String getSuburb() { return suburb; }
    public void setSuburb(String suburb) { this.suburb = suburb; }

    public String getState() { return state; }
    public void setState(String state) { this.state = state; }

    public String getPostcode() { return postcode; }
    public void setPostcode(String postcode) { this.postcode = postcode; }

    public String getDob() { return dob; }
    public void setDob(String dob) { this.dob = dob; }

    public String getPhoneNum() { return phoneNum; }
    public void setPhoneNum(String phoneNum) { this.phoneNum = phoneNum; }
    
    @Override
    public String toString() {
        return getEmail() + ", " + getName() + ", " + getStreet() + ", " + getSuburb() + ", " + getState() + ", " + getPostcode() + ", " + getDob() + ", " + getPhoneNum();
    }
}
