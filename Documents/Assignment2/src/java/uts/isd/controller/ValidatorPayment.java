package uts.isd.controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

public class ValidatorPayment implements Serializable{ 
 
    private String patternCardNumber = "(^\\d+$)";      
    private String patternCVC = "(^\\d{1,10}$)";            
              
    public ValidatorPayment(){}       

    public boolean validate2(String pattern, String input){       
      
        Pattern regEx = Pattern.compile(pattern);       
        Matcher match = regEx.matcher(input);       

        return match.matches(); 
    }       

    public boolean checkEmpty2(String CardNumber){       
        return  CardNumber.isEmpty();   
    }
   
    public boolean validateCardNumber(String CardNumber){                       
        return validate2(patternCardNumber, CardNumber);   
    }
       
    public boolean validateCVC(String CVC){
        return validate2(patternCVC, CVC); 
    }       
    
    public void clear2(HttpSession session) {
        session.setAttribute("cardNumberErr", "Enter CardNumber...");
        session.setAttribute("CVCErr", "Enter CVC...");
        session.setAttribute("existErr", "");
        session.setAttribute("PaymentAdded", "");
        session.setAttribute("CardNumberDeleted", "");
    }
 
}