package Team.project.web;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import Team.project.domain.User;
import Team.project.service.MailSendService;
import Team.project.service.UserService;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.name.Rename;

@Controller
@RequestMapping("/user")
public class UserController {

  @Autowired
  private MailSendService mailsender;

  @Autowired
  ServletContext servletContext;

  @Autowired
  UserService userService;

  @RequestMapping("form")
  public String form() {
    return "/WEB-INF/jsp/user/form.jsp";
  }

  @RequestMapping("signup")
  public String signup(User user, Model model, HttpServletRequest request) throws Exception {
    if (userService.join(user) > 0) {
      // 인증 메일 보내기 메서드
      mailsender.mailSendWithKey(user.getEmail(), user.getName(), user.getPassword(), request);
      return "redirect:../auth/form";
    } else {
      throw new Exception("회원을 추가할 수 없습니다.");
    }
  }

  @RequestMapping("add")
  public String add(User user, @RequestPart(value = "photo", required = false) MultipartFile photo)
      throws Exception {
    if (photo != null) {
      String dirPath = servletContext.getRealPath("/upload/user");
      String filename = UUID.randomUUID().toString();
      photo.transferTo(new File(dirPath + "/" + filename));
      Thumbnails.of(dirPath + "/" + filename).size(160, 160).outputFormat("jpg")
          .toFiles(Rename.PREFIX_DOT_THUMBNAIL);
      user.setProfilePhoto(filename);
    }
    System.out.println("user==============>" + user);
    if (userService.add(user) > 0) {
      return "redirect:../auth/login?email=" + user.getEmail() + "&password=" + user.getPassword();
    } else {
      throw new Exception("회원을 추가할 수 없습니다.");
    }
  }

  @RequestMapping("delete")
  public String delete(HttpSession session, int no) throws Exception {
    if (userService.delete(no) > 0) { // 삭제했다면,
      session.removeAttribute("loginUser");
      return "redirect:../auth/form";
    } else {
      throw new Exception("해당 번호의 회원이 없습니다.");
    }
  }

  @RequestMapping("detail")
  @ResponseBody
  public ResponseEntity<String> detail(int userNo, Model model) throws Exception {
    User user = userService.get(userNo);
    Gson gson = new Gson();
    HttpHeaders header = new HttpHeaders();
    header.add("Content-Type", "application/json;charset=utf-8");
    return new ResponseEntity<>(gson.toJson(user), header, HttpStatus.OK);
  }

  @RequestMapping("search")
  public String search(String keyword, Model model) throws Exception {
    model.addAttribute("users", userService.search(keyword));
    return "/WEB-INF/jsp/user/search.jsp";
  }

  @RequestMapping("update")
  public String update(HttpSession session, User user, MultipartFile photo) throws Exception {
    if (photo.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/user");
      String filename = UUID.randomUUID().toString();
      photo.transferTo(new File(dirPath + "/" + filename));
      Thumbnails.of(dirPath + "/" + filename).size(160, 160).outputFormat("jpg")
          .toFiles(Rename.PREFIX_DOT_THUMBNAIL);
      user.setProfilePhoto(filename);
    }

    if (userService.update(user) > 0) {
      session.removeAttribute("loginUser");
      session.setAttribute("loginUser", userService.get(user.getUserNo()));
      return "redirect:../clazz/list";
    } else {
      throw new Exception("유저 정보 변경에 실패했습니다.");
    }
  }



}
