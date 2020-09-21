/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

/**
 *
 * @author Ethan
 */

import java.io.Serializable;

public class Product implements Serializable {
    
    private String productName;
    private String deviceType;
    private String unitPrice;
    private String quantity;
 
    
    // Product
    public Product(String productName, String deviceType, String unitPrice, String quantity) { 
        this.productName = productName;
        this.deviceType = deviceType;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
    }
    
    
    public String getProductName() {
        return productName;
    }
    
    public String getDeviceType() {
        return deviceType;
    }
    
    public String getUnitPrice() {
        return ("$" + unitPrice);
    }
    
    public String getUnitPriceNormal() {
        return unitPrice;
    }
    
    public String getQuantity() {
        return quantity;
    }
    
    
}
