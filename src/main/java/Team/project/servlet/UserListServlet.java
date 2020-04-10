package Team.project.servlet;

import java.io.IOException;
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

@WebServlet("/user/list")
public class UserListServlet extends HttpServlet{
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    try {
      ServletContext servletContext = req.getServletContext();
      ApplicationContext iocContainer =
          (ApplicationContext) servletContext.getAttribute("iocContainer");
      UserService userService = iocContainer.getBean(UserService.class);
      List<User> users = userService.list();
      req.setAttribute("users", users);
      resp.setContentType("text/html;charset=UTF-8");
      req.getRequestDispatcher("/user/list.jsp").include(req, resp);

    } catch (Exception e) {
      req.setAttribute("error", e);
      req.setAttribute("url", "list");
      req.getRequestDispatcher("/error").forward(req, resp);
    }

  }

}
