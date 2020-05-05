package Team.project.web;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fasterxml.jackson.databind.ObjectMapper;
import Team.project.domain.Clazz;
import Team.project.service.AnswerService;
import Team.project.service.AssignmentService;
import Team.project.service.BoardService;
import Team.project.service.ClazzService;
import Team.project.service.PostService;
import Team.project.service.QuestionService;
import Team.project.service.TagService;

@Controller
@RequestMapping("/room/timeline")
public class TimelineController {
  @Autowired
  AssignmentService assignmentService;
  @Autowired
  QuestionService questionService;
  @Autowired
  TagService tagService;
  @Autowired
  PostService postService;
  @Autowired
  ClazzService clazzService;
  @Autowired
  BoardService boardService;
  @Autowired
  AnswerService answerService;

  @GetMapping("list")
  public String list(HttpSession session, int room_no, Model model) throws Exception {
    Clazz clazz = clazzService.get(room_no);
    session.removeAttribute("clazzNow");
    session.setAttribute("clazzNow", clazz);
    session.setAttribute("clazzNowNo", clazz.getClassNo());
    session.setAttribute("nowBoard", boardService.list(room_no));

    // json으로 바꾸기
    ObjectMapper mapper = new ObjectMapper();
    String postJson = mapper.writeValueAsString(postService.timelineList(room_no));
    String assignmentJson = mapper.writeValueAsString(assignmentService.list(room_no));
    String questionJson = mapper.writeValueAsString(questionService.list(room_no));
    model.addAttribute("postJson", postJson);
    model.addAttribute("assignmentJson", assignmentJson);
    model.addAttribute("questionJson", questionJson);
    return "/WEB-INF/jsp/room/timeline.jsp";
  }

}
//
