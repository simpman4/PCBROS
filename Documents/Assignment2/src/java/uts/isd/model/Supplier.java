package uts.isd.model;
import java.io.Serializable;

public class Supplier implements Serializable{
    private int id;
    private String contactName;
    private String companyName;
    private String email;
    private String street;
    private String suburb;
    private String state;
    private String postcode;
    private boolean status;
    
    public Supplier(int id, String contactName, String companyName, String email, String street, String suburb, String state, String postcode, boolean status) {
        this.id = id;
        this.contactName = contactName;
        this.companyName = companyName;
        this.email = email;
        this.street = street;
        this.suburb = suburb;
        this.state = state;
        this.postcode = postcode;
        this.status = status;
    }

    public boolean isActive() {return status;}
    public String isActiveString() {
        if (isActive()) {
            return "Active";
        }
        return "Inactive";
    }
    public void setStatus(boolean status) {this.status = status;}

    public int getId() {return id;}
    public void setId(int id) {this.id = id;}
    
    public String getContactName() {return contactName;}
    public void setContactName(String contactName) {this.contactName = contactName;}

    public String getCompanyName() {return companyName;}
    public void setCompanyName(String companyName) {this.companyName = companyName;}

    public String getEmail() {return email;}
    public void setEmail(String email) {this.email = email;}

    public String getStreet() {return street;}
    public void setStreet(String street) {this.street = street;}

    public String getSuburb() {return suburb;}
    public void setSuburb(String suburb) {this.suburb = suburb;}

    public String getState() {return state;}
    public void setState(String state) {this.state = state;}

    public String getPostcode() {return postcode;}
    public void setPostcode(String postcode) {this.postcode = postcode;}
}
