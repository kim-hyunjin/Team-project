package Team.project.web;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.google.gson.Gson;
import Team.project.AppConfig;
import Team.project.domain.Assignment;
import Team.project.domain.AssignmentSubmit;
import Team.project.domain.ClazzMember;
import Team.project.domain.User;
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
  public String list(@RequestParam("room_no") int classNo, Model model, HttpSession session)
      throws Exception {
    int role = ((ClazzMember) session.getAttribute("nowMember")).getRole();
    Gson gson = new Gson();
    if (role == 0) {
      // 수업 참여자 목록 얻기
      List<ClazzMember> clazzMembers = clazzMemberService.list(classNo);

      model.addAttribute("clazzMembers", gson.toJson(clazzMembers));

      // 수업 과제 목록 얻기
      List<Assignment> assignments = assignmentService.list(classNo);
      model.addAttribute("assignments", gson.toJson(assignments));

      // 수업 참여자별 과제 제출 목록
      // HashMap<Object, Object> userAssignmentSubmits = new HashMap<>();
      List<AssignmentSubmit> assignmentSubmitList = new ArrayList<>();
      for (ClazzMember cm : clazzMembers) {
        for (AssignmentSubmit ass : assignmentSubmitService.list(classNo, cm.getUserNo())) {
          assignmentSubmitList.add(ass);
        }
      }
      model.addAttribute("userAssignmentSubmits", gson.toJson(assignmentSubmitList));

      return "/WEB-INF/jsp/grade/list.jsp";
    } else {
      model.addAttribute("userAssignmentSubmits", gson.toJson(assignmentSubmitService.list(classNo,
          ((User) session.getAttribute("loginUser")).getUserNo())));

      return "/WEB-INF/jsp/grade/list_student.jsp";
    }

  }
}



// List<Assignment> assignmentList = assignmentService.list(no);
// List<ClazzMember> clazzMemberList = clazzMemberService.list(no);
// int cNo;
// List<List> listoflist = new ArrayList<>();
// for (ClazzMember c : clazzMemberList) {
// cNo = c.getMember_no();
// List<AssignmentSubmit> assignmentSubmitList = assignmentSubmitService.list(cNo);
// listoflist.add(assignmentSubmitList);
// }
//
// model.addAttribute("assignmentsubmitList", assignmentSubmitList);
// model.addAttribute("assignmentList", assignmentList);
// return "/WEB-INF/jsp/grade/list.jsp";
