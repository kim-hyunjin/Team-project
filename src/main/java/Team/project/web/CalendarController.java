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
    model.addAttribute("clazzList", clazzList);

    return "/WEB-INF/jsp/calendar/calendar.jsp";
  }

  @GetMapping("data")
  public void data(HttpSession session, Model model, HttpServletResponse response) throws Exception {
     
    User user = (User) session.getAttribute("loginUser");
    // 클래스 리스트를 출력
    List<Clazz> clazzList = clazzService.list(user.getUserNo());
    
    // 과제, 질문 번호 List 출력
    List<Assignment> assignmentList = new ArrayList<>();
    List<Question> questionList = new ArrayList<>();
    List<Object> list = new ArrayList<>();
    for(Clazz c : clazzList) {
      assignmentList.add(assignmentService.get(c.getClassNo()));
      questionList.add(questionService.get(c.getClassNo()));
    }
    
    // 과제 + 질문 합치기
    list.addAll(assignmentList);
    list.addAll(questionList);
    System.out.println(list);
    
    
    // json으로 파일 출력
    File file = new File("C:\\Users\\user\\git\\Team-project\\src\\main\\webapp\\script\\calendar/data.json");
    System.out.println(file.getAbsolutePath());
    try (FileWriter out = new FileWriter(file)) {
      out.write(new Gson().toJson(list));
    } catch (Exception e) {
      System.out.println("파일 쓰기 중 오류 발생! - " + e.getMessage());
    }
    
    
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
      list.add(assignmentService.get(c.getClassNo()));
      list.add(questionService.get(c.getClassNo()));
    }
    
    return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);
  }



}