package Team.project.web;

import java.net.URLEncoder;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fasterxml.jackson.databind.ObjectMapper;
import Team.project.domain.Clazz;
import Team.project.service.AssignmentService;
import Team.project.service.ClazzService;
import Team.project.service.PostService;
import Team.project.service.QuestionService;

@Controller
@RequestMapping("/room")
public class LessonController {
  @Autowired
  AssignmentService assignmentService;
  @Autowired
  QuestionService questionService;
  @Autowired
  ClazzService clazzService;
  @Autowired
  PostService postService;

  @RequestMapping("lesson/list")
  public String list(int room_no, Model model, HttpSession session) throws Exception {
    // 현재 접속한 클래스룸의 정보를 세션에 "clazzNow"로 저장
    Clazz clazz = clazzService.get(room_no);
    session.removeAttribute("clazzNow");
    session.setAttribute("clazzNow", clazz);
    session.setAttribute("clazzNowNo", clazz.getClassNo());

    ObjectMapper mapper = new ObjectMapper();
    String questionJson = mapper.writeValueAsString(questionService.list(room_no));
    String assignmentJson = mapper.writeValueAsString(assignmentService.list(room_no));
    String postJson = mapper.writeValueAsString(postService.noticeList(clazz.getClassNo()));
    model.addAttribute("questionJson", URLEncoder.encode(questionJson, "UTF-8"));
    model.addAttribute("assignmentJson", URLEncoder.encode(assignmentJson, "UTF-8"));
    model.addAttribute("postJson", URLEncoder.encode(postJson, "UTF-8"));
    System.out.println("새게시물===>" + postJson);
    return "/WEB-INF/jsp/room/lesson.jsp";
  }


}
