package Team.project.web;

import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import Team.project.domain.Clazz;
import Team.project.domain.ClazzMember;
import Team.project.domain.User;
import Team.project.service.ClazzMemberService;
import Team.project.service.ClazzService;

@Controller
@RequestMapping("/clazz")
public class ClazzController {

  @Autowired
  ClazzService clazzService;
  @Autowired
  ClazzMemberService clazzMemberService;

  @GetMapping("list")
  public String list(HttpSession session, Model model) throws Exception {
    int no = -1;
    if (session.getAttribute("loginUser") != null) {
      no = ((User) session.getAttribute("loginUser")).getUserNo();
    }
    List<Clazz> clazzList = clazzService.list(no);
    if (clazzList != null) {
      model.addAttribute("clazzList", clazzList);
    }
    return "/WEB-INF/jsp/clazz/list.jsp";
  }

  @GetMapping("form")
  public String form() {
    return "/WEB-INF/jsp/clazz/form.jsp";
  }
  
 
  
    @PostMapping("add")
  public String add(HttpSession session, Clazz clazz) throws Exception {
    // 랜덤 수업 코드 생성
    StringBuffer temp = new StringBuffer();
    Random rnd = new Random();
    for (int i = 0; i < 8; i++) {
      int rIndex = rnd.nextInt(3);
      switch (rIndex) {
        case 0:
          // a-z
          temp.append((char) ((rnd.nextInt(26)) + 97));
          break;
        case 1:
          // A-Z
          temp.append((char) ((rnd.nextInt(26)) + 65));
          break;
        case 2:
          // 0-9
          temp.append((rnd.nextInt(10)));
          break;
      }
    }
    clazz.setClassCode(temp.toString());
    ClazzMember member = new ClazzMember();
    clazzService.add(clazz);
    member.setClazzNo(clazz.getClassNo());
    member.setUserNo(((User) session.getAttribute("loginUser")).getUserNo());
    member.setRole(0);
    clazzMemberService.add(member);
    return "redirect:list";
  }

  @GetMapping("detail")
  public String detail(Model model, HttpSession session) throws Exception {
    
    Clazz clazz = (Clazz) session.getAttribute("clazzNow");
    
    model.addAttribute("clazz", clazz);
    return "/WEB-INF/jsp/clazz/detail.jsp";
  }

  @PostMapping("update")
  public String update(Clazz clazz, Model model) throws Exception {
    if (clazzService.update(clazz) > 0) {
      return "redirect:../room/timeline";
    } else {
      throw new Exception("수업 정보 변경에 실패했습니다.");
    }
  }
  
  // 클래스를 찾은 뒤에 수업 목록에 추가하기
  @GetMapping("join")
  public String join(HttpSession session, Model model, String code) throws Exception {
    ClazzMember clazzMember = new ClazzMember();

    Clazz clazz = (Clazz)clazzService.get(code);
    clazzMember.setClazzNo(clazz.getClassNo());
    
    User user = (User) session.getAttribute("loginUser");
    clazzMember.setUserNo(user.getUserNo());
    clazzMember.setRole(1);
    
    clazzMemberService.add(clazzMember);
    return "redirect:list";
  }

}// ClazzController
