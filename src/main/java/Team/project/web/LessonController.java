package Team.project.web;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import Team.project.domain.Answer;
import Team.project.domain.Assignment;
import Team.project.domain.Question;
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
  public String list(int no, Model model) throws Exception {
    List<Assignment> assignmentList = assignmentService.list(no);
    model.addAttribute("assignments", assignmentList);
    List<Answer> answerList = answerService.list(no);
    model.addAttribute("answers", answerList);
    List<Question> questionList = questionService.list(no);
    model.addAttribute("questions", questionList);
    return "/WEB-INF/jsp/room/lesson.jsp";
  }



}
