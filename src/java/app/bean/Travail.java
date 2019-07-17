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
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Home
 */
public class Travail {
    
    Connection conn = null;
    Statement st;
    ResultSet rs;
    
    public String numTravail;
    public String numEmploye;
    public String numEntreprise;
    public int nbHeures;
    public float tauxHoraires;
    public Date dateEmbauche;
    public String dateString;
    
    public Travail() {
        conn = Connexion.ConnexionMysql();
        this.numEntreprise="";
        this.numEmploye="";
        this.numTravail="";
        this.nbHeures=0;
        this.tauxHoraires=0;
        this.dateEmbauche = new Date();
        this.dateString="";
    }
    
    public String formatDate(Date date){
        SimpleDateFormat f = new SimpleDateFormat("dd/MM/yy");
        String dateRes = f.format(date);
        return dateRes;
    }
    
    public void setNumEntreprise(String valNum){
        this.numEntreprise=valNum;
    }
    
    public void setNumEmploye(String valNum){
        this.numEmploye=valNum;
    }
    
    public void setNumTravail(String valNum){
        this.numTravail=valNum;
    }
    
    public void setNbHeures(int nb){
        this.nbHeures=nb;
    }
    
    public void setTauxHoraires(float taux){
        this.tauxHoraires=taux;
    }
    
    public void setDateEmbauche(Date date){
        this.dateEmbauche=date;
    }
    
    public void setDate(String date){
        this.dateString=date;
    }
    
    public String getNum(){
        return this.numTravail;
    }
    
    public String getNum1(){
        try{
            String sql = "SELECT numEmploye FROM travail WHERE numTravail = '" + this.numTravail + "' ";
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            rs.next();
            String num = rs.getString("numEmploye");
            return num;
        }
        catch(SQLException e){
            out.println(e.getMessage());
            return this.numEmploye;
        }
    }
    
    public String getNum2(){
        try{
            String sql = "SELECT numEntreprise FROM travail WHERE numTravail = '" + this.numTravail + "' ";
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            rs.next();
            String num = rs.getString("numEntreprise");
            return num;
        }
        catch(SQLException e){
            out.println(e.getMessage());
            return this.numEntreprise;
        }
    }
    
    public int getNbHeures(){
        try{
            String sql = "SELECT nbHeures FROM travail WHERE numTravail = '" + this.numTravail + "' ";
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            rs.next();
            int nb = rs.getInt("nbHeures");
            return nb;
        }
        catch(SQLException e){
            out.println(e.getMessage());
            return this.nbHeures;
        }
    }
    
    public float getTauxHoraires(){
        try{
            String sql = "SELECT tauxHoraires FROM travail WHERE numTravail = '" + this.numTravail + "' ";
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            rs.next();
            float taux = rs.getFloat("tauxHoraires");
            return taux;
        }
        catch(SQLException e){
            out.println(e.getMessage());
            return this.tauxHoraires;
        }
    }
    
    public Date getDateEmbauche(){
        try{
            String sql = "SELECT dateEmbauche FROM travail WHERE numTravail = '" + this.numTravail + "' ";
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            rs.next();
            Date date = rs.getDate("dateEmbauche");
            return date;
        }
        catch(SQLException e){
            out.println(e.getMessage());
            return this.dateEmbauche;
        }
    }
    
