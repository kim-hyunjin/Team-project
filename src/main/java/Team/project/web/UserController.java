package Team.project.web;

import java.io.File;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import Team.project.domain.User;
import Team.project.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  UserService userService;

  @GetMapping("form")
  public void form() {}

  @PostMapping("add")
  public String add( //
      User user, //
      MultipartFile photoFile) throws Exception {

    if (photoFile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/WEB-INF/upload/user");
      String filename = UUID.randomUUID().toString();
      photoFile.transferTo(new File(dirPath + "/" + filename));
      user.setProfilePhoto(filename);
    }

    if (userService.add(user) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("사용자를 추가할 수 없습니다.");
    }
  }

  @GetMapping("delete")
  public String delete(int no) throws Exception {
    if (userService.delete(no) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("삭제할 사용자 번호가 유효하지 않습니다.");
    }
  }

  @GetMapping("detail")
  public void detail(int no, Model model) throws Exception {
    model.addAttribute("user", userService.get(no));
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("list", userService.list());
  }

  @GetMapping("search")
  public void search(String keyword, Model model) throws Exception {
    model.addAttribute("list", userService.search(keyword));
  }

  @PostMapping("update")
  public String update( //
      User user, //
      MultipartFile photoFile) throws Exception {

    if (photoFile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/WEB-INF/upload/user"); // /src/main/webapp/WEB-INF/upload/user
      String filename = UUID.randomUUID().toString();
      photoFile.transferTo(new File(dirPath + "/" + filename));
      user.setProfilePhoto(filename);
    }

    if (userService.update(user) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 사용자 번호가 유효하지 않습니다.");

    }

  }

}
