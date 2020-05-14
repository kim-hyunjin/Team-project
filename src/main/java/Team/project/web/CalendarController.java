package Team.project.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

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
    model.addAttribute("clazzList", clazzList);

    return "/WEB-INF/jsp/calendar/calendar.jsp";
  }

  @GetMapping("data")
  public void data(HttpSession session, Model model, HttpServletResponse response) throws Exception {
     
    User user = (User) session.getAttribute("loginUser");
    // 클래스 리스트를 출력
    List<Clazz> clazzList = clazzService.list(user.getUserNo());
    HashMap<String, Object> map = new HashMap<>();

//    List<Assignment> assignmentList = assignmentService.list(clazz.getClassNo());
//    Question questionList = (Question) questionService.list(clazz.getClassNo());
    int i= 0;
    for(Clazz c : clazzList) {
       i++;
      map.put("size", map.size());
      map.put("assignmentList"+i, assignmentService.list(c.getClassNo()));
      map.put("questionList"+i, questionService.list(c.getClassNo()));
    }
    System.out.println(questionService.list(clazzService.get((user.getUserNo())).getClassNo()));
    
    
    System.out.println(map.get("size"));
    String json = new Gson().toJson(map);
    System.out.println(json);
    response.setCharacterEncoding("utf-8");
    response.setContentType("application/json");
    PrintWriter out = response.getWriter();
    out.write(json);
    
  }



}