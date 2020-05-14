package Team.project.web;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import Team.project.domain.User;
import Team.project.service.UserService;

@Controller
public class AuthController {

  @Autowired
  UserService userService;

  @RequestMapping("/auth/form")
  public String form(HttpSession session) {
    User user = (User) session.getAttribute("loginUser");
    if (user != null) {
      return "redirect:../clazz/list";
    }
    return "/WEB-INF/jsp/auth/form.jsp";
  }

  @RequestMapping("/auth/login")
  public String login(HttpSession session, String email, String password, Model model) throws Exception {
    session.removeAttribute("loginUser");
    User user = userService.get(email, password);
    if (user != null) {
      // 로그인 시 유저 정보가 세션에 "loginUser"로 저장됨.
      session.setAttribute("loginUser", user);
      return "redirect:../clazz/list";
    } else {
      session.invalidate();
      model.addAttribute("loginError", "로그인에 실패했습니다!");
      return "/WEB-INF/jsp/auth/form.jsp";
    }

  }

  @RequestMapping("/auth/logout")
  public String logout(HttpServletRequest req) {
    req.getSession().invalidate();
    return "/WEB-INF/jsp/auth/form.jsp";
  }

  @RequestMapping("/auth/kakao")
  public String kakao(String email, String id, String nickname, String image) throws Exception {
    System.out.println("image=========>"+image);
    if (userService.get(email) != null) {
      return "redirect:login?email=" + email + "&password=" + id;
    } else {
      return "redirect:../user/add?email=" + email + "&password=" + id + "&name="
          + URLEncoder.encode(nickname, StandardCharsets.UTF_8) + "&profilePhoto=" + image
          + "&loginMethod=1";
    }
  }

}
