
package connect;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Phan Tuan Anh
 */
public class DBConnect {
    
    public static Connection getConnection(){
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //conn = DriverManager.getConnection("jdbc:mysql://node41221-didong.jelastic.skali.net/shop", "root", "EGDgzm02324");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xemay", "root", "123456");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
    
    public static void main(String[] args) {
        System.out.println(getConnection());
    }
    
}
