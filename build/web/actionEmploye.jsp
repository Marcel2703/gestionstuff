<%-- 
    Document   : actionEmploye
    Created on : 13 juil. 2015, 19:48:05
    Author     : Home
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="beanEmploye" class="app.bean.Employe" scope="page" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            //method POST
            String num = request.getParameter("numEmploye");
            String nom = request.getParameter("nomEmploye");
            String adr = request.getParameter("adrEmploye");
            
        beanEmploye.setNumEmploye(num);
        beanEmploye.setNomEmploye(nom);
        beanEmploye.setAdrEmploye(adr);
        
        String bt = request.getParameter("btn");
        
        if(bt.equals("Ajouter")){
            beanEmploye.ajoutEmploye();
        }
        else if(bt.equals("Modifier")){
            beanEmploye.modifEmploye();
        }
    %>
            <jsp:forward page="employe.jsp"/>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
