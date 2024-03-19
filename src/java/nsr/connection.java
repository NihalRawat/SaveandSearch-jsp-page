
package nsr;
import java.sql.DriverManager;
import java.sql.*;

public class connection{

   
   public static java.sql.Connection getCon(){
            try{
           Class.forName("oracle.jdbc.driver.OracleDriver");
                 java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","school1","school1"); 
                return con;
            }
            catch(Exception e){
                System.out.print(e);
                    
                    
                return null;
            }
        }

   
}
