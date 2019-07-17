package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--DOCTYPE html-->\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("\t<meta charset = \"UTF-8\">\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\n");
      out.write("\t<link type=\"text/css\" href=\"css/styleMenu.css\" rel=\"stylesheet\">\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"css/bootstrap/css/bootstrap.css\">\n");
      out.write("\t<script type=\"text/javascript\" src=\"js/bootstrap/js/bootstrap.js\"></script>\n");
      out.write("\t<script type=\"text/javascript\" src=\"js/jquery.js\"></script>\n");
      out.write("\t<script type=\"text/javascript\" src=\"js/jquery.cycle.all.js\"></script>\n");
      out.write("\t<script>\n");
      out.write("\t$(\"document\").ready(function(){\n");
      out.write("\t\t$(\"#slideshow\").cycle()\n");
      out.write("\t})\n");
      out.write("\t</script>\n");
      out.write("\t<title>Gestion Employe | Accueil</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<div class = \"espace\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <!--menu-->\n");
      out.write("        <nav class=\"navbar\">\n");
      out.write("            <div class=\"entete\">\n");
      out.write("                <a href=\"index.jsp\"><img src=\"images/templatemo_logo.jpg\"></a>\n");
      out.write("                <div class=\"navbar-header navbar-right\" id=\"nav\" style=\"margin-top: 10px\">\n");
      out.write("                    <ul id=\"glossy-menu\">\n");
      out.write("                        <li class=\"istylei0\"><a class=\"istylei0\" href=\"index.jsp\" style=\"color:#177493;\">Accueil</a></li>\n");
      out.write("                        <li class=\"istylei0\"><a class=\"istylei0\" href=\"employe.jsp\"><span>Employe</span></a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"istylei0\"><a class=\"istylei0\" href=\"entreprise.jsp\"><span>Entreprise</span></a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"istylei0\"><a class=\"istylei0\" href=\"travail.jsp\"><span>Travail</span></a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"istylei0\"><a class=\"istylei0\" href=\"detailsEntreprise.jsp\">Details Entreprise</a></li>\n");
      out.write("                        <li class=\"istylei0\"><a class=\"istylei0\" href=\"salairesGlobaux.jsp\">Etat de Salaire</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("        <!--fin menu-->\n");
      out.write("        <div class = \"corps\">\n");
      out.write("            <div id=\"slideshow\">\n");
      out.write("                <img src=\"images/1.jpg\" width=\"1100\" height=\"300\">\n");
      out.write("                <img src=\"images/2.jpg\" width=\"1100\" height=\"300\">\n");
      out.write("                <img src=\"images/3.jpg\" width=\"1100\" height=\"300\">\n");
      out.write("                <img src=\"images/4.jpg\" width=\"1100\" height=\"300\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-7\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"header_01\"> Welcome </div>\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <img src=\"images/accueil.jpg\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-8\" id=\"message\"> \n");
      out.write("                        Bienvenue dans l'application GESTION EMPLOYE. Que vous soyez employé, dirigeant d'une entreprise, cette application est toujours indispensable\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"row\"></br>\n");
      out.write("                    <div class=\"header_01\">Article</div>\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <img src=\"images/photo_1.jpg\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                            <img src=\"images/photo_3.jpg\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                            <img src=\"images/photo_2.jpg\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-5\">\n");
      out.write("                <h3>Actualités</h3>\n");
      out.write("                <a href=\"employe.jsp\"><div class=\"header_02\">Employés</div></a>\n");
      out.write("                <div class=\"row\">\t\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <a href=\"#\"><img src=\"images/article1.jpg\"></a>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-7\"> Quelques coordonnées de l'employé sont requis pour l'inscrire dans le programme\n");
      out.write("                        et ainsi effectuer des travaux dans des entreprises\n");
      out.write("                                                                        <!--<p class=\"dateActualite\">22/05/15</p>//-->\n");
      out.write("                                                                        <a href=\"employe.jsp\"><p class=\"voirPlus\">[Voir plus]</p></a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <a href=\"entreprise.jsp\"><div class=\"header_02\">Entreprise</div></a>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <a href=\"#\"><img src=\"images/article2.jpg\"></a>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-7\">L'entreprise, ajouté par l'adminstrateur de l'application offre des différents travaux \n");
      out.write("                        qui sera ensuite executés par les employés\n");
      out.write("                                                                        <!--<p class=\"dateActualite\">05/04/15</p>//-->\n");
      out.write("                                                                        <a href=\"entreprise.jsp\"><p class=\"voirPlus\">[Voir plus]</p></a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <a href=\"travail.jsp\"><div class=\"header_02\">Travail</div></a>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <a href=\"#\"><img src=\"images/article3.jpg\"></a>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-7\">Après inscription, les employés peuvent, dans l'immediat commencer le travail qu'on lui a attribué dans le délai requis\n");
      out.write("                                                                        <!--<p class=\"dateActualite\">01/04/15</p>//-->\n");
      out.write("                                                                        <a href=\"travail.jsp\"><p class=\"voirPlus\">[Voir plus]</p></a>\n");
      out.write("                    </div>\n");
      out.write("                </div></br>\n");
      out.write("                <!--<a href=\"#\"><p class=\"afficherTout\">Afficher tout</p></a>//-->\n");
      out.write("            </div>\n");
      out.write("        </div> <!-- fin corps //-->\n");
      out.write("    </div>\n");
      out.write("    <div id=\"footer\">\n");
      out.write("        <div id=\"text_footer\">\n");
      out.write("            Copyright © 2015 by <a href=\"#\">WebNexus Compagny</a>\n");
      out.write("        </div> <!-- end of footer -->\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
