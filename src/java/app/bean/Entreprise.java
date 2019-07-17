/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package app.bean;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Home
 */
public class Entreprise {
    
    Connection conn = null;
    Statement st;
    ResultSet rs;
    
    public String numEntreprise;
    public String designEntreprise;
    public String localEntreprise;
    
    public Entreprise() {
        conn = Connexion.ConnexionMysql();
        this.numEntreprise="";
        this.designEntreprise="";
        this.localEntreprise="";
    }
    
    public void setNumEntreprise(String valNum){
        this.numEntreprise=valNum;
    }
    
    public void setDesignEntreprise(String valDesign){
        this.designEntreprise=valDesign;
    }
    
    public void setLocalEntreprise(String valLocal){
        this.localEntreprise=valLocal;
    }
    
    public String getNum(){
        return this.numEntreprise;
    }
    
    public String getDesign(){
        return this.designEntreprise;
    }
    
    public String getLocal(){
        return this.localEntreprise;
    }
    
    public String ajoutEntreprise(){
         try{
             String sql = "INSERT INTO entreprise (numEntreprise, designEntreprise, localEntreprise) "
                     + "VALUES('" + this.numEntreprise + "','" + this.designEntreprise + "','" + this.localEntreprise + "')";
             st = conn.createStatement();
             st.execute(sql);
             return "Ajout Réussi";
         }
         catch(SQLException e){
             return e.getMessage();
         }
     }
    
    public String afficheEntreprise(){
        try{
            String res = "";
             String sql = "SELECT * FROM entreprise ORDER BY numEntreprise";
             st = conn.createStatement();
             rs = st.executeQuery(sql);
             while(rs.next()){
                 String num = rs.getString("numEntreprise");
                 String nom = rs.getString("designEntreprise");
                 String adr = rs.getString("localEntreprise");
                 String ligne = "<tr>"
                         + "<td>" + num + "</td>"
                         + "<td>" + nom + "</td>"
                         + "<td>" + adr + "</td>"
                         + "<td><a href=entreprise.jsp?numGet=" + num + "#encre><span class=\"glyphicon glyphicon-pencil\" style=\"color:green;\"></span></a> | "
                         + "<a class=\"suppr\" href=# onclick=\"ouvrirDialogSuppr('" + num + "')\">"
                         + "<div class=\"glyphicon glyphicon-trash\" style=\"color:red;\"></div></a></td>"
                         + "</tr>";
                 res += ligne;
             }
             return res;
         }
         catch(SQLException e){
             return e.getMessage();
         }
    }
    
    public String getDesignEntreprise(){
        try{
            String sql = "SELECT designEntreprise FROM entreprise WHERE numEntreprise = '" + this.numEntreprise + "' ";
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            rs.next();
            String nom = rs.getString("designEntreprise");
            return nom;
        }
        catch(SQLException e){
            return e.getMessage();
        }
    }
    
    public String getLocalEntreprise(){
        try{
            String sql = "SELECT localEntreprise FROM entreprise WHERE numEntreprise = '" + this.numEntreprise + "' ";
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            rs.next();
            String adr = rs.getString("localEntreprise");
            return adr;
        }
        catch(SQLException e){
            return e.getMessage();
        }
    }
    
    public void supprEntreprise(){
        try{
             String sql = "DELETE FROM entreprise WHERE numEntreprise = '"
                     + this.numEntreprise + "'";
             st = conn.createStatement();
             st.execute(sql);
             
             String sqlTravail = "DELETE FROM travail WHERE numEntreprise = '" + this.numEntreprise + "' ";
             st= conn.createStatement();
             st.execute(sqlTravail);
             
             out.println("Enregistrement supprimé");
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
    }
    
    public void modifEntreprise(){
        try{
            String sql="UPDATE entreprise SET designEntreprise = '" + this.designEntreprise
                    + "', localEntreprise = '" + this.localEntreprise + "' "
                    + "WHERE numEntreprise = '" + this.numEntreprise + "'";
            st = conn.createStatement();
            st.execute(sql);
        }
        catch(SQLException e){
            out.println(e.getMessage());
        }
    }
    
}
