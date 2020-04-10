package Team.project.servlet;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import Team.project.domain.User;
import Team.project.service.UserService;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
@WebServlet("/user/detail")
public class UserDetailServlet extends HttpServlet{
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    req.setCharacterEncoding("utf-8");
    int no = Integer.parseInt(req.getParameter("no"));
    try {
      resp.setContentType("text/html;charset=UTF-8");

      ServletContext servletContext = getServletContext();
      ApplicationContext iocContainer =
          (ApplicationContext) servletContext.getAttribute("iocContainer");
      UserService userService = iocContainer.getBean(UserService.class);
      User user = userService.get(no);
      req.setAttribute("user", user);
      req.getRequestDispatcher("/user/detail.jsp").include(req, resp);

    } catch (Exception e) {
      req.setAttribute("error", e);
      req.setAttribute("url", "user/detail?no="+no);
      req.getRequestDispatcher("/error").forward(req, resp);
    }
  }
}
