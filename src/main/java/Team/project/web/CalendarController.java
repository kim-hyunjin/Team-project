package Team.project.web;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;

import Team.project.domain.Clazz;
import Team.project.domain.User;
import Team.project.service.AssignmentService;
import Team.project.service.ClazzMemberService;
import Team.project.service.ClazzService;
import Team.project.service.QuestionService;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

  @Autowired
  ClazzService clazzService;
  @Autowired
  ClazzMemberService clazzMemberService;
  @Autowired
  QuestionService questionService;
  @Autowired
  AssignmentService assignmentService;

  

  @GetMapping("calendar")
  public String calendar(HttpSession session, Model model) throws Exception{
	  
	  int no = -1;
	  User user = (User) session.getAttribute("loginUser");
	  no = user.getUserNo();
	  // 클래스 리스트를 출력
	  List<Clazz> clazzList = clazzService.list(no);
	  System.out.println(clazzList.toString());
	  
	  
	  ObjectMapper mapper = new ObjectMapper();
	    String questionJson = mapper.writeValueAsString(questionService.list(no));
	    String assignmentJson = mapper.writeValueAsString(assignmentService.list(no));

	    model.addAttribute("questionJson", questionJson);
	    model.addAttribute("assignmentJson", assignmentJson);
	
	  
    return "/WEB-INF/jsp/calendar/calendar.jsp";
  }
  
//  @GetMapping("list")
//  public String list (Model model, Date date, int classNo) throws Exception{
//	  
//	  Clazz clazz = clazzService.get(date);
//	  model.addAttribute("clazz", clazz);
//	  return "/WEB-INF/jsp/calendar/list.jsp";
//	  
//  }
  
 
  
}
