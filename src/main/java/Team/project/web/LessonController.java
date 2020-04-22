package Team.project.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import Team.project.service.AnswerService;
import Team.project.service.AssignmentService;
import Team.project.service.AssignmentSubmitService;
import Team.project.service.QuestionService;
import Team.project.service.TagService;

@Controller
@RequestMapping("/room/lesson")
public class LessonController {
  @Autowired
  AssignmentService assignmentService;
  @Autowired
  AssignmentSubmitService assignmentSubmitService;
  @Autowired
  QuestionService questionService;
  @Autowired
  AnswerService answerService;
  @Autowired
  TagService tagService;

  @RequestMapping("list")
  public String list(int no) {
    return "/WEB-INF/jsp/room/lesson.jsp";
  }
}
