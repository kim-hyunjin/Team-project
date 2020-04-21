package Team.project.web;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import Team.project.domain.Clazz;
import Team.project.service.ClazzService;

@Controller
@RequestMapping(value = "/clazz", method = {RequestMethod.GET, RequestMethod.POST})
public class ClazzController {

  static Logger logger = LogManager.getLogger(ClazzController.class);

  @Autowired
  ClazzService clazzService;

  public ClazzController() {
    logger.debug("ClazzController 생성됨");
  }

  @GetMapping("form")
  public void form() throws Exception {}

  @PostMapping("add")
  public String add(Clazz clazz) throws Exception {
    clazzService.add(clazz);
    return "redirect:list";
  }

  @GetMapping("delete")
  public String delete(int no) throws Exception {
    if (clazzService.delete(no) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("삭제할 클래스 번호가 유효하지 않습니다.");
    }
  }

  @GetMapping("detail")
  public void detail(int no, Model model) throws Exception {
    model.addAttribute("clazz", clazzService.get(no));
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("list", clazzService.list());
  }

  @PostMapping("update")
  public String update(Clazz clazz) throws Exception {

    if (clazzService.update(clazz) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 클래스 번호가 유효하지 않습니다.");
    }

  }

}


