<%-- 
    Document   : employe
    Created on : 12 juil. 2015, 19:28:33
    Author     : Home
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="beanEmploye" class="app.bean.Employe" scope="page" />
<!--DOCTYPE html-->
<html>
    <head>
        <meta charset = "UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styleEmploye.css">
        <link type="text/css" href="css/styleMenu.css" rel="stylesheet">
        <link type="text/css" href="css/jquery-ui.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/font_awesome.css">
        <script type="text/javascript" src="js/bootstrap/js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        <title>Gestion Employe | Employe</title>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#btnAjouter").button();
                $("#suite1").button();
                $("#suite2").button();
                $("#suite3").button();
                $("#suiteNext").button();
                $("#btnModifier").button();


                $("#dialogAjout").dialog({autoOpen: false});
                $("#dialogModifier").dialog({autoOpen: false});
                $("#dialogSuppr").dialog({autoOpen: false});
                $("#dialogInfoSuppr").dialog({autoOpen: false});

            });
        </script>
        <%

            String numModif = "", nomModif = "", adrModif = "";
            String readonly = "";
            //method GET
            if (request.getParameter("numGet") != null) {
                numModif = request.getParameter("numGet");
                beanEmploye.setNumEmploye(numModif);
                nomModif = beanEmploye.getNomEmpl();
                adrModif = beanEmploye.getAdrEmpl();
            }
            if (numModif != "") {
                readonly = "readOnly";
            }

            //Compter nombres d'employés

        %>
    </head>
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
                                <li class="istylei0"><a class="istylei0" href="employe.jsp" style="color:#177493;"><span>Employe</span></a>
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
                <!-- corps du site -->
                <div class = "corps">
                    <div class="header_01">Listage Employé</div>
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
                                <%= beanEmploye.afficheEmploye()%>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-8">
                        <div class="header_01" id="encre">Coordonnées employé</div>
                        <form class="form-horizontal" role="form" method='post' onSubmit='return false;'>
                            <div class="form-group">
                                <label for="" class="col-lg-2 control-label" style="text-align:left;"> Numéro : </label>
                                <div class="col-lg-4">
                                    <td><input type='text' class="form-control" id="numEmploye" name='numEmploye' value='<%= numModif%>' placeholder='Num...' <%= readonly%>/></td>
                                </div>
                                <div class="col-lg-5" style="padding-top: 7px; color:#b20d0d;">
                                    <label id="erreurNumEmploye"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-lg-2 control-label" style="text-align:left;"> Nom : </label>
                                <div class="col-lg-4">
                                    <td><input type='text' class="form-control" id='nomEmploye' name='nomEmploye' value='<%= nomModif%>' placeholder='Nom...' /></td>
                                </div>
                                <div class="col-lg-5" style="padding-top: 7px; color:#b20d0d;">
                                    <label id="erreurNomEmploye"></label>

                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-lg-2 control-label" style="text-align:left;"> Adresse : </label>
                                <div class="col-lg-4">
                                    <td><input type='text' class="form-control" id='adrEmploye' name='adrEmploye' value='<%= adrModif%>' placeholder='Adresse...' /></td>
                                </div>
                                <div class="col-lg-5" style="padding-top: 7px; color:#b20d0d;">
                                    <label id="erreurAdrEmploye"></label>
                                </div>
                            </div>
                            <div class="col-lg-offset-3">
                                <input type="submit" value="Ajouter" name="btn" id="btnAjouter"/>
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
                </div> <!--fin container-->
            </div>
            <div id="footer">
                <div id="text_footer">
                    Copyright © 2015 by <a href="#">WebNexus Compagny</a>
                </div> <!-- end of footer -->
            </div>
            <script type="text/javascript" src="js/employe.js"></script>
    </body>
</html>