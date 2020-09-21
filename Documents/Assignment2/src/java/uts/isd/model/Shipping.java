
package uts.isd.model;
import java.io.Serializable;

/**
 *
 * @author marcu
 */
public class Shipping implements Serializable{
    
       private int  shipping_id;
       private String street;
       private String suburb;
       private String state;        
       private String postcode;
       private String method;
       private String date;

    public Shipping(int shipping_id, String street, String suburb, String state, String postcode, String method, String date) {
        this.shipping_id = shipping_id;
        this.street = street;
        this.suburb = suburb;
        this.state = state;
        this.postcode = postcode;
        this.method = method;
        this.date = date;
    }

    public int getShipping_id() {
        return shipping_id;
    }

    public void setShipping_ID(int shipping_id) {
        this.shipping_id = shipping_id;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getSuburb() {
        return suburb;
    }

    public void setSuburb(String suburb) {
        this.suburb = suburb;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getMethod() {
        return method;
    }

    public void setShippingMethod(String method) {
        this.method = method;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
        
               
   
    
    
}
       
       
       
       
       
       
       
       
       
       
       
       
