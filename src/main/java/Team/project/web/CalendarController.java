package Team.project.web;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
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



  @RequestMapping("calendar")
  public String calendar(HttpSession session, Model model) throws Exception{

    User user = (User) session.getAttribute("loginUser");
    // 클래스 리스트를 출력
    List<Clazz> clazzList = clazzService.list(user.getUserNo());
    List<Assignment> assignmentList = new ArrayList<>();
    List<Question> questionList = new ArrayList<>();
    
    // 문제점: 클래스 개수로만 반복문을 돌려서.
    // 클래스를 돌릴 때 안에 갯수 만큼 돌려야 한다.
    
    
    
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
    System.out.println(assignmentList);
    model.addAttribute("clazzList", clazzList);
    model.addAttribute("assignmentList", assignmentList);
    model.addAttribute("questionList", questionList);
    

    return "/WEB-INF/jsp/calendar/calendar.jsp";
  }

  
  @GetMapping(value="data2", produces = "application/json;charset=UTF-8")
  @ResponseBody
  public String data2(HttpSession session, Model model, HttpServletResponse response) throws Exception {
     
    User user = (User) session.getAttribute("loginUser");
    // 클래스 리스트를 출력
    List<Clazz> clazzList = clazzService.list(user.getUserNo());
    
    // 과제, 질문 번호 List 출력
    List<Object> list = new ArrayList<>();
    
    
    for(Clazz c : clazzList) {
      List<Assignment> assignmentTempList = assignmentService.allList(c.getClassNo());
      for(int i = 0; i < assignmentTempList.size(); i++) {
        list.add(assignmentTempList.get(i));
      }
      List<Question> questionTempList = questionService.allList(c.getClassNo());
      for(int i = 0; i < questionTempList.size(); i++) {
        list.add(questionTempList.get(i));
      }
    }
    
    
    System.out.println(list);
    return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);
  }



}