package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO7 {
    protected static Connection con;

    public DAO7() {
        if (con == null) {
            String dbUrl = "jdbc:mysql://localhost:3306/garaman?useUnicode=true&characterEncoding=UTF-8&useSSL=false&allowPublicKeyRetrieval=true";
            String dbClass = "com.mysql.cj.jdbc.Driver";
            try {
                Class.forName(dbClass);
                con = DriverManager.getConnection(dbUrl, "root", "");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
