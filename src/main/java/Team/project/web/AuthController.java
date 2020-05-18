package Team.project.web;

import java.io.File;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import Team.project.domain.User;
import Team.project.service.MailSendService;
import Team.project.service.UserService;

@Controller
public class AuthController {
  
  @Autowired
  ServletContext servletContext;

  @Autowired
  UserService userService;
  
  @Autowired
  private MailSendService mailsender;

  @RequestMapping("/auth/form")
  public String form(HttpSession session) {
    User user = (User) session.getAttribute("loginUser");
    if (user != null) {
      return "redirect:../clazz/list";
    }
    return "/WEB-INF/jsp/auth/form.jsp";
  }
  
  @RequestMapping("/auth/join")
  public String join(User user, MultipartFile photo, HttpServletRequest request,
      Model model) throws Exception {
    if (photo.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/user");
      String filename = UUID.randomUUID().toString();
      photo.transferTo(new File(dirPath + "/" + filename));
      user.setProfilePhoto(filename);
    }

    if (userService.join(user) > 0) {
      // 인증 메일 보내기 메서드
      mailsender.mailSendWithKey(user.getEmail(), user.getName(), request);
      return "redirect:../../index.html";
    } else {
      throw new Exception("회원을 추가할 수 없습니다.");
    }
  }
  
  @GetMapping("regSuccess")
  public void regSuccess() {}
  
  @GetMapping(value = "keyalter")
  public String keyalterConfirm(@RequestParam("email") String email,
      @RequestParam("key") String key) {

    mailsender.alterUserKey(email, key); // mailsender의 경우 @Autowired

    return "redirect:regSuccess";
  }

  
  @RequestMapping("/auth/login")
  public String login(HttpSession session, String email, String password, Model model)
      throws Exception {
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

  @RequestMapping("/auth/social")
  public String kakao(String email, String id, String nickname, String image, int loginMethod)
      throws Exception {
    System.out.println("image=========>" + image);
    if (userService.get(email) != null) {
      return "redirect:login?email=" + email + "&password=" + id;
    } else {
      return "redirect:../user/add?email=" + email + "&password=" + id + "&name="
          + URLEncoder.encode(nickname, StandardCharsets.UTF_8) + "&profilePhoto=" + image
          + "&loginMethod=" + loginMethod;
    }
  }
}

