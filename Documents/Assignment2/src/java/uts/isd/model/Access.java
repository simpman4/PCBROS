package uts.isd.model;
import java.io.Serializable;

public class Access implements Serializable {
    
    private String email;
    private String login_time;
    private String logout_time;
    private String type;
    
    
   
    

    
    // Staff user
    public Access (String email, String login_time, String logout_time, String type) {
       this.type = type;
       this.email = email;
       this.login_time = login_time;
       this.logout_time = logout_time;
    }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getLogin_time() {
        return login_time;
    }

    public void setLogin_time(String login_time) {
        this.login_time = login_time;
    }

    public String getLogout_time() {
        return logout_time;
    }

    public void setLogout_time(String logout_time) {
        this.logout_time = logout_time;
    }

    
    @Override
    public String toString() {
        return getEmail() + ", " + getLogin_time() + ", " + getLogout_time() + ", " + getType();
}
}
