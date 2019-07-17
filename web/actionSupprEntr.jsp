<%-- 
    Document   : actionSupprEmp
    Created on : 11 juil. 2015, 20:07:52
    Author     : Home
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="beanEntreprise" class="app.bean.Entreprise" scope="page" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //method GET
            String numSuppr = request.getParameter("numGetSuppr");
            beanEntreprise.setNumEntreprise(numSuppr);
            beanEntreprise.supprEntreprise();
                    %>
        <jsp:forward page="entreprise.jsp"/>
    </body>
</html>
