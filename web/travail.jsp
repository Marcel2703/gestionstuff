<%-- 
    Document   : employe
    Created on : 12 juil. 2015, 19:28:33
    Author     : Home
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="beanTravail" class="app.bean.Travail" scope="page" />
<!--DOCTYPE html-->
<html>
<head>
	<meta charset = "UTF-8">
	<link rel="stylesheet" type="text/css" href="css/styleTravail.css">
	<link type="text/css" href="css/styleMenu.css" rel="stylesheet">
	<link type="text/css" href="css/jquery-ui.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.css">
	<script type="text/javascript" src="js/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<title>Gestion Employe | Travail</title>
	<script type="text/javascript">
		$(function(){
			$("#dateEmbauche").datepicker({dateFormat: ("dd-mm-yy")});
                        $("#btnAjouter").button();
                        $("#btnModifier").button();
                        
                        $( "#dialogAjout" ).dialog({autoOpen: false});
                        $( "#dialogModifier" ).dialog({autoOpen: false});
                        $( "#dialogSuppr" ).dialog({autoOpen: false});
                        $( "#dialogInfoSuppr" ).dialog({autoOpen: false});
                });
                    </script>
</head>
 <%
            
            String numModif = "", numModif1 = "", numModif2 = "";
            String readonly = "";
            int nbModif = 0;
            float tauxModif = 0;
            String dateFormater = "";
            Date dateModif = new Date();
            //method GET
            if(request.getParameter("numGet")!=null){
                numModif = request.getParameter("numGet");
                beanTravail.setNumTravail(numModif);
                numModif1 = beanTravail.getNum1();
                numModif2 = beanTravail.getNum2();
                nbModif = beanTravail.getNbHeures();
                tauxModif = beanTravail.getTauxHoraires();
                dateModif = beanTravail.getDateEmbauche();
                SimpleDateFormat fActuel = new SimpleDateFormat("dd-MM-yyyy");
                dateFormater = fActuel.format(dateModif);
        }
            if(numModif!=""){
                readonly = "readOnly";
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
                        <li class="istylei0"><a class="istylei0" href="travail.jsp" style="color:#177493;"><span>Travail</span></a>
                        </li>
                        <li class="istylei0"><a class="istylei0" href="detailsEntreprise.jsp">Details Entreprise</a></li>
                        <li class="istylei0"><a class="istylei0" href="salairesGlobaux.jsp">Etat de Salaire</a></li>
                    </ul>
                </div>
            </div>
        </nav>
			<!--fin menu-->

			<!-- corps du site -->
			<div class = "corps">
				<div class="header_01">Listage Travail</div>
                <div class="panel panel-default">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Numero</th>
                            <th>Employe</th>
                            <th>Entreprise</th>
                            <th>Nb Heures</th>
                            <th>Taux Horaires</th>
                            <th>Salaire</th>
                            <th>Date d'embauche</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%= beanTravail.afficheTravail() %>
                    </tbody>
                </table>
                </div>
                    <div class="col-md-9">
                        <div class="header_01" id="encre">A propos du travail</div>
                        <form class="form-horizontal" role="form" method='post' onSubmit='return false;'>
                            <div class="form-group">
                                <label for="" class="col-lg-2 control-label" style="text-align:left;"> Numéro : </label>
                                <div class="col-lg-4">
                                    <input type='text' class="form-control" name='numTravail' id='numTravail' value='<%= numModif %>' placeholder='Numéro...' <%= readonly %>/>
                                </div>
                                <div class="col-lg-5" style="padding-top: 7px; color:#b20d0d;">
                                    <label id="erreurNum"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-lg-2 control-label" style="text-align:left;"> Employé : </label>
                                <div class="col-lg-4">
                                    <% 
                                        if(numModif.isEmpty()){
                                            out.println("<select class=\"form-control\" name='numEmploye' id='numEmploye'>" + beanTravail.afficheNumEmpl() + "</select>");
                                        }else{
                                            out.println("<select class=\"form-control\" name='numEmploye' id='numEmploye'>" + beanTravail.getEmpl(numModif1) + 
                                                    beanTravail.getNoEmpl(numModif1)+ "</select>");
                                        }
                                    %>
                                </div>
                                <div class="col-lg-5" style="padding-top: 7px; color:#b20d0d;">
                                    <label id="erreurNum1"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-lg-2 control-label" style="text-align:left;"> Entreprise : </label>
                                <div class="col-lg-4">
                                    <% 
                                        if(numModif.isEmpty()){
                                            out.println("<select class=\"form-control\" name='numEntreprise' id='numEntreprise'>" + beanTravail.afficheNumEntr() + "</select>");
                                        }else{
                                            out.println("<select class=\"form-control\" name='numEntreprise' id='numEntreprise'>" + beanTravail.getEntr(numModif2) + 
                                                    beanTravail.getNoEntr(numModif2) + "</select>");
                                        }
                                    %>
                                </div>
                                <div class="col-lg-5" style="padding-top: 7px; color:#b20d0d;">
                                    <label id="erreurNum2"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="nbHeures" class="col-lg-2 control-label" style="text-align:left;">Nb heures : </label>
                                <div class="controls col-lg-4">
                                    <% 
                                        if(numModif.isEmpty()){
                                            out.println("<input type='text' class=\"form-control\" name='nbHeures' value='' id=\"nbHeures\" placeholder='Heures...' />");
                                        }else{
                                            out.println("<input type='text' class=\"form-control\" name='nbHeures' value='" + nbModif + "' id=\"nbHeures\"/>");
                                        }
                                    %>
                                </div>
                                <div class="col-lg-5" style="padding-top: 7px; color:#b20d0d;">
                                    <label id="erreurNbHeures"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="tauxHoraires" class="col-lg-2 control-label" style="text-align:left;">Taux horaires : </label>
                                <div class="controls col-lg-4">
                                    <% 
                                        if(numModif.isEmpty()){
                                            out.println("<input type='text' class=\"form-control\" name='tauxHoraires' value='' id=\"tauxHoraires\" placeholder='Taux...' />");
                                        }else{
                                            out.println("<input type='text' class=\"form-control\" name='tauxHoraires' value='" + tauxModif + "' id=\"tauxHoraires\"/>");
                                        }
                                    %>
                                </div>
                                <div class="col-lg-5" style="padding-top: 7px; color:#b20d0d;">
                                    <label id="erreurTaux"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="control-group">
                                    <label for="dateEmbauche" class="col-lg-2 control-label" style="text-align:left;">Date d'embauche :</label>
                                    <div class="controls col-lg-4">
                                        <div class="input-group">
                                            <% 
                                        if(numModif.isEmpty()){
                                            out.println("<input type='text' class=\"form-control\" name='dateEmbauche' value='' id=\"dateEmbauche\" />");
                                        }else{
                                            out.println("<input type='text' class=\"form-control\" name='dateEmbauche' value='" + dateFormater + "' id=\"dateEmbauche\"/>");
                                        }
                                            %>
                                            <label for="dateEmbauche" class="input-group-addon btn">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-5" style="padding-top: 7px; color:#b20d0d;">
                                    <label id="erreurDate"></label>
                                </div>
                                </div>
                            </div>
                            <div class="col-lg-offset-3">
                                <input type="submit" value="Ajouter" name="btn" id="btnAjouter" />
                                <input type="submit" value="Modifier" name="btn" id="btnModifier" />
                            
                            <!-- dialog -->
                                <div id="dialogAjout" title="Information">
                                    <p><span class="glyphicon glyphicon-info-sign" style="color:#1a557b">
                                        </span>Enregistrement effectué</p>
                                </div>
                                <div id="dialogModifier" title="Information">
                                    <p><span class="glyphicon glyphicon-info-sign" style="color:#1a557b">
                                        </span> Enregistrement modifié</p>
                                </div>
                                <div id="dialogInfoSuppr" title="Information">
                                    <p><span class="glyphicon glyphicon-info-sign" style="color:#1a557b">
                                        </span> Enregistrement supprimé</p>
                                </div>
                                <div id="dialogSuppr" title="Confirmation">
                                    <p><span class="glyphicon glyphicon-warning-sign" style="color:#b20d0d"></span>
                                        Voulez-vous vraiment supprimer cet enregistrement?</p>
                                </div>
                            </div>
                        </form>
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
        <script type="text/javascript" src="js/travail.js"></script>
</body>
</html>