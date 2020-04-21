package Team.project.web;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import Team.project.domain.User;
import Team.project.service.UserService;

@Controller
public class AuthController {

  @Autowired
  UserService userService;

  @RequestMapping("/auth/form")
  public String form(HttpServletRequest req, Map<String, Object> model) {
    return "/WEB-INF/jsp/auth/form.jsp";
  }

  @RequestMapping("/auth/login")
  public String login(HttpServletRequest req, String email, String password) throws Exception {
    User user = userService.get(email, password);
    if (user != null) {
      req.getSession().setAttribute("loginUser", user);
      return "redirect:../clazz/list";
    } else {
      req.getSession().invalidate();
      return "/auth/form.jsp";
    }

  }

  @RequestMapping("/auth/logout")
  public String logout(HttpServletRequest req) {
    req.getSession().invalidate();
    return "redirect:../../index.html";
  }
}
