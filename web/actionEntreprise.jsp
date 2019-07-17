<%-- 
    Document   : actionEmploye
    Created on : 13 juil. 2015, 19:48:05
    Author     : Home
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="beanEntreprise" class="app.bean.Entreprise" scope="page" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            //method POST
            String num = request.getParameter("numEntreprise");
            String nom = request.getParameter("designEntreprise");
            String adr = request.getParameter("localEntreprise");
            
        beanEntreprise.setNumEntreprise(num);
        beanEntreprise.setDesignEntreprise(nom);
        beanEntreprise.setLocalEntreprise(adr);
        
        String bt = request.getParameter("btn");
        
        if(bt.equals("Ajouter")){
            out.println(beanEntreprise.ajoutEntreprise());
        }
        else if(bt.equals("Modifier")){
            beanEntreprise.modifEntreprise();
        }
    %>
            <jsp:forward page="entreprise.jsp"/>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
