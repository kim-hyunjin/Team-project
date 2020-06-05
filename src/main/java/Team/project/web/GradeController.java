package Team.project.web;

import java.net.URLEncoder;
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
import com.fasterxml.jackson.databind.ObjectMapper;
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
@RequestMapping("/room/grade")
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


  @RequestMapping("list")
  public String list(@RequestParam("room_no") int classNo, Model model, HttpSession session)
      throws Exception {
    int role = ((ClazzMember) session.getAttribute("nowMember")).getRole();
    ObjectMapper mapper = new ObjectMapper();
    // 수업 과제 목록 얻기
    List<Assignment> assignments = assignmentService.list(classNo);
    if (assignments.size() != 0) {
      model.addAttribute("assignments",
          URLEncoder.encode(mapper.writeValueAsString(assignments), "UTF-8"));
    }
    if (role == 0) {
      // 수업 참여자 목록 얻기
      List<ClazzMember> clazzMembers = clazzMemberService.list(classNo);
      model.addAttribute("clazzMembers",
          URLEncoder.encode(mapper.writeValueAsString(clazzMembers), "UTF-8"));
      // 수업 참여자별 과제 제출 목록
      // HashMap<Object, Object> userAssignmentSubmits = new HashMap<>();
      List<AssignmentSubmit> assignmentSubmitList = new ArrayList<>();
      for (ClazzMember cm : clazzMembers) {
        for (AssignmentSubmit ass : assignmentSubmitService.list(classNo, cm.getUserNo())) {
          assignmentSubmitList.add(ass);
        }
      }
      model.addAttribute("userAssignmentSubmits",
          URLEncoder.encode(mapper.writeValueAsString(assignmentSubmitList), "UTF-8"));

      long students = clazzMembers.stream().filter(c -> c.getRole() == 1).count();
      if (students == 0) {
        model.addAttribute("noStudent", true);
      }

      return "/WEB-INF/jsp/grade/list.jsp";
    } else {
      // 제출한 과제물 모델에 담기
      model.addAttribute("submits",
          URLEncoder.encode(mapper.writeValueAsString(assignmentSubmitService.list(classNo,
              ((User) session.getAttribute("loginUser")).getUserNo())), "UTF-8"));

      return "/WEB-INF/jsp/grade/list_student.jsp";
    }

  }
}

