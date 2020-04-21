package Team.project.web;

import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import Team.project.domain.User;
import Team.project.service.UserService;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.name.Rename;

@Controller
@RequestMapping("/user")
public class UserController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  UserService userService;

  @RequestMapping("form")
  public String form() {
    return "/WEB-INF/jsp/user/form.jsp";
  }

  @RequestMapping("add")
  public String add(HttpServletRequest req, User user, Part profilePhoto) throws Exception {
    if (profilePhoto.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/user");
      String filename = UUID.randomUUID().toString();
      profilePhoto.write(dirPath + "/" + filename);
      Thumbnails.of(dirPath + "/" + filename).size(160, 160).outputFormat("jpg")
          .toFiles(Rename.PREFIX_DOT_THUMBNAIL);
      user.setProfilePhoto(filename);
    }
    if (userService.add(user) > 0) {
      return "redirect:../clazz/list";
    } else {
      throw new Exception("회원을 추가할 수 없습니다.");
    }
  }

  @RequestMapping("delete")
  public String delete(int no) throws Exception {
    if (userService.delete(no) > 0) { // 삭제했다면,
      return "redirect:list";
    } else {
      throw new Exception("해당 번호의 회원이 없습니다.");
    }
  }

  @RequestMapping("detail")
  public String detail(int no, Model model) throws Exception {
    User user = userService.get(no);
    String login = "";
    switch (user.getLoginMethod()) {
      case 0:
        login = "이메일";
        break;
      case 1:
        login = "카카오";
        break;
      case 2:
        login = "구글";
        break;
      default:
        login = "이메일";
    }
    model.addAttribute("user", user);
    model.addAttribute("loginMethod", login);
    return "/WEB-INF/jsp/user/detail.jsp";
  }

  @RequestMapping("list")
  public String list(Model model) throws Exception {
    model.addAttribute("users", userService.list());
    return "/WEB-INF/jsp/user/list.jsp";
  }

  @RequestMapping("search")
  public String search(String keyword, Model model) throws Exception {
    model.addAttribute("users", userService.search(keyword));
    return "/WEB-INF/jsp/user/search.jsp";
  }

  @RequestMapping("update")
  public String update(HttpServletRequest request, User user, Part profilePhoto) throws Exception {
    if (profilePhoto.getSize() > 0) {
      String dirPath = request.getServletContext().getRealPath("/upload/user");
      String filename = UUID.randomUUID().toString();
      profilePhoto.write(dirPath + "/" + filename);
      Thumbnails.of(dirPath + "/" + filename).size(160, 160).outputFormat("jpg")
          .toFiles(Rename.PREFIX_DOT_THUMBNAIL);
      user.setProfilePhoto(filename);
    }

    if (userService.update(user) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 회원 번호가 유효하지 않습니다.");
    }
  }

}
