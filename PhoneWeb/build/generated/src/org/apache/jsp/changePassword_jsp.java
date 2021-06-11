package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import entity.Customer;

public final class changePassword_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Change Password</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("        <style>\n");
      out.write("            .container {\n");
      out.write("                position: fixed;\n");
      out.write("                top: 20%;\n");
      out.write("                left: 4%;\n");
      out.write("                margin-top: 30px;\n");
      out.write("            }\n");
      out.write("            .logo {\n");
      out.write("                margin-top: 30px;\n");
      out.write("                margin-right: 50px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            Customer user = (Customer) session.getAttribute("user");
            Object mess = request.getAttribute("mess");
            if (mess == null) {
                mess = "";
            }
        
      out.write("\n");
      out.write("        <div class=\"logo\">\n");
      out.write("            <center><a href=\"/WebExample/ProductControllerMap\"><img src=\"/WebExample/images/logo.png\" alt=\"\"/> </a></center>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <h2 class=\"text-center\">Change Password</h2><br>\n");
      out.write("            <form class=\"form-horizontal\" method = \"post\" action=\"/WebExample/CustomerControllerMap\">\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label class=\"control-label col-sm-5\" for=\"user\">User Name</label>\n");
      out.write("                    <div class=\"col-sm-3\">\n");
      out.write("                        <input type=\"text\" class=\"form-control\" id=\"user\" name=\"user\" readonly value=\"");
      out.print(user.getUsername());
      out.write("\">\n");
      out.write("                    </div>\n");
      out.write("                    <span class=\"glyphicon glyphicon-exclamation-sign\"></span>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label class=\"control-label col-sm-5\" for=\"oldPassword\">Old Password</label>\n");
      out.write("                    <div class=\"col-sm-3\">\n");
      out.write("                        <input type=\"password\" class=\"form-control\" id=\"oldPassword\" name=\"oldPassword\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <span class=\"glyphicon glyphicon-exclamation-sign\"></span>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label class=\"control-label col-sm-5\" for=\"newPassword\">New Password</label>\n");
      out.write("                    <div class=\"col-sm-3\">\n");
      out.write("                        <input type=\"password\" class=\"form-control\" id=\"newPassword\" name=\"newPassword\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <span class=\"glyphicon glyphicon-exclamation-sign\"></span>\n");
      out.write("                </div>\n");
      out.write("                    \n");
      out.write("                <div class=\"form-group\">        \n");
      out.write("                    <div class=\"col-sm-offset-5 col-sm-4\">\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-primary active \">Change Password</button>\n");
      out.write("                        <button type=\"reset\" class=\"btn btn-primary active \">Reset</button>\n");
      out.write("                        <input type=\"hidden\" name=\"service\" value=\"changePassword\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">        \n");
      out.write("                    <label class=\"col-sm-offset-5 col-sm-4 text-danger\" for=\"mes\">");
      out.print( mess.toString());
      out.write("</label>\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</body>\n");
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
}
