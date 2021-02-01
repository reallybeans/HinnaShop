package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class payPal_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Cart Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       \n");
      out.write("\n");
      out.write("        <fieldset>\n");
      out.write("            <legend>Thanh toán qua cổng PayPal</legend>\n");
      out.write("            <form action=\"https://www.sandbox.paypal.com/cgi-bin/webscr\" method=\"post\">\n");
      out.write("\n");
      out.write("                <!-- Nhập địa chỉ email người nhận tiền (người bán) -->\n");
      out.write("                <input type=\"hidden\" name=\"business\" value=\"adminnhan@gmail.com\">\n");
      out.write("\n");
      out.write("                <!-- tham số cmd có giá trị _xclick chỉ rõ cho paypal biết là người dùng nhất nút thanh toán -->\n");
      out.write("                <input type=\"hidden\" name=\"cmd\" value=\"_xclick\">\n");
      out.write("\n");
      out.write("                <!-- Thông tin mua hàng. -->\n");
      out.write("                <input type=\"hidden\" name=\"item_name\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.LOGIN_USER.getFullname()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                <!--Trị giá của giỏ hàng, vì paypal không hỗ trợ tiền việt nên phải đổi ra tiền $-->\n");
      out.write("                <input type=\"hidden\" name=\"amount\" placeholder=\"Nhập số tiền vào\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageScope.totalCart}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                <!--Loại tiền-->\n");
      out.write("                <input type=\"hidden\" name=\"currency_code\" value=\"USD\">\n");
      out.write("                <!--Đường link mình cung cấp cho Paypal biết để sau khi xử lí thành công nó sẽ chuyển về theo đường link này-->\n");
      out.write("                <input type=\"hidden\" name=\"return\" value=\"http://localhost:8084/J3.L.P0013.Hana-Shop-SE140331/PayPalController\">\n");
      out.write("                <!--Đường link mình cung cấp cho Paypal biết để nếu  xử lí KHÔNG thành công nó sẽ chuyển về theo đường link này-->\n");
      out.write("                <input type=\"hidden\" name=\"cancel_return\" value=\"http://localhost:8084/J3.L.P0013.Hana-Shop-SE140331/userCart.jsp\">\n");
      out.write("                <!-- Nút bấm. -->\n");
      out.write("                <input type=\"submit\" name=\"submit\" value=\"Thanh toán quay Paypal\">\n");
      out.write("            </form>\n");
      out.write("        </fieldset>       \n");
      out.write("\n");
      out.write("  \n");
      out.write("\n");
      out.write("<!-- Recommand -->\n");
      out.write(" \n");
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
