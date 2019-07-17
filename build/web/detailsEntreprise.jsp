<%-- 
    Document   : employe
    Created on : 12 juil. 2015, 19:28:33
    Author     : Home
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="beanDetailsEntreprise" class="app.bean.DetailsEntreprise" scope="page" />
<!--DOCTYPE html-->
<html>
    <head>
        <meta charset = "UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styleDetails.css">
        <link type="text/css" href="css/styleMenu.css" rel="stylesheet">
        <link type="text/css" href="css/jquery-ui.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.css">
        <script type="text/javascript" src="js/bootstrap/js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        <title>Gestion Employe | Details Entreprise</title>
        <script type="text/javascript">
            $(function() {
                $("#dateDebut").datepicker({dateFormat: ("dd-mm-yy")});
                $("#dateFin").datepicker({dateFormat: ("dd-mm-yy")});
                $("#btn").button();
                $("#radioset").buttonset();
            });

        </script>


    </head>
    <%
        String numEntr = "", designEntr = "";
        if (request.getParameter("numEntreprise") != null) {
            numEntr = request.getParameter("numEntreprise");
            designEntr = beanDetailsEntreprise.getDesignEntr(numEntr);
        }

        String dateDebut = "", date1 = "";
        if (request.getParameter("dateDebut") != null) {
            dateDebut = request.getParameter("dateDebut");
            if (!dateDebut.isEmpty()) {
                String objetDateDebut = new String(dateDebut);
                String[] tabDateDebut = objetDateDebut.split("-");
                int jourDebut = Integer.parseInt(tabDateDebut[0]);
                int moisDebut = Integer.parseInt(tabDateDebut[1]);
                int anneeDebut = Integer.parseInt(tabDateDebut[2]);
                date1 = anneeDebut + "-" + moisDebut + "-" + jourDebut;
            }
        }

        String dateFin = "", date2 = "";
        if (request.getParameter("dateFin") != null) {
            dateFin = request.getParameter("dateFin");
            if (!dateFin.isEmpty()) {
                String objetDateFin = new String(dateFin);
                String[] tabDateFin = objetDateFin.split("-");
                int jourFin = Integer.parseInt(tabDateFin[0]);
                int moisFin = Integer.parseInt(tabDateFin[1]);
                int anneeFin = Integer.parseInt(tabDateFin[2]);
                date2 = anneeFin + "-" + moisFin + "-" + jourFin;
            }
        }

        String anneeMois = "", mois = "";
        if (request.getParameter("anneeMois") != null) {
            anneeMois = request.getParameter("anneeMois");
            mois = request.getParameter("mois");
        }

        String annee = "";
        if (request.getParameter("annee") != null) {
            annee = request.getParameter("annee");
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
                                <li class="istylei0"><a class="istylei0" href="detailsEntreprise.jsp" style="color:#177493;">Details Entreprise</a></li>
                                <li class="istylei0"><a class="istylei0" href="salairesGlobaux.jsp">Etat de Salaire</a></li>
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
                                    <label for="" class="col-lg-4 control-label" style="text-align:left;"> N° ENTREPRISE : </label>
                                    <div class="col-lg-6">
                                        <input type='text' class="form-control" name='numEmploye' value='<%= numEntr%>' readOnly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="col-lg-4 control-label" style="text-align:left;"> RAISON SOCIALE : </label>
                                    <div class="col-lg-6">
                                        <input type='text' class="form-control" name='nomEmploye' value='<%= designEntr%>' readOnly="true" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="col-lg-4 control-label" style="text-align:left;"> PERIODE : </label>
                                    <div class="col-lg-6">
                                        <input type='text' class="form-control" name='adrEmploye' value='<%
                                            if (!numEntr.isEmpty() && !dateDebut.isEmpty() && !dateFin.isEmpty()) {
                                                out.println(dateDebut + " -> " + dateFin);
                                            } else if (!numEntr.isEmpty() && !anneeMois.isEmpty() && !mois.isEmpty()) {
                                                out.println(beanDetailsEntreprise.convertitMois(mois) + " " + anneeMois);
                                            } else if (!numEntr.isEmpty() && !annee.isEmpty()) {
                                                out.println(annee);
                                            }
                                               %>' id="" readOnly="true" />
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
                                <%
                                    if (!numEntr.isEmpty() && !dateDebut.isEmpty() && !dateFin.isEmpty()) {
                                        out.println(beanDetailsEntreprise.afficheDetailsEntreprise(numEntr, date1, date2));
                                    } else if (!numEntr.isEmpty() && !anneeMois.isEmpty() && !mois.isEmpty()) {
                                        out.println(beanDetailsEntreprise.afficheDetailsEntrepriseMois(numEntr, mois, anneeMois));
                                    } else if (!numEntr.isEmpty() && !annee.isEmpty()) {
                                        out.println(beanDetailsEntreprise.afficheDetailsEntrepriseAnnee(numEntr, annee));
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-5">
                            <div class="header_01">Resultat</div>

                            <form class="form-horizontal" role="form" method='post' action="actionEmploye.jsp">
                                <div class="form-group">
                                    <label for="" class="col-lg-4 control-label" style="text-align:left;"> NB D'EMPLOYES : </label>
                                    <div class="col-lg-6">
                                        <input type='text' class="form-control" name='numEmploye' value='<%
                                            if (!numEntr.isEmpty() && !dateDebut.isEmpty() && !dateFin.isEmpty()) {
                                                out.println(beanDetailsEntreprise.CompteEmploye(numEntr, date1, date2));
                                            } else if (!numEntr.isEmpty() && !anneeMois.isEmpty() && !mois.isEmpty()) {
                                                out.println(beanDetailsEntreprise.CompteEmployeMois(numEntr, mois, anneeMois));
                                            } else if (!numEntr.isEmpty() && !annee.isEmpty()) {
                                                out.println(beanDetailsEntreprise.CompteEmployeAnnee(numEntr, annee));
                                            }
                                               %>' readOnly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="col-lg-4 control-label" style="text-align:left;"> SALAIRE TOTAL : </label>
                                    <div class="col-lg-6">
                                        <input type='text' class="form-control" name='nomEmploye' value='<%
                                            if (!numEntr.isEmpty() && !dateDebut.isEmpty() && !dateFin.isEmpty()) {
                                                out.println(beanDetailsEntreprise.salaireTotal(numEntr, date1, date2));
                                            } else if (!numEntr.isEmpty() && !anneeMois.isEmpty() && !mois.isEmpty()) {
                                                out.println(beanDetailsEntreprise.salaireTotalMois(numEntr, mois, anneeMois));
                                            } else if (!numEntr.isEmpty() && !annee.isEmpty()) {
                                                out.println(beanDetailsEntreprise.salaireTotalAnnee(numEntr, annee));
                                            }
                                               %>' readOnly="true" />
                                    </div>
                                </div>
                                <div class="form-group">

                                </div>
                            </form>
                        </div>
                        <div class="col-lg-offset-3 col-lg-4 ">
                            <div class="header_01">Selection</div>
                            <form class="form-horizontal" role="form" method='post' action="detailsEntreprise.jsp">
                                <div class="form-group">
                                    <label for="" class="col-lg-5 control-label" style="text-align:left;"> Numéro Entreprise : </label>
                                    <div class="col-lg-7">
                                        <select class="form-control" name='numEntreprise' ><%= beanDetailsEntreprise.afficheNumEntr()%> </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div id="radioset">
                                        <input type="radio" id="radio1" name="radio" checked="checked"><label for="radio1">Deux dates</label>
                                        <input type="radio" id="radio2" name="radio"><label for="radio2">Un mois</label>
                                        <input type="radio" id="radio3" name="radio"><label for="radio3">Une Annee</label>
                                    </div>
                                </div>
                                <div class="form-group" id="deuxDate">
                                    <div class="controls col-lg-6">
                                        <div class="input-group">
                                            <input type='text' class="form-control" name='dateDebut' id="dateDebut"/>
                                            <label for="dateDebut" class="input-group-addon btn">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="controls col-lg-6">
                                        <div class="input-group">
                                            <input type='text' class="form-control" name='dateFin' id="dateFin"/>
                                            <label for="dateFin" class="input-group-addon btn">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" id="anneeMois" style="display:none">
                                    <div class='col-lg-2'></div>
                                    <div class="col-lg-5">
                                        <select class="form-control" name='mois'> <%= beanDetailsEntreprise.afficheMois()%> </select>
                                    </div>
                                    <div class="col-lg-5">
                                        <input type='text' class="form-control" name='anneeMois'/>
                                    </div>
                                </div>
                                <div class="form-group"  id="annee" style="display:none">
                                    <div class='col-lg-7'></div>
                                    <div class="col-lg-5">
                                        <input type='text' class="form-control" name='annee' value=''/>
                                    </div>
                                </div>

                                <div class="col-lg-offset-10">
                                    <input type="submit" value="Envoyer" name="btn" id="btn"/>
                                </div>
                            </form>
                        </div>
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
    <script type="text/javascript" src="js/choixPeriode.js"></script>
</body>
</html>    