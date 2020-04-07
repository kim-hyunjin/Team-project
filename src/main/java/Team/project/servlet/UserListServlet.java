package Team.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.GenericServlet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import org.springframework.context.ApplicationContext;
import Team.project.domain.User;
import Team.project.service.UserService;

@WebServlet("/user/list")
public class UserListServlet extends GenericServlet{
  private static final long serialVersionUID = 1L;

  @Override
  public void service(ServletRequest req, ServletResponse res)
      throws ServletException, IOException {
    try {
      ServletContext servletContext = req.getServletContext();
      ApplicationContext iocContainer =
          (ApplicationContext) servletContext.getAttribute("iocContainer");

      UserService userService = iocContainer.getBean(UserService.class);

      res.setContentType("text/html;charset=UTF-8");
      PrintWriter out = res.getWriter();
      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("  <meta charset='UTF-8'>");
      out.println("  <title>유저 목록</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("  <h1>유저목록</h1>");
      List<User> users = userService.list();
      for (User user : users) {
        out.printf("%d, %s, %s, %s",
            user.getUserNo(),
            user.getEmail(),
            user.getName(),
            user.getIntroduce()
            );
      }

      out.println("</body>");
      out.println("</html>");
    } catch (Exception e) {
      throw new ServletException(e);
    }

  }

}
