<%-- 
    Document   : actionSupprEmp
    Created on : 11 juil. 2015, 20:07:52
    Author     : Home
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="beanTravail" class="app.bean.Travail" scope="page" />
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
            beanTravail.setNumTravail(numSuppr);
            beanTravail.supprTravail();
                    %>
        <jsp:forward page="travail.jsp"/>
    </body>
</html>
