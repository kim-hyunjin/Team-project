package Team.project.web;

import java.util.List;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import Team.project.domain.Clazz;
import Team.project.service.ClazzService;

@Controller
public class ClazzController {

  @Autowired
  ClazzService clazzService;

  @GetMapping("/clazz/list")
  public String list(Model model) throws Exception {
    List<Clazz> clazzList = clazzService.list();
    model.addAttribute("clazzList", clazzList);
    return "/WEB-INF/jsp/clazz/list.jsp";
  }

  @GetMapping("/clazz/form")
  public String form() {
    return "/WEB-INF/jsp/clazz/form.jsp";
  }

  @PostMapping("/clazz/add")
  public String add(Clazz clazz) throws Exception {
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
    clazzService.add(clazz);
    return "redirect:list";
  }

  @GetMapping("/clazz/detail")
  public String detail(int no, Model model) throws Exception {
    Clazz clazz = clazzService.get(no);
    model.addAttribute("clazz", clazz);
    return "/WEB-INF/jsp/clazz/detail.jsp";
  }

  @GetMapping("/clazz/room")
  public String room(int no, Model model) throws Exception {
    Clazz clazz = clazzService.get(no);
    model.addAttribute("clazz", clazz);
    return "/WEB-INF/jsp/clazz/room_timeline.jsp";
  }

}// ClazzController
