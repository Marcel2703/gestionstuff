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
import java.util.Date;

/**
 *
 * @author Home
 */
public class DetailsEntreprise {
    Connection conn = null;
    Statement st;
    ResultSet rs;
    
    public String numTravail;
    public String numEmploye;
    public String numEntreprise;
    public int nbHeures;
    public float tauxHoraires;
    public Date dateEmbauche;
    
    public DetailsEntreprise() {
        conn = Connexion.ConnexionMysql();
        this.numEntreprise="";
        this.numEmploye="";
        this.numTravail="";
        this.nbHeures=0;
        this.tauxHoraires=0;
        this.dateEmbauche = new Date();
    }
    
    public String getDesignEntr(String num){
        String design="";
        try{
            String sql = "SELECT designEntreprise FROM entreprise WHERE numEntreprise = '" + num + "' ";
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            rs.next();
            design = rs.getString("designEntreprise");
        }
        catch(SQLException e){
            out.println(e.getMessage());
        }
            return design;
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
    
    public String afficheDetailsEntreprise(String numEntr, String date1, String date2){
        String res="";
        Statement st1;
        ResultSet rs1;
        try{
            String sqlEmploye = "SELECT DISTINCT(numEmploye) AS numEmploye FROM travail "
                    + "WHERE (numEntreprise = '" + numEntr + "') "
                     + "AND (dateEmbauche BETWEEN '" + date1 + "' AND '" + date2 + "') "
                    + "ORDER BY numEmploye ";
            st = conn.createStatement();
            rs = st.executeQuery(sqlEmploye);
            while(rs.next()){
                String num = rs.getString("numEmploye");
                String sql = "SELECT nomEmploye, adrEmploye, SUM(salaire) AS salaire "
                     + "FROM travail "
                     + "INNER JOIN employe "
                     + "ON travail.numEmploye = employe.numEmploye "
                     + "WHERE (numEntreprise = '" + numEntr + "') AND travail.numEmploye = '" + num + "' "
                     + "AND (dateEmbauche BETWEEN '" + date1 + "' AND '" + date2 + "')";
             st1 = conn.createStatement();
             rs1 = st1.executeQuery(sql);
             while(rs1.next()){
                 String nom = rs1.getString("nomEmploye");
                 String adr = rs1.getString("adrEmploye");
                 String salaire = rs1.getString("salaire");
                 String ligne = "<tr><td>" + num + "</td>"
                         + "<td>" + nom + "</td>"
                         + "<td>" + adr + "</td>"
                         + "<td>" + salaire + "</td></tr>";
                 res += ligne;
             }
            }
        }
        catch(Exception e){
            out.println(e.getMessage());
        }
        return res;
    }
    
    public String afficheDetailsEntrepriseMois(String numEntr, String mois, String annee){
        String res="";
        Statement st1;
        ResultSet rs1;
        try{
            String sqlEmploye = "SELECT DISTINCT(numEmploye) AS numEmploye FROM travail "
                    + "WHERE numEntreprise = '" + numEntr + "' "
                     + "AND MONTH(dateEmbauche) = '" + mois + "' AND YEAR(dateEmbauche) = '" + annee + "' "
                    + "ORDER BY numEmploye ";
            st = conn.createStatement();
            rs = st.executeQuery(sqlEmploye);
            while(rs.next()){
                String num = rs.getString("numEmploye");
                String sql = "SELECT nomEmploye, adrEmploye, SUM(salaire) AS salaire "
                     + "FROM travail "
                     + "INNER JOIN employe "
                     + "ON travail.numEmploye = employe.numEmploye "
                    + "WHERE numEntreprise = '" + numEntr + "' AND travail.numEmploye = '" + num + "' "
                     + "AND MONTH(dateEmbauche) = '" + mois + "' AND YEAR(dateEmbauche) = '" + annee + "' ";
             st1 = conn.createStatement();
             rs1 = st1.executeQuery(sql);
             while(rs1.next()){
                 String nom = rs1.getString("nomEmploye");
                 String adr = rs1.getString("adrEmploye");
                 String salaire = rs1.getString("salaire");
                 String ligne = "<tr><td>" + num + "</td>"
                         + "<td>" + nom + "</td>"
                         + "<td>" + adr + "</td>"
                         + "<td>" + salaire + "</td></tr>";
                 res += ligne;
             }
             out.println("verification");
            }
        }
        catch(Exception e){
            out.println(e.getMessage());
        }
        return res;
    }
    
    public String afficheDetailsEntrepriseAnnee(String numEntr, String annee){
        String res="";
        Statement st1;
        ResultSet rs1;
        try{
            String sqlEmploye = "SELECT DISTINCT(numEmploye) AS numEmploye FROM travail "
                    + "WHERE numEntreprise = '" + numEntr + "' "
                     + "AND YEAR(dateEmbauche) = '" + annee + "' "
                    + "ORDER BY numEmploye ";
            st = conn.createStatement();
            rs = st.executeQuery(sqlEmploye);
            while(rs.next()){
                String num = rs.getString("numEmploye");
                String sql = "SELECT nomEmploye, adrEmploye, SUM(salaire) AS salaire "
                     + "FROM travail "
                     + "INNER JOIN employe "
                     + "ON travail.numEmploye = employe.numEmploye "
                    + "WHERE numEntreprise = '" + numEntr + "' AND travail.numEmploye = '" + num + "' "
                     + "AND YEAR(dateEmbauche) = '" + annee + "' ";
             st1 = conn.createStatement();
             rs1 = st1.executeQuery(sql);
             while(rs1.next()){
                 String nom = rs1.getString("nomEmploye");
                 String adr = rs1.getString("adrEmploye");
                 String salaire = rs1.getString("salaire");
                 String ligne = "<tr><td>" + num + "</td>"
                         + "<td>" + nom + "</td>"
                         + "<td>" + adr + "</td>"
                         + "<td>" + salaire + "</td></tr>";
                 res += ligne;
             }
             out.println("verification");
            }
        }
        catch(Exception e){
            out.println(e.getMessage());
        }
        return res;
    }
    
    public int CompteEmploye(String num, String date1, String date2){
        int compte=0;
        try{
             String sql = "SELECT COUNT(DISTINCT(numEmploye)) AS nbEmploye "
                     + "FROM travail "
                     + "WHERE (numEntreprise = '" + num + "') "
                     + "AND (dateEmbauche BETWEEN '" + date1 + "' AND '" + date2 + "')";
             st = conn.createStatement();
             rs = st.executeQuery(sql);
             if(rs.next()){
                 compte = rs.getInt("nbEmploye");
             }
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
        return compte;
    }
    
    public int CompteEmployeMois(String num, String mois, String annee){
        int compte=0;
        try{
             String sql = "SELECT COUNT(DISTINCT(numEmploye)) AS nbEmploye "
                     + "FROM travail "
                     + "WHERE numEntreprise = '" + num + "' "
                     + "AND MONTH(dateEmbauche) = '" + mois + "' AND YEAR(dateEmbauche) = '" + annee + "' ";
             st = conn.createStatement();
             rs = st.executeQuery(sql);
             if(rs.next()){
                 compte = rs.getInt("nbEmploye");
             }
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
        return compte;
    }
    
    public int CompteEmployeAnnee(String num, String annee){
        int compte=0;
        try{
             String sql = "SELECT COUNT(DISTINCT(numEmploye)) AS nbEmploye "
                     + "FROM travail "
                     + "WHERE numEntreprise = '" + num + "' "
                     + "AND YEAR(dateEmbauche) = '" + annee + "' ";
             st = conn.createStatement();
             rs = st.executeQuery(sql);
             if(rs.next()){
                 compte = rs.getInt("nbEmploye");
             }
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
        return compte;
    }
    
    public int salaireTotal(String num, String date1, String date2){
        int total=0;
        try{
             String sql = "SELECT SUM(salaire) AS salaire "
                     + "FROM travail "
                     + "WHERE (numEntreprise = '" + num + "') "
                     + "AND (dateEmbauche BETWEEN '" + date1 + "' AND '" + date2 + "')";
             st = conn.createStatement();
             rs = st.executeQuery(sql);
             if(rs.next()){
                 total = rs.getInt("salaire");
             }
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
        return total;
    }
    
    public int salaireTotalMois(String num, String mois, String annee){
        int total=0;
        try{
             String sql = "SELECT SUM(salaire) AS salaire "
                     + "FROM travail "
                     + "WHERE (numEntreprise = '" + num + "') "
                     + "AND MONTH(dateEmbauche) = '" + mois + "' AND YEAR(dateEmbauche) = '" + annee + "' ";
             st = conn.createStatement();
             rs = st.executeQuery(sql);
             if(rs.next()){
                 total = rs.getInt("salaire");
             }
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
        return total;
    }
    
    public int salaireTotalAnnee(String num, String annee){
        int total=0;
        try{
             String sql = "SELECT SUM(salaire) AS salaire "
                     + "FROM travail "
                     + "WHERE (numEntreprise = '" + num + "') "
                     + "AND YEAR(dateEmbauche) = '" + annee + "' ";
             st = conn.createStatement();
             rs = st.executeQuery(sql);
             if(rs.next()){
                 total = rs.getInt("salaire");
             }
         }
         catch(SQLException e){
             out.println(e.getMessage());
         }
        return total;
    }
    
    public String afficheMois(){
        String res = "";
        res = "<option value=1> Janvier </option>"
                + "<option value=2> Fevrier </option>"
                + "<option value=3> Mars </option>"
                + "<option value=4> Avril </option>"
                + "<option value=5> Mais </option>"
                + "<option value=6> Juin </option>"
                + "<option value=7> Juillet </option>"
                + "<option value=8> Aout </option>"
                + "<option value=9> Septembre </option>"
                + "<option value=10> Octobre </option>"
                + "<option value=11> Novembre </option>"
                + "<option value=12> Decembre </option>";
        return res;
    }
    
    public String convertitMois(String mois){
        String res="";
        switch (mois) {
            case "1":
                res="Janvier";
                break;
            case "2":
                res="Février";
                break;
            case "3":
                res="Mars";
                break;
            case "4":
                res="Avril";
                break;
            case "5":
                res="Mais";
                break;
            case "6":
                res="Juin";
                break;
            case "7":
                res="Juillet";
                break;
            case "8":
                res="Aout";
                break;
            case "9":
                res="Septembre";
                break;
            case "10":
                res="Octobre";
                break;
            case "11":
                res="Novembre";
                break;
            case "12":
                res="Décembre";
                break;
        }
        return res;
    }
    
}
