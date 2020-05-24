package Team.project.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Team.project.domain.Assignment;
import Team.project.domain.Clazz;
import Team.project.domain.Question;
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

  @RequestMapping("main")
  public String calendar(HttpSession session, Model model) throws Exception{

    User user = (User) session.getAttribute("loginUser");
    // 내가 가입한 수업을 찾는다.
    List<Clazz> clazzList = clazzService.list(user.getUserNo());
    List<Assignment> assignmentList = new ArrayList<>();
    List<Question> questionList = new ArrayList<>();
    
    // 내가 가입한 수업들마다 과제와 질문을 찾아 배열로 만든다.
    for(Clazz c : clazzList) {
      List<Assignment> assignmentTempList = assignmentService.allList(c.getClassNo());
      for(int i = 0; i < assignmentTempList.size(); i++) {
        assignmentList.add(assignmentTempList.get(i));
      }
      List<Question> questionTempList = questionService.allList(c.getClassNo());
      for(int i = 0; i < questionTempList.size(); i++) {
        questionList.add(questionTempList.get(i));
      }
    }
    // 자바 배열을 json배열로 만들어 jsp로 보낸다.
    Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    String assignmentListJson = gson.toJson(assignmentList);
    String questionListJson = gson.toJson(questionList);
    System.out.println("과제 json 리스트===>"+assignmentListJson);
    System.out.println("질문 json 리스트===>"+questionListJson);
    model.addAttribute("assignmentList", assignmentListJson);
    model.addAttribute("questionList", questionListJson);
    return "/WEB-INF/jsp/calendar/calendar.jsp";
  }
  
  @GetMapping("eventDetail")
  @ResponseBody
  public ResponseEntity<String> jsonDetail(int no, int set) throws Exception {
	  Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	  String jsonData = null;
	  if(set == 0) {
		  jsonData = gson.toJson(assignmentService.get(no));
	  } else {
		  jsonData = gson.toJson(questionService.get(no));
	  }
	  HttpHeaders header = new HttpHeaders();
	  header.add("Content-Type", "application/json;charset=utf-8");
	  return new ResponseEntity<>(jsonData, header, HttpStatus.OK);
  }
}