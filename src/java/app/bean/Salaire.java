/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package app.bean;

import java.io.*;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

/**
 *
 * @author Home
 */
public class Salaire {
    Connection conn = null;
    Statement st;
    ResultSet rs;
    
    public Date dateSalaire;
    
    public Salaire() {
        conn = Connexion.ConnexionMysql();
        this.dateSalaire = new Date();
    }
    
    public String afficheSalaire(int annee){
        String res="";
        try{
            String sql = "SELECT travail.numEmploye AS numEmploye, nomEmploye, adrEmploye, SUM(salaire) AS salaire "
                    + "FROM travail "
                    + "INNER JOIN employe "
                    + "ON employe.numEmploye = travail.numEmploye "
                    + "WHERE YEAR(dateEmbauche) = '" + annee + "' "
                    + "GROUP BY travail.numEmploye, nomEmploye, adrEmploye "
                    + "ORDER BY salaire DESC";
                st = conn.createStatement();
                rs = st.executeQuery(sql);
                while(rs.next()){
                 String num = rs.getString("numEmploye");   
                 String nom = rs.getString("nomEmploye");
                 String adr = rs.getString("adrEmploye");
                 int salaire = rs.getInt("salaire");
                 String ligne = "<tr>"
                         + "<td>" + num + "</td>"
                         + "<td>" + nom + "</td>"
                         + "<td>" + adr + "</td>"
                         + "<td>" + salaire + "</td>"
                         + "</tr>";
                 res += ligne;
            }
        }
        catch(Exception e){
            out.println(e.getMessage());
        }
        return res;
    }
    
    public void histogramme(int annee){
        try{
            DefaultCategoryDataset dataset = new DefaultCategoryDataset();
            String sql = "SELECT nomEmploye, SUM(salaire) AS salaire "
                    + "FROM travail "
                    + "INNER JOIN employe "
                    + "ON employe.numEmploye = travail.numEmploye "
                    + "WHERE YEAR(dateEmbauche) = '" + annee + "' "
                    + "GROUP BY travail.numEmploye, nomEmploye, adrEmploye "
                    + "ORDER BY travail.numEmploye";
                st = conn.createStatement();
                rs = st.executeQuery(sql);
                while(rs.next()){
                 String nom = rs.getString("nomEmploye");
                 int salaire = rs.getInt("salaire");
                 
                //histogramme
                dataset.setValue(salaire, "Barre", nom);
            }
                JFreeChart chart = ChartFactory.createBarChart("Salaire global - " + annee, "employe", "Salaire", dataset, PlotOrientation.VERTICAL, true, true, true);
                /*response.setContentType("image/JPEG");
                OutputStream sa = response.getOutputStream();
                ChartUtilities.saveChartAsPNG(new File("E:/projet/JSP/GestionEmploye/web/histogramme.png"), chart, 900, 400);*/
                //out.println("succes");
        }
        catch(Exception e){
            out.println(e.getMessage());
        }
    }
    
    public void camembert(int annee){
        try{
            DefaultPieDataset dataset = new DefaultPieDataset();
            String sql = "SELECT nomEmploye, SUM(salaire) AS salaire "
                    + "FROM travail "
                    + "INNER JOIN employe "
                    + "ON employe.numEmploye = travail.numEmploye "
                    + "WHERE YEAR(dateEmbauche) = '" + annee + "' "
                    + "GROUP BY travail.numEmploye, nomEmploye, adrEmploye "
                    + "ORDER BY travail.numEmploye";
                st = conn.createStatement();
                rs = st.executeQuery(sql);
                while(rs.next()){
                 String nom = rs.getString("nomEmploye");
                 int salaire = rs.getInt("salaire");
                 
                //histogramme
                dataset.setValue(nom, salaire);
            }
                JFreeChart chart = ChartFactory.createPieChart("Salaire global - " + annee, dataset, true, true, true);
               /* response.setContentType("image/JPEG");
                OutputStream sa = response.getOutputStream();
                ChartUtilities.writeChartAsJPEG(sa, chart, 500, 500);*/
                ChartUtilities.saveChartAsPNG(new File("E:/projet/JSP/GestionEmploye/web/camembert.png"), chart, 600, 500);
                out.println("succes");
        }
        catch(Exception e){
            out.println(e.getMessage());
        }
    }
    
    public int salaireTotal(int annee){
        int total = 0;
        try{
            String sql = "SELECT SUM(salaire) AS total FROM travail "
                    + "WHERE YEAR(dateEmbauche) = '" + annee + "' ";
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            rs.next();
            total = rs.getInt("total");
        }
        catch(Exception e){
            out.println(e.getMessage());
        }
        return total;
    }
}
