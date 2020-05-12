package Team.project.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import Team.project.domain.ClazzMember;
import Team.project.domain.User;
import Team.project.service.ClazzMemberService;
import Team.project.service.UserService;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.name.Rename;

@Controller
@RequestMapping()
public class UserController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  UserService userService;
  @Autowired
  ClazzMemberService clazzMemberService;

  @RequestMapping("/user/form")
  public String form() {
    return "/WEB-INF/jsp/user/form.jsp";
  }


  
  @RequestMapping("/user/add")
  public String add(User user, MultipartFile photo) throws Exception {
    if (photo.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/user");
      String filename = UUID.randomUUID().toString();
      photo.transferTo(new File(dirPath + "/" + filename));
      Thumbnails.of(dirPath + "/" + filename).size(160, 160).outputFormat("jpg")
          .toFiles(Rename.PREFIX_DOT_THUMBNAIL);
      user.setProfilePhoto(filename);
    }
    if (userService.add(user) > 0) {
      return "redirect:../auth/form";
    } else {
      throw new Exception("회원을 추가할 수 없습니다.");
    }
  }

  @RequestMapping("/room/user/form")
  public String studentForm(Model model, int class_no, int role) {
    model.addAttribute("class_no", class_no);
    model.addAttribute("role", role);
    return "/WEB-INF/jsp/room/user/form.jsp";
  }
  
  @RequestMapping("/room/user/add")
  public String add(String email, int class_no, int role) throws Exception {
    User result = userService.get(email);
      if(result != null) {
        ClazzMember clazzMember = new ClazzMember();
        clazzMember.setUserNo(result.getUserNo());
        clazzMember.setClazzNo(class_no);
        clazzMember.setRole(role);
        clazzMemberService.add(clazzMember);
        return "redirect:list?room_no="+class_no;
      } else {
        throw new Exception("회원을 추가할 수 없습니다.");
      }
  }
  
  
  
  @RequestMapping("/user/delete")
  public String delete(HttpSession session, int no) throws Exception {
    if (userService.delete(no) > 0) { // 삭제했다면,
      session.removeAttribute("loginUser");
      return "redirect:../auth/form";
    } else {
      throw new Exception("해당 번호의 회원이 없습니다.");
    }
  }
  
  @RequestMapping("room/user/delete")
  public String delete(int member_no, int room_no, Model model) throws Exception {
    if (clazzMemberService.delete(member_no) > 0) { // 삭제했다면,
      if (member_no != 0) {
        return "redirect:list?room_no="+room_no;
      } else {
        return "redirect:list";
      }
    } else {
      throw new Exception("해당 번호의 회원이 없습니다.");
    }
  }
  

  @RequestMapping("/user/detail")
  public String detail(int userNo, Model model) throws Exception {
    User user = userService.get(userNo);
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
  
  @RequestMapping("/room/user/detail")
  public String roomDetail(int no, int room_no, Model model,int member_no) throws Exception {
    User user = userService.get(no);
   
    model.addAttribute("user", user);
    model.addAttribute("room_no", room_no);
    model.addAttribute("no", no);
    model.addAttribute("member_no", member_no);
    return "/WEB-INF/jsp/room/user/detail.jsp";
  }

  @RequestMapping("/room/user/list")
  public String list(int room_no, Model model) throws Exception {
    List<ClazzMember> memberList = clazzMemberService.findAllByClassNo(room_no);
    List<ClazzMember> teachers = new ArrayList<>();
    List<ClazzMember> students = new ArrayList<>();
    for (ClazzMember member : memberList) {
      if (member.getRole() == 0) {
        teachers.add(member);
      } else {
        students.add(member);
      }
    }
    model.addAttribute("teachers", teachers);
    model.addAttribute("students", students);
    model.addAttribute("room_no", room_no);
    return "/WEB-INF/jsp/user/list.jsp";
  }

  @RequestMapping("search")
  public String search(String keyword, Model model) throws Exception {
    model.addAttribute("users", userService.search(keyword));
    return "/WEB-INF/jsp/user/search.jsp";
  }

  @RequestMapping("/user/update")
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
      session.setAttribute("loginUser", user);
      return "redirect:../clazz/list";
    } else {
      throw new Exception("유저 정보 변경에 실패했습니다.");
    }
  }

}