    public void ajoutTravail(){
         try{
             //int tauxEntier = Integer.parseFloat();
             //float nbFloat = Integer.toFloat(this.nbHeures);
             float salaire = this.nbHeures * this.tauxHoraires;
             String sql = "INSERT INTO travail (numTravail, numEmploye, numEntreprise, nbHeures, tauxHoraires, dateEmbauche, salaire) "
                     + "VALUES('" + this.numTravail + "','" + this.numEmploye + "','" + this.numEntreprise + "','" + this.nbHeures 
                     + "','" + this.tauxHoraires + "', '" + this.dateString + "', " + salaire + ")";
             st = conn.createStatement();
             st.execute(sql);
             out.println("Ajout Réussi");
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
     }
    
    public void verif(String date){
        out.println(date);
    }
    
    public String afficheTravail(){
        String res = "";
        try{
            String sql = "SELECT * FROM travail ORDER BY numTravail";
             st = conn.createStatement();
             rs = st.executeQuery(sql);
             while(rs.next()){
                 String num1 = rs.getString("numTravail");
                 String num2 = rs.getString("numEmploye");
                 String num3 = rs.getString("numEntreprise");
                 int heures = rs.getInt("nbHeures");
                 float taux = rs.getFloat("tauxHoraires");
                 int salaire = rs.getInt("salaire");
                 Date date = rs.getDate("dateEmbauche");
                 String ligne = "<tr>"
                         + "<td>" + num1 + "</td>"
                         + "<td>" + num2 + "</td>"
                         + "<td>" + num3 + "</td>"
                         + "<td>" + heures + "</td>"
                         + "<td>" + taux + "</td>"
                         + "<td>" + salaire + "</td>"
                         + "<td>" + date + "</td>"
                         + "<td><a href=travail.jsp?numGet=" + num1 + "#encre><span class=\"glyphicon glyphicon-pencil\" style=\"color:green;\"></span></a> | "
                         + "<a class=\"suppr\" href=# onclick=\"ouvrirDialogSuppr('" + num1 + "')\">"
                         + "<div class=\"glyphicon glyphicon-trash\" style=\"color:red;\"></div></a></td>"
                         + "</tr>";
                 res += ligne;
             }
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
        return res;
    }
    
    public void supprTravail(){
        try{
             String sql = "DELETE FROM travail WHERE numTravail = '"
                     + this.numTravail + "'";
             st = conn.createStatement();
             st.execute(sql);
             out.println("Enregistrement supprimé");
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
    }
    
    public void modifTravail(){
        try{
            String sql="UPDATE travail SET numEmploye = '" + this.numEmploye
                    + "', numEntreprise = '" + this.numEntreprise + "', nbHeures = '" + this.nbHeures + 
                    "', tauxHoraires = '" + this.tauxHoraires + "', dateEmbauche = '" + this.dateString + "' "
                    + "WHERE numTravail = '" + this.numTravail + "'";
            st = conn.createStatement();
            st.execute(sql);
        }
        catch(SQLException e){
            out.println(e.getMessage());
        }
    }
    
    public String afficheNumEmpl(){
        String res = "";
        try{
             String sql = "SELECT numEmploye, nomEmploye FROM employe";
             st = conn.createStatement();
             rs = st.executeQuery(sql);
             while(rs.next()){
                 String num = rs.getString("numEmploye");
                 String nom = rs.getString("nomEmploye");
                 String option = "<option value='" + num + "'> " + num + " - " + nom + "</option>";
                 res += option;
             }
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
         return res;
    }
    
    public String afficheNumEntr(){
        String res = "";
        try{
             String sql = "SELECT numEntreprise, designEntreprise FROM entreprise";
             st = conn.createStatement();
             rs = st.executeQuery(sql);
             while(rs.next()){
                 String num = rs.getString("numEntreprise");
                 String design = rs.getString("designEntreprise");
                 String option = "<option value='" + num + "'> " + num + " - " + design + "</option>";
                 res += option;
             }
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
        return res;
    }
    
    public String getEmpl(String num){
        String option = "";
        try{
             String sql = "SELECT nomEmploye FROM employe WHERE numEmploye = '" + num + "'";
             st = conn.createStatement();
             rs = st.executeQuery(sql);
             while(rs.next()){
                 String nom = rs.getString("nomEmploye");
                 option = "<option value='" + num + "'> " + num + " - " + nom + "</option>";
             }
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
        return option;
    }
    
    public String getNoEmpl(String num){
        String res = "";
        try{
             String sql = "SELECT numEmploye, nomEmploye FROM employe WHERE numEmploye <> '" + num + "'";
             st = conn.createStatement();
             rs = st.executeQuery(sql);
             while(rs.next()){
                 String numEmpl = rs.getString("numEmploye");
                 String nomEmpl = rs.getString("nomEmploye");
                 String option = "<option value='" + numEmpl + "'> " + numEmpl + " - " + nomEmpl + "</option>";
                 res += option;
             }
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
        return res;
    }
    
    public String getNoEntr(String num){
        String res = "";
        try{
             String sql = "SELECT numEntreprise, designEntreprise FROM entreprise WHERE numEntreprise <> '" + num + "'";
             st = conn.createStatement();
             rs = st.executeQuery(sql);
             while(rs.next()){
                 String numEntr = rs.getString("numEntreprise");
                 String nomEntr = rs.getString("designEntreprise");
                 String option = "<option value='" + numEntr + "'> " + numEntr + " - " + nomEntr + "</option>";
                 res += option;
             }
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
        return res;
    }
    
    public String getEntr(String num){
        String option = "";
        try{
             String sql = "SELECT designEntreprise FROM entreprise WHERE numEntreprise = '" + num + "'";
             st = conn.createStatement();
             rs = st.executeQuery(sql);
             rs.next();
                 String nom = rs.getString("designEntreprise");
                 option = "<option value='" + num + "'> " + num + " - " + nom + "</option>";
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
        return option;
    }
}
