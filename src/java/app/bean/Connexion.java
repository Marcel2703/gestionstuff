/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Home
 */
package app.bean;
import static java.lang.System.out;
import java.sql.*;

public class Connexion {
    Connection conn = null;
    Statement st;
    ResultSet rs;
     
     public static Connection ConnexionMysql(){
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gest_employe","root","");
            //JOptionPane.showMessageDialog(null, "Connection réussie");
            out.println("Connexion");
            return conn;
        }
        catch(ClassNotFoundException | SQLException e){
            out.println(e.getMessage());
            return null;
        }
     }
     
     /*public static Connection ConnexionOracle(){
        Connection conn = null;
        Statement stat;
         try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@169.254.73.76:1521:xe", "DAVAH", "dba");
            //stat = (Statement) conn.createStatement();
            //JOptionPane.showMessageDialog(null, "Connection réussie");
            return conn;
         }
         catch(Exception e){
             out.println(e.getMessage());
             return null;
         }
     }*/
}
