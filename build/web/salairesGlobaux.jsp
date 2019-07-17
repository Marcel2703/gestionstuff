<%-- 
    Document   : employe
    Created on : 12 juil. 2015, 19:28:33
    Author     : Home
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="beanSalaire" class="app.bean.Salaire" scope="page" />
<!--DOCTYPE html-->
<html>
<head>
	<meta charset = "UTF-8">
	<link rel="stylesheet" type="text/css" href="css/styleEmploye.css">
	<link type="text/css" href="css/styleMenu.css" rel="stylesheet">
	<link type="text/css" href="css/jquery-ui.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.css">
	<script type="text/javascript" src="js/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<title>Gestion Employe | Salaires Globaux</title>
	<script type="text/javascript">
		$(function(){
			$("#dateEmbauche").datepicker({dateFormat: ("dd-mm-yy")});
			$("#dateEmbauche").datepicker({dateFormat: ("dd-mm-yy")});
                        $("#btn" ).button();
                        $(".btn").button();
		});
	</script>
</head>
 <%
            Date dateSystem = new Date();
            int year = dateSystem.getYear();
            year += 1900;
            //method GET
            if(request.getParameter("anneeSalaire")!=null){
                year = Integer.parseInt(request.getParameter("anneeSalaire"));
            }
            %>
<body>
	<div class = "espace">
		<div class="container">
			<!-- entete du page -->
			<!--menu-->
			<nav class="navbar">
            <div class="entete">
                <a href="index.jsp"><img src="images/templatemo_logo.jpg"></a>
                <div class="navbar-header navbar-right" id="nav" style="margin-top: 10px">
                    <ul id="glossy-menu">
                        <li class="istylei0"><a class="istylei0" href="index.jsp">Accueil</a></li>
                        <li class="istylei0"><a class="istylei0" href="employe.jsp"><span>Employe</span></a>
                        </li>
                        <li class="istylei0"><a class="istylei0" href="entreprise.jsp"><span>Entreprise</span></a>
                        </li>
                        <li class="istylei0"><a class="istylei0" href="travail.jsp"><span>Travail</span></a>
                        </li>
                        <li class="istylei0"><a class="istylei0" href="detailsEntreprise.jsp">Details Entreprise</a></li>
                        <li class="istylei0"><a class="istylei0" href="salairesGlobaux.jsp" style="color:#177493;">Etat de Salaire</a></li>
                    </ul>
                </div>
            </div>
        </nav>
			<!--fin menu-->

			<!-- corps du site -->
			<div class = "corps">
                            <div class="row">
                            <div class="col-md-5">
                                <div class="header_01">Liste des employés</div>
                        <form class="form-horizontal" role="form" method='post' action="actionEmploye.jsp">
                            <div class="form-group">
                                <label for="" class="col-lg-4 control-label" style="text-align:left;"> ANNEE : </label>
                                <div class="col-lg-6">
                                    <input type='text' class="form-control" name='numEmploye' value=" <%= year %> " readOnly="true"/>
                                </div>
                            </div>
                        </form>
                            </div>
                            </div>
                            <div class="header_01"></div>
                            <div class="panel panel-default">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>N°Employé</th>
                                            <th>Nom Employé</th>
                                            <th>Adresse</th>
                                            <th>Salaire</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%= beanSalaire.afficheSalaire(year) %>
                                    </tbody>
                                </table>
                                    <div class="panel-footer">
                                        <p class="col-lg-offset-10"> <a href="histogramme.jsp?yearHisto=<%= year %>" ><input type="submit" value="Tracer Histogramme" name="btn" class="btn"/></a></p>
                                        <p class="col-lg-offset-10"> <a href="camembert.jsp?yearHisto=<%= year %>" ><input type="submit" value="Tracer Camembert" name="btn" class="btn"/></a></p>
                                    </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-5">
                                <div class="header_01"></div>
                                
                                <form class="form-horizontal" role="form" method='post' action="actionEmploye.jsp">
                            <div class="form-group">
                                <label for="" class="col-lg-4 control-label" style="text-align:left;"> MONTANT TOTAL : </label>
                                <div class="col-lg-6">
                                    <input type='text' class="form-control" name='numEmploye' value=' <%= beanSalaire.salaireTotal(year) %>' readOnly="true"/>
                                </div>
                            </div> 
                        </form>
                            </div>
                                <div class="col-lg-offset-5 col-lg-2 ">
                        <div class="header_01">Selection</div>
                        <form class="form-horizontal" role="form" method='post' action="salairesGlobaux.jsp">
                            <div class="form-group">
                                <label for="" class="col-lg-5 control-label" style="text-align:left;"> ANNEE : </label>
                                <div class="col-lg-7">
                                    <input type='text' class="form-control" name='anneeSalaire'/>
                                </div>
                            </div>
                            <div class="col-lg-offset-10">
                                <input type="submit" value="Envoyer" name="btn" id="btn"/>
                            </div>
                        </form>
                                </div>
                            </div>
                            
                        </div> <!--fin corps-->

			<!-- pieds de page -->
                </div> <!--fin container-->
        </div>
    <div id="footer">
        <div id="text_footer">
            Copyright © 2015 by <a href="#">WebNexus Compagny</a>
        </div> <!-- end of footer -->
    </div>
</body>
</html>    