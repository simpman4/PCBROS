package uts.isd.model;
import java.io.Serializable;

public class Payment implements Serializable {
    
    private String PaymentMethod;
    private String CardNumber;
    private String CVC;
    private String ExpiryDate;
    
    
    // Default system admin

    public Payment(String CardNumber, String PaymentMethod, String CVC, String ExpiryDate) {

        this.PaymentMethod = PaymentMethod;
        this.CardNumber = CardNumber;
        this.CVC = CVC;
        this.ExpiryDate = ExpiryDate;
    }


    public String getPaymentMethod() {
        return PaymentMethod;
    }

    public void setPaymentMethod(String PaymentMethod) {
        this.PaymentMethod = PaymentMethod;
    }

    public String getCardNumber() {
        return CardNumber;
    }

    public void setCardNumber(String CardNumber) {
        this.CardNumber = CardNumber;
    }

    public String getCVC() {
        return CVC;
    }

    public void setCVC(String CVC) {
        this.CVC = CVC;
    }

    public String getExpiryDate() {
        return ExpiryDate;
    }

    public void setExpiryDate(String ExpiryDate) {
        this.ExpiryDate = ExpiryDate;
    }
   
    
    
    @Override
    public String toString() {
        return getPaymentMethod() + ", " + getCardNumber() + ", " + getCVC() + ", " + getExpiryDate();
    }
}
