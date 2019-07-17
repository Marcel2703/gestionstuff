<%-- 
    Document   : index
    Created on : 12 juil. 2015, 18:44:43
    Author     : Home
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--DOCTYPE html-->
<html>
<head>
	<meta charset = "UTF-8">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link type="text/css" href="css/styleMenu.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.css">
	<script type="text/javascript" src="js/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.cycle.all.js"></script>
	<script>
	$("document").ready(function(){
		$("#slideshow").cycle()
	})
	</script>
	<title>Gestion Employe | Accueil</title>
</head>
<body>
<div class = "espace">
    <div class="container">
        <!--menu-->
        <nav class="navbar">
            <div class="entete">
                <a href="index.jsp"><img src="images/templatemo_logo.jpg"></a>
                <div class="navbar-header navbar-right" id="nav" style="margin-top: 10px">
                    <ul id="glossy-menu">
                        <li class="istylei0"><a class="istylei0" href="index.jsp" style="color:#177493;">Accueil</a></li>
                        <li class="istylei0"><a class="istylei0" href="employe.jsp"><span>Employe</span></a>
                        </li>
                        <li class="istylei0"><a class="istylei0" href="entreprise.jsp"><span>Entreprise</span></a>
                        </li>
                        <li class="istylei0"><a class="istylei0" href="travail.jsp"><span>Travail</span></a>
                        </li>
                        <li class="istylei0"><a class="istylei0" href="detailsEntreprise.jsp">Details Entreprise</a></li>
                        <li class="istylei0"><a class="istylei0" href="salairesGlobaux.jsp">Etat de Salaire</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--fin menu-->
        <div class = "corps">
            <div id="slideshow">
                <img src="images/1.jpg" width="1100" height="300">
                <img src="images/2.jpg" width="1100" height="300">
                <img src="images/3.jpg" width="1100" height="300">
                <img src="images/4.jpg" width="1100" height="300">
            </div>
            <div class="col-md-7">
                <div class="row">
                    <div class="header_01"> Welcome </div>
                    <div class="col-md-4">
                        <img src="images/accueil.jpg">
                    </div>
                    <div class="col-md-8" id="message"> 
                        Bienvenue dans l'application GESTION EMPLOYE. Que vous soyez employé, dirigeant d'une entreprise, cette application est toujours indispensable
                    </div>
                </div>
                <div class="row"></br>
                    <div class="header_01">Article</div>
                    <div class="col-md-4">
                        <img src="images/photo_1.jpg">
                    </div>
                    <div class="col-md-4">
                            <img src="images/photo_3.jpg">
                    </div>
                    <div class="col-md-4">
                            <img src="images/photo_2.jpg">
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <h3>Actualités</h3>
                <a href="employe.jsp"><div class="header_02">Employés</div></a>
                <div class="row">	
                    <div class="col-md-4">
                        <a href="#"><img src="images/article1.jpg"></a>
                    </div>
                    <div class="col-md-7"> Quelques coordonnées de l'employé sont requis pour l'inscrire dans le programme
                        et ainsi effectuer des travaux dans des entreprises
                                                                        <!--<p class="dateActualite">22/05/15</p>//-->
                                                                        <a href="employe.jsp"><p class="voirPlus">[Voir plus]</p></a>
                    </div>
                </div>
                <a href="entreprise.jsp"><div class="header_02">Entreprise</div></a>
                <div class="row">
                    <div class="col-md-4">
                        <a href="#"><img src="images/article2.jpg"></a>
                    </div>
                    <div class="col-md-7">L'entreprise, ajouté par l'adminstrateur de l'application offre des différents travaux 
                        qui sera ensuite executés par les employés
                                                                        <!--<p class="dateActualite">05/04/15</p>//-->
                                                                        <a href="entreprise.jsp"><p class="voirPlus">[Voir plus]</p></a>
                    </div>
                </div>
                <a href="travail.jsp"><div class="header_02">Travail</div></a>
                <div class="row">
                    <div class="col-md-4">
                        <a href="#"><img src="images/article3.jpg"></a>
                    </div>
                    <div class="col-md-7">Après inscription, les employés peuvent, dans l'immediat commencer le travail qu'on lui a attribué dans le délai requis
                                                                        <!--<p class="dateActualite">01/04/15</p>//-->
                                                                        <a href="travail.jsp"><p class="voirPlus">[Voir plus]</p></a>
                    </div>
                </div></br>
                <!--<a href="#"><p class="afficherTout">Afficher tout</p></a>//-->
            </div>
        </div> <!-- fin corps //-->
    </div>
    <div id="footer">
        <div id="text_footer">
            Copyright © 2015 by <a href="#">WebNexus Compagny</a>
        </div> <!-- end of footer -->
    </div>
</div>
</body>
</html>