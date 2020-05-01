package Team.project.web;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
  public String list(HttpSession session, int no, Model model) throws Exception {
    Clazz clazz = clazzService.get(no);
    session.removeAttribute("clazzNow");
    session.setAttribute("clazzNow", clazz);
    session.setAttribute("nowBoard", boardService.list(no));
    model.addAttribute("questions", questionService.list(no));
    // session.setAttribute("nowAnswer", answerService.list(no));
    return "/WEB-INF/jsp/room/timeline.jsp";
  }

}
//
