package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import entity.Galery;
import model.DBConnection;
import model.DAOGalery;
import entity.Game;
import java.util.ArrayList;

public final class menu_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_set_var_value_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_set_var_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_set_var_value_nobody.release();
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      if (_jspx_meth_c_set_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Menu Page</title>\n");
      out.write("        <!--Css-->\n");
      out.write("        <link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/js/bootstrap.min.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/stylehome.css\">\n");
      out.write("        <link href=\"css/font-awesome.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/css/font-awesome.min.css\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"js/Jquery.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/slick.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
  ArrayList<Game> listGame = (ArrayList<Game>) request.getAttribute("listGame");
            ArrayList<Game> listHotGame = (ArrayList<Game>) request.getAttribute("listHotGame");
            ArrayList<Game> listNewGame = (ArrayList<Game>) request.getAttribute("listNewGame");
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            ");
 if (listGame.isEmpty()) { 
      out.write("\n");
      out.write("            <p> No game found </p>\n");
      out.write("            <h2> Games </h2>\n");
      out.write("            ");
 } else {  
      out.write("\n");
      out.write("            <!--Popular Game-->\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <!--Slide starts here-->\n");
      out.write("                <h1 class=\"neon\" data-text=\"HOT GAMES\">HOT GAMES</h1>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-12 nopadding\">\n");
      out.write("                        <!--Bắt đầu slider-->\n");
      out.write("                        <div id=\"carousel-example-generic\" class=\"carousel slide\" data-ride=\"carousel\">\n");
      out.write("                            <!-- Indicators -->    \n");
      out.write("                            <ol class=\"carousel-indicators\">\n");
      out.write("                                <li data-target=\"#carousel-example-generic\" data-slide-to=\"0\" class=\"active\"></li>\n");
      out.write("                                    ");
 for (int i = 1; i < listHotGame.size(); i++) {
      out.write("\n");
      out.write("                                <li data-target=\"#carousel-example-generic\" data-slide-to=\"");
      out.print(i);
      out.write("\"></li> \n");
      out.write("                                    ");

                                        }
                                    
      out.write("\n");
      out.write("                            </ol>\n");
      out.write("\n");
      out.write("                            <!-- Wrapper for slides -->\n");
      out.write("                            <div class=\"carousel-inner\" role=\"listbox\">\n");
      out.write("                                <div class=\"item active\">\n");
      out.write("                                    ");
  DBConnection dbCon = new DBConnection();
                                        DAOGalery daoGalery = new DAOGalery(dbCon);
                                        ArrayList<Galery> gList0 = daoGalery.getGaleryByTypeId(listHotGame.get(0).getGid(), "img-bg");
      out.write("\n");
      out.write("                                    <a href=\"#\"><img style=\"width: 1500px; height: 600px; object-fit:cover\" src=\"");
      out.print( gList0.get(0).getLink().trim());
      out.write("\" alt=\"");
      out.print( gList0.get(0).getLink().trim());
      out.write("\"></a>\n");
      out.write("                                    <br>\n");
      out.write("                                </div>\n");
      out.write("                                ");
   for (int i = 1; i < listHotGame.size(); i++) { 
      out.write(" \n");
      out.write("                                ");
  ArrayList<Galery> gList = daoGalery.getGaleryByTypeId(listHotGame.get(i).getGid(), "img-bg");
                                
      out.write("\n");
      out.write("\n");
      out.write("                                <div class=\"item\">\n");
      out.write("                                    <a href=\"#\"><img style=\"width: 1500px; height: 600px; object-fit:cover\" src=\"");
      out.print( gList.get(0).getLink().trim());
      out.write("\" alt=\"");
      out.print( gList.get(0).getLink().trim());
      out.write("\"></a>\n");
      out.write("                                    <br>\n");
      out.write("                                </div>\n");
      out.write("                                ");
 } 
      out.write("\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <!-- Controls -->\n");
      out.write("                            <div class=\"control\">\n");
      out.write("                                <a class=\"left carousel-control\" href=\"#carousel-example-generic\" role=\"button\" data-slide=\"prev\">\n");
      out.write("                                    <span class=\"glyphicon glyphicon-chevron-left\" aria-hidden=\"true\"></span>\n");
      out.write("                                    <span class=\"sr-only\">Previous</span>\n");
      out.write("                                </a>\n");
      out.write("                                <a class=\"right carousel-control\" href=\"#carousel-example-generic\" role=\"button\" data-slide=\"next\">\n");
      out.write("                                    <span class=\"glyphicon glyphicon-chevron-right\" aria-hidden=\"true\"></span>\n");
      out.write("                                    <span class=\"sr-only\">Next</span>\n");
      out.write("                                </a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <!--Slick New game-->\n");
      out.write("                <div class=\"roll1\">\n");
      out.write("                <h1 class=\"neon1\" data-text=\"BUY ZONE\">NEW GAME</h1>\n");
      out.write("                <div class=\"row slick\">\n");
      out.write("                    ");

                    for (Game game : listNewGame) { 
      out.write("\n");
      out.write("                    ");
  ArrayList<Galery> gList3 = daoGalery.getGaleryByTypeId(game.getGid(), "img-po");
                    
      out.write("\n");
      out.write("                    <div class=\"col-md-12\">\n");
      out.write("                        <!--1-->\n");
      out.write("                        <div class=\"slick-item\">\n");
      out.write("\n");
      out.write("                            <div class=\"box\">\n");
      out.write("                                <a href=\"GameControllerMap?service=getGame&gameID=");
      out.print(game.getGid());
      out.write("\">\n");
      out.write("                                    <img src=\"");
      out.print( gList3.get(0).getLink().trim());
      out.write("\" alt=\"\"></a>\n");
      out.write("                                <p>");
      out.print( game.getTitle());
      out.write("</p>\n");
      out.write("                                <div class=\"overlay\">\n");
      out.write("                                    <div class=\"content\">\n");
      out.write("                                        <a href=\"\">Read More</a>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>   \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <div class=\"arrow-prev2\">\n");
      out.write("                    <i class=\"fas fa-arrow-circle-left\"></i>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"arrow-next2\">\n");
      out.write("                    <i class=\"fas fa-arrow-circle-right\"></i>\n");
      out.write("                </div>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <!--Slick all game-->\n");
      out.write("                <div class=\"roll2\">\n");
      out.write("                <h1 class=\"neon1\" data-text=\"BUY ZONE\">ALL GAME</h1>\n");
      out.write("                <div class=\"row slick2\">\n");
      out.write("                    ");

                        for (Game game : listGame) { 
      out.write("\n");
      out.write("                    ");
  ArrayList<Galery> gList2 = daoGalery.getGaleryByTypeId(game.getGid(), "img-po");
                    
      out.write("\n");
      out.write("                    <div class=\"col-md-12\">\n");
      out.write("                        <!--1-->\n");
      out.write("                        <div class=\"slick-item\">\n");
      out.write("\n");
      out.write("                            <div class=\"box\">\n");
      out.write("                                <a href=\"GameControllerMap?service=getGame&gameID=");
      out.print(game.getGid());
      out.write("\">\n");
      out.write("                                    <img src=\"");
      out.print( gList2.get(0).getLink().trim());
      out.write("\" alt=\"\"></a>\n");
      out.write("                                <p>");
      out.print( game.getTitle());
      out.write("</p>\n");
      out.write("                                <div class=\"overlay\">\n");
      out.write("                                    <div class=\"content\">\n");
      out.write("                                        <a href=\"\">Read More</a>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>   \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <div class=\"arrow-prev\">\n");
      out.write("                    <i class=\"fas fa-arrow-circle-left\"></i>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"arrow-next\">\n");
      out.write("                    <i class=\"fas fa-arrow-circle-right\"></i>\n");
      out.write("                </div>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("            </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <!--VIDEOs-->\n");
      out.write("                <!--Welcome content starts here-->\n");
      out.write("                <h1 class=\"neon2\" data-text=\"POPULAR VIDEOS\">TRAILERS</h1>\n");
      out.write("                <div class=\"row youtube\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-md-12 nopadding\">\n");
      out.write("                            <div id=\"carousel-example-generic1\" class=\"carousel slide\" data-ride=\"carousel\">\n");
      out.write("                                <div class=\"carousel-inner\" role=\"listbox\">\n");
      out.write("                                    <div class=\"item active\">\n");
      out.write("                                        ");

                                            DBConnection dbCon = new DBConnection();
                                            DAOGalery daoGalery = new DAOGalery(dbCon);
                                            ArrayList<Galery> gList4 = daoGalery.getVideo();
      out.write("\n");
      out.write("                                        <iframe width=\"1120\" height=\"630\" src=\"");
      out.print( gList4.get(0).getLink().trim());
      out.write("\" title=\"YouTube video player\"\n");
      out.write("                                                frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen>   \n");
      out.write("                                        </iframe>\n");
      out.write("                                        <br>\n");
      out.write("                                    </div>\n");
      out.write("                                    ");
for (int i = 1; i < gList4.size(); i++) {
      out.write("\n");
      out.write("                                    <div class=\"item\">\n");
      out.write("\n");
      out.write("                                        <iframe width=\"1120\" height=\"630\" src=\"");
      out.print( gList4.get(i).getLink().trim());
      out.write("\"\n");
      out.write("                                                title=\"YouTube video player\" frameborder=\"0\"\n");
      out.write("                                                allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\"\n");
      out.write("                                                allowfullscreen></iframe>\n");
      out.write("                                    </div>\n");
      out.write("                                    ");
    }
      out.write("\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"control\">\n");
      out.write("                                    <a class=\"right carousel-control\" href=\"#carousel-example-generic1\" role=\"button\" data-slide=\"next\">\n");
      out.write("                                        <span class=\"glyphicon glyphicon-chevron-right\" aria-hidden=\"true\"></span>\n");
      out.write("                                        <span class=\"sr-only\">Next</span>\n");
      out.write("                                    </a>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>    \n");
      out.write("        <!--Jquery, JS-->\n");
      out.write("        <script src=\"https://kit.fontawesome.com/9650a62e47.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"js/style.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"//code.jquery.com/jquery-1.11.0.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"//code.jquery.com/jquery-migrate-1.2.1.min.js\"></script>\n");
      out.write("        <script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/js/slick.min.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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

  private boolean _jspx_meth_c_set_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_set_0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _jspx_tagPool_c_set_var_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_set_0.setPageContext(_jspx_page_context);
    _jspx_th_c_set_0.setParent(null);
    _jspx_th_c_set_0.setVar("contextPath");
    _jspx_th_c_set_0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_c_set_0 = _jspx_th_c_set_0.doStartTag();
    if (_jspx_th_c_set_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_0);
      return true;
    }
    _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_0);
    return false;
  }
}
