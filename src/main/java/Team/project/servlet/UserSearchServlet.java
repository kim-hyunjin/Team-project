package Team.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import Team.project.domain.User;
import Team.project.service.UserService;

@WebServlet("/user/search")
public class UserSearchServlet extends HttpServlet{
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    try {
      ServletContext servletContext = req.getServletContext();
      ApplicationContext iocContainer =
          (ApplicationContext) servletContext.getAttribute("iocContainer");

      UserService userService = iocContainer.getBean(UserService.class);

      resp.setContentType("text/html;charset=UTF-8");
      PrintWriter out = resp.getWriter();
      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("  <meta charset='UTF-8'>");
      out.println("  <title>회원 검색</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("  <h1>회원 검색 결과</h1>");
      String keyword = req.getParameter("keyword");
      List<User> users = userService.search(keyword);
      for (User user : users) {
        out.printf("%d, %s, <a href='detail?no=%d'>%s</a> <br>",
            user.getUserNo(),
            user.getEmail(),
            user.getUserNo(),
            user.getName()
            );
      }
      out.println("</body>");
      out.println("</html>");
    } catch (Exception e) {
      throw new ServletException(e);
    }
  }
}
