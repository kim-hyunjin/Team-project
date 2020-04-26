package Team.project.web;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
  public String form(HttpSession session, Map<String, Object> model) {
    User user = (User) session.getAttribute("loginUser");
    if (user != null) {
      return "redirect:../clazz/list";
    }
    return "/WEB-INF/jsp/auth/form.jsp";
  }

  @RequestMapping("/auth/login")
  public String login(HttpSession session, String email, String password) throws Exception {
    session.removeAttribute("loginUser");
    User user = userService.get(email, password);
    if (user != null) {
      session.setAttribute("loginUser", user);
      return "redirect:../clazz/list";
    } else {
      session.invalidate();
      return "redirect:form.jsp";
    }

  }

  @RequestMapping("/auth/logout")
  public String logout(HttpServletRequest req) {
    req.getSession().invalidate();
    return "redirect:form.jsp";
  }
}
