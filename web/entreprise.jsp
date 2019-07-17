<%-- 
    Document   : entreprise
    Created on : 12 juil. 2015, 19:26:48
    Author     : Home
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="beanEntreprise" class="app.bean.Entreprise" scope="page" />
<!--DOCTYPE html-->
<html>
<head>
	<meta charset = "UTF-8">
	<link rel="stylesheet" type="text/css" href="css/styleEntreprise.css">
	<link type="text/css" href="css/styleMenu.css" rel="stylesheet">
	<link type="text/css" href="css/jquery-ui.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.css">
	<script type="text/javascript" src="js/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<title>Gestion Employé | Entreprise</title>
	<script type="text/javascript">
		$(document).ready(function(){
                
                $(".btnSubmit").button();
                        
                $( "#dialogAjout" ).dialog({autoOpen: false});
                $( "#dialogModifier" ).dialog({autoOpen: false});
                $( "#dialogSuppr" ).dialog({autoOpen: false});
                $( "#dialogInfoSuppr" ).dialog({autoOpen: false});
		});
	</script>
</head>
<%
            
            String numModif = "", designModif = "", localModif = "";
            String readonly = "";
            //method GET
            if(request.getParameter("numGet")!=null){
                numModif = request.getParameter("numGet");
                beanEntreprise.setNumEntreprise(numModif);
                designModif = beanEntreprise.getDesignEntreprise();
                localModif = beanEntreprise.getLocalEntreprise();
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
                        <li class="istylei0"><a class="istylei0" href="entreprise.jsp" style="color:#177493;"><span>Entreprise</span></a>
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

			<!-- corps du site -->
		<div class = "corps">
                <div class="header_01">Listage Entreprise</div>
                <div class="panel panel-default">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Numero</th>
                            <th>Nom</th>
                            <th>Adresse</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%= beanEntreprise.afficheEntreprise() %>
                    </tbody>
                </table>
                </div>
                    <div class="col-md-8">
                        <div class="header_01" id="encre">Coordonnées entreprise</div>
                        <form class="form-horizontal" role="form" method='post' onSubmit='return false;'>
                            <div class="form-group">
                                <label for="" class="col-lg-2 control-label" style="text-align:left;"> Numéro : </label>
                                <div class="col-lg-4">
                                    <td><input type='text' class="form-control" id="numEntreprise" name='numEntreprise' value='<%= numModif %>' placeholder='Num...' <%= readonly %>/></td>
                                </div>
                                <div class="col-lg-6" style="padding-top: 7px; color:#b20d0d;">
                                    <label id="erreurNumEntreprise"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-lg-2 control-label" style="text-align:left;"> Designation : </label>
                                <div class="col-lg-4">
                                    <td><input type='text' class="form-control" id="designEntreprise" name='designEntreprise' value='<%= designModif %>' placeholder='Designation...'/></td>
                                </div>
                                <div class="col-lg-6" style="padding-top: 7px; color:#b20d0d;">
                                    <label id="erreurDesignEntreprise"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-lg-2 control-label" style="text-align:left;"> Localisation : </label>
                                <div class="col-lg-4">
                                    <td><input type='text' class="form-control" id="localEntreprise" name='localEntreprise' value='<%= localModif %>' placeholder='Localisation...'/></td>
                                </div>
                                <div class="col-lg-6" style="padding-top: 7px; color:#b20d0d;">
                                    <label id="erreurLocalEntreprise"></label>
                                </div>
                            </div>
                            <div class="col-lg-offset-3">
                                <input type="submit" value="Ajouter" id="btnAjouter" name="btn" class="btnSubmit" />
                                <input type="submit" value="Modifier" id="btnModifier" name="btn" class="btnSubmit" />
                                
                                <div id="dialogAjout" title="Information">
                                    <p><span class="glyphicon glyphicon-info-sign" style="color:#1a557b">
                                        </span> Enregistrement effectué</p>
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
            </div> <!--fin container-->
	</div>
                                <div id="footer">
                                    <div id="text_footer">
                                        Copyright © 2015 by <a href="#">WebNexus Compagny</a>
                                    </div> <!-- end of footer -->
                                </div>
        <script type="text/javascript" src="js/entreprise.js"></script>
</body>
</html>