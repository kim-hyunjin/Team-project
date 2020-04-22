package Team.project.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import Team.project.domain.User;
import Team.project.service.UserService;

@Controller
@RequestMapping("/auth")
public class AuthController {

  @Autowired
  UserService userService;

  @GetMapping("form")
  public void form() {}

  @PostMapping("login")
  public String login( //
      String email, //
      String password, //
      String saveEmail, //
      HttpServletResponse response, //
      HttpSession session, //
      Model model) throws Exception {

    Cookie cookie = new Cookie("email", email);
    if (saveEmail != null) {
      cookie.setMaxAge(60 * 60 * 60 * 60);
    } else {
      cookie.setMaxAge(0);
    }
    response.addCookie(cookie);

    User user = userService.get(email, password);
    if (user != null) {
      session.setAttribute("loginUser", user);
      return "redirect:../../index.html";
    } else {
      session.invalidate();
      return "redirect:form.jsp";
    }
  }

  @GetMapping("logout")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:../../index.html";
  }
}
