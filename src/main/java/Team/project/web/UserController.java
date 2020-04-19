package Team.project.web;

import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import Team.project.domain.User;
import Team.project.service.UserService;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.name.Rename;

@Controller
public class UserController {
  @Autowired
  UserService userService;

  @RequestMapping("/user/form")
  public String form() {
    return "/user/form.jsp";
  }

  @RequestMapping("/user/add")
  public String add(HttpServletRequest req, User user, Part profilePhoto) throws Exception {
    if (profilePhoto.getSize() > 0) {
      String dirPath = req.getServletContext().getRealPath("/upload/user");
      String filename = UUID.randomUUID().toString();
      profilePhoto.write(dirPath + "/" + filename);
      Thumbnails.of(dirPath + "/" + filename).size(160, 160).outputFormat("jpg")
          .toFiles(Rename.PREFIX_DOT_THUMBNAIL);
      user.setProfilePhoto(filename);
    }
    if (userService.add(user) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("회원을 추가할 수 없습니다.");
    }
  }

  @RequestMapping("/user/delete")
  public String delete(int no) throws Exception {
    if (userService.delete(no) > 0) { // 삭제했다면,
      return "redirect:list";
    } else {
      throw new Exception("해당 번호의 회원이 없습니다.");
    }
  }

  @RequestMapping("/user/detail")
  public String detail(int no, Map<String, Object> model) throws Exception {
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
    model.put("user", user);
    model.put("loginMethod", login);
    return "/user/detail.jsp";
  }

  @RequestMapping("/user/list")
  public String list(Map<String, Object> model) throws Exception {
    model.put("users", userService.list());
    return "/user/list.jsp";
  }

  @RequestMapping("/user/search")
  public String search(String keyword, Map<String, Object> model) throws Exception {
    model.put("users", userService.search(keyword));
    return "/user/search.jsp";
  }

  @RequestMapping("/user/update")
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
