package Team.project.servlet;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import Team.project.domain.User;
import Team.project.service.UserService;

@WebServlet("/auth/login")
public class LoginServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String email = "";
    try {
      Cookie[] cookies = request.getCookies();
      if(cookies != null) {
        for(Cookie cookie : cookies) {
          if(cookie.getName().equals("email")) {
            email = cookie.getValue();
            break;
          }
        }
      }
      request.setAttribute("email", email);
      response.setContentType("text/html;charset=UTF-8");
      request.getRequestDispatcher("/user/login.jsp").include(request, response);

    } catch (Exception e) {
      request.setAttribute("error", e);
      request.setAttribute("url", "list");
      request.getRequestDispatcher("/error").forward(request, response);
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    try {
      response.setContentType("text/html;charset=UTF-8");
      ServletContext servletContext = getServletContext();
      ApplicationContext iocContainer =
          (ApplicationContext) servletContext.getAttribute("iocContainer");
      UserService userService = iocContainer.getBean(UserService.class);

      String email = request.getParameter("email");
      String password = request.getParameter("password");
      String saveEmail = request.getParameter("saveEamil");
      Cookie cookie = new Cookie("email", email);
      if (saveEmail != null) {
        cookie.setMaxAge(60*60*24*30);
      } else {
        cookie.setMaxAge(0);
      }
      response.addCookie(cookie);

      User user = userService.get(email, password);
      if (user != null) {
        request.getSession().setAttribute("loginUser", user);
        response.sendRedirect("../user/list");
      } else {
        response.sendRedirect("../auth/login");
      }

    } catch (Exception e) {
      request.setAttribute("error", e);
      request.setAttribute("url", "login");
      request.getRequestDispatcher("/error").forward(request, response);
    }
  }
}
