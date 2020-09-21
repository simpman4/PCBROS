package uts.isd.model.dao;
import java.sql.Connection;

public abstract class DB {
    
    protected String URL = "jdbc:derby://localhost:1527/";
    protected String db = "iotbaydb";
    protected String dbuser = "iotbayuser";
    protected String dbpass = "admin";
    protected String driver = "org.apache.derby.jdbc.ClientDriver";
    protected Connection conn;
    
}
