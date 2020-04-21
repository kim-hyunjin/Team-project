package Team.project.web;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
}
