/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.bean;
/**
 *
 * @author Home
 */
import static java.lang.System.out;
import java.sql.*;

/**
 *
 * @author Home
 */
public class Employe {
    
    Connection conn = null;
    Statement st;
    ResultSet rs;
    
    public String numEmploye;
    public String nomEmploye;
    public String adrEmploye;
    
    public Employe() {
        conn = Connexion.ConnexionMysql();
        this.numEmploye="";
        this.nomEmploye="";
        this.adrEmploye="";
    }
    
    public void setNumEmploye(String valNum){
        this.numEmploye=valNum;
    }
    
    public void setNomEmploye(String valNom){
        this.nomEmploye=valNom;
    }
    
    public void setAdrEmploye(String valAdr){
        this.adrEmploye=valAdr;
    }
    
    public String getNum(){
        return this.numEmploye;
    }
    
    public String getNom(){
        return this.nomEmploye;
    }
    
    public String getAdr(){
        return this.adrEmploye;
    }
    
    public void ajoutEmploye(){
         try{
             String sqlExiste = "SELECT * FROM EMPLOYE WHERE NUMEMPLOYE = '" + this.numEmploye + "' ";
             st = conn.createStatement();
             rs = st.executeQuery(sqlExiste);
             if(rs.next()){
                 out.println("existe");
             }
             else{
             String sql = "INSERT INTO EMPLOYE (NUMEMPLOYE, NOMEMPLOYE, ADREMPLOYE) "
                     + "VALUES('" + this.numEmploye + "','" + this.nomEmploye + "','" + this.adrEmploye + "')";
             st = conn.createStatement();
             st.execute(sql);
             out.println("Ajout Réussi");
             }
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
     }
    
    public String afficheEmploye(){
        String res="";
        try{
             String sql = "SELECT * FROM EMPLOYE ORDER BY NUMEMPLOYE";
             st = conn.createStatement();
             rs = st.executeQuery(sql);
             while(rs.next()){
                 String num = rs.getString("NUMEMPLOYE");
                 String nom = rs.getString("NOMEMPLOYE");
                 String adr = rs.getString("ADREMPLOYE");
                 String ligne = "<tr>"
                         + "<td>" + num + "</td>"
                         + "<td>" + nom + "</td>"
                         + "<td>" + adr + "</td>"
                         + "<td><a href=employe.jsp?numGet=" + num + "#encre><span class=\"glyphicon glyphicon-pencil\" style=\"color:green;\"></span></a> | "
                         + "<a class=\"suppr\" href=# onclick=\"ouvrirDialogSuppr('')\">"
                         + "<div class=\"glyphicon glyphicon-trash\" style=\"color:red;\"></div></a></td>"
                         + "</tr>";
                 res += ligne;
             }
             out.println("Affichage");
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
         return res;
    }
    
    public String getNomEmpl(){
        try{
            String sql = "SELECT NOMEMPLOYE FROM EMPLOYE WHERE NUMEMPLOYE = '" + this.numEmploye + "' ";
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            rs.next();
            String nom = rs.getString("NOMEMPLOYE");
            return nom;
        }
        catch(SQLException e){
            return e.getMessage();
        }
    }
    
    public String getAdrEmpl(){
        try{
            String sql = "SELECT ADREMPLOYE FROM EMPLOYE WHERE NUMEMPLOYE = '" + this.numEmploye + "' ";
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            rs.next();
            String adr = rs.getString("ADREMPLOYE");
            return adr;
        }
        catch(SQLException e){
            return e.getMessage();
        }
    }
    
    public void supprEmploye(){
        try{
             String sql = "DELETE FROM EMPLOYE WHERE NUMEMPLOYE = '"
                     + this.numEmploye + "'";
             st = conn.createStatement();
             st.execute(sql);
             
             String sqlTravail = "DELETE FROM travail WHERE NUMEMPLOYE = '" + this.numEmploye + "' ";
             st= conn.createStatement();
             st.execute(sqlTravail);
             
             out.println("Enregistrement supprimé");
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
    }
    
    public void modifEmploye(){
        try{
            String sql="UPDATE EMPLOYE SET NOMEMPLOYE = '" + this.nomEmploye
                    + "', ADREMPLOYE = '" + this.adrEmploye + "' "
                    + "WHERE NUMEMPLOYE = '" + this.numEmploye + "'";
            st = conn.createStatement();
            st.execute(sql);
            out.println("Enregistrement modifié");
            out.println(this.numEmploye);
        }
        catch(SQLException e){
            out.println(e.getMessage());
        }
    }
}