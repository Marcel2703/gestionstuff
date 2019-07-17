<%-- 
    Document   : actionEmploye
    Created on : 13 juil. 2015, 19:48:05
    Author     : Home
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="beanTravail" class="app.bean.Travail" scope="page" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            //method POST
            String num1 = request.getParameter("numTravail");
            String num2 = request.getParameter("numEmploye");
            String num3 = request.getParameter("numEntreprise");
            int nbHeures = Integer.parseInt(request.getParameter("nbHeures"));
            float tauxHoraires = Float.parseFloat(request.getParameter("tauxHoraires"));
            String dateEmbauche = request.getParameter("dateEmbauche");
            String objetDate = new String(dateEmbauche);
            String[] tabDate = objetDate.split("-");
            String jour = tabDate[0]; 
            String mois = tabDate[1];
            String annee = tabDate[2];
            String date = annee + "-" + mois + "-" + jour;
            
        beanTravail.setNumTravail(num1);
        beanTravail.setNumEmploye(num2);
        beanTravail.setNumEntreprise(num3);
        beanTravail.setNbHeures(nbHeures);
        beanTravail.setTauxHoraires(tauxHoraires);
        beanTravail.setDate(date);
        
        String bt = request.getParameter("btn");
        
        if(bt.equals("Ajouter")){
            beanTravail.ajoutTravail();
            //beanTravail.verif(date);
        }
        else if(bt.equals("Modifier")){
            beanTravail.modifTravail();
        }
    %>
            <jsp:forward page="travail.jsp"/>
    </head>
    <body>
    </body>
</html>
