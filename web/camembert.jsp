<%-- 
    Document   : employe
    Created on : 12 juil. 2015, 19:28:33
    Author     : Home
--%>

<%@page import="java.awt.Color"%>
<%@page import="app.bean.Connexion"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.*"%>
<%@page import="org.jfree.data.general.*"%>
<%@page import="org.jfree.chart.plot.*"%>
<%@page import="org.jfree.chart.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="beanSalaire" class="app.bean.Salaire" scope="page" />
<!--DOCTYPE html-->
<html>
<head>
	<meta charset = "UTF-8">
</head>
<body>
<%
    Connection conn = null;
    Statement st;
    ResultSet rs;
    conn = Connexion.ConnexionBase();
    
    String year="";
    year=request.getParameter("yearHisto");
    
            DefaultPieDataset dataset = new DefaultPieDataset();
            String sql = "SELECT nomEmploye, SUM(salaire) AS salaire "
                    + "FROM travail "
                    + "INNER JOIN employe "
                    + "ON employe.numEmploye = travail.numEmploye "
                    + "WHERE YEAR(dateEmbauche) = '" + year + "' "
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
                JFreeChart chart = ChartFactory.createPieChart3D("Salaire global - " + year, dataset, true, true, true);
                response.setContentType("image/JPEG");
                OutputStream sa = response.getOutputStream();
                ChartUtilities.writeChartAsJPEG(sa,chart,700,500);
    %>
</body>
</html>    