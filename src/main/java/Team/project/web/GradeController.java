package Team.project.web;

import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import Team.project.AppConfig;
import Team.project.domain.AssignmentSubmit;
import Team.project.service.AssignmentService;
import Team.project.service.AssignmentSubmitService;
import Team.project.service.ClazzMemberService;
import Team.project.service.UserService;

@Controller
public class GradeController {
  static Logger logger = LogManager.getLogger(AppConfig.class);

  @Autowired
  AssignmentSubmitService assignmentSubmitService;
  
  @Autowired
  AssignmentService assignmentService;
  
  @Autowired
  UserService userService;
  
  @Autowired
  ClazzMemberService clazzMemberService;
  
  
 @RequestMapping("/room/grade/list")
  public String list(int classNo, Model model) throws Exception{
//    List<AssignmentSubmit> submitList = assignmentSubmitService.listUserName();
    List<AssignmentSubmit> assignmentList = assignmentSubmitService.list(classNo);
    for(AssignmentSubmit test : assignmentList) {
      System.out.println(test.toString());
    }

    //    List<User> userList = userService.list(classNo);
    //    model.addAttribute("submitList", submitList);
    model.addAttribute("assignmentList", assignmentList);
    return "/WEB-INF/jsp/grade/list.jsp";
  }
  
//  public String listAssignment(Model model) throws Exception{
//    List<AssignmentSubmit> submitList = assignmentSubmitService.listAssignment();
//    model.addAttribute("submitList", submitList);
//    return "/WEB-INF/jsp/assignmentsubmit/list.jsp";
//  }
  
}
