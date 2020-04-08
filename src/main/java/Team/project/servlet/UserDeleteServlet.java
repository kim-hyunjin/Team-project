package Team.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import Team.project.service.UserService;

@WebServlet("/user/delete")
public class UserDeleteServlet extends HttpServlet{
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    try {
      resp.setContentType("text/html;charset=UTF-8");
      PrintWriter out = resp.getWriter();

      ServletContext servletContext = getServletContext();
      ApplicationContext iocContainer =
          (ApplicationContext) servletContext.getAttribute("iocContainer");
      UserService userService = iocContainer.getBean(UserService.class);

      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<meta charset='UTF-8'>");
      out.println("<meta http-equiv='refresh' content='2;url=list'>");
      out.println("<title>회원 삭제</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>회원 삭제 결과</h1>");

      int no = Integer.parseInt(req.getParameter("no"));
      if (userService.delete(no) > 0) { // 삭제했다면,
        out.println("<p>회원을 삭제했습니다.</p>");

      } else {
        out.println("<p>해당 번호의 회원이 없습니다.</p>");
      }

      out.println("</body>");
      out.println("</html>");
    } catch (Exception e) {
      throw new ServletException(e);
    }

  }
}
