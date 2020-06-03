package Team.project.web;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import Team.project.domain.User;
import Team.project.service.MailSendService;
import Team.project.service.UserService;

@Controller
@RequestMapping("/auth")
public class AuthController {
  @Autowired
  private MailSendService mailsender;

  @Autowired
  ServletContext servletContext;

  @Autowired
  UserService userService;


  @RequestMapping("form")
  public String form(HttpSession session) {
    User user = (User) session.getAttribute("loginUser");
    if (user != null) {
      return "redirect:../clazz/list";
    }
    return "/WEB-INF/jsp/auth/form.jsp";
  }

  @RequestMapping("login")
  public String login(HttpSession session, String email, String password, Model model)
      throws Exception {
    System.out.println("login()=============>" + email + password);
    session.removeAttribute("loginUser");
    User user = userService.get(email, password);
    System.out.println("User============>" + user);
    if (user != null) {
      if (user.getAlterKey().equals("Y")) {
        // 로그인 시 유저 정보가 세션에 "loginUser"로 저장됨.
        session.setAttribute("loginUser", user);
        return "redirect:../clazz/list";
      } else {
        model.addAttribute("loginError", 1); // 이메일 인증을 안 한 경우
        return "/WEB-INF/jsp/auth/form.jsp";
      }
    } else {
      session.invalidate();
      model.addAttribute("loginError", 2); // 이메일이 유효하지 않은 경우
      return "/WEB-INF/jsp/auth/form.jsp";
    }
  }

  @RequestMapping("logout")
  public String logout(HttpServletRequest req) {
    req.getSession().invalidate();
    return "/WEB-INF/jsp/auth/form.jsp";
  }

  @RequestMapping("social")
  public String kakao(String email, String id, String nickname, int loginMethod) throws Exception {
    if (userService.get(email) != null) {
      return "redirect:login?email=" + email + "&password=" + id;
    } else {
      return "redirect:../user/add?email=" + email + "&password=" + id + "&name="
          + URLEncoder.encode(nickname, StandardCharsets.UTF_8) + "&loginMethod=" + loginMethod
          + "&alterKey=Y";
    }
  }

  @GetMapping(value = "keyalter")
  public String keyalterConfirm(@RequestParam("email") String email, String password,
      @RequestParam("key") String key) throws Exception {

    mailsender.alterUserKey(email, key); // mailsender의 경우 @Autowired
    User user = userService.get(email);
    String userEmail = user.getEmail();
    return "redirect:login?email=" + userEmail + "&password=" + password;
  }

  @GetMapping("findPassword")
  public void findPassword(String email, HttpServletResponse response) throws Exception {
    if (userService.get(email) != null) {
      mailsender.findPassword(email);
      response.setStatus(200);
    } else {
      response.setStatus(400);
    }
  }
}

