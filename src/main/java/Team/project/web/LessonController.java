package Team.project.web;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import Team.project.domain.Answer;
import Team.project.domain.Assignment;
import Team.project.domain.Multiple;
import Team.project.domain.Question;
import Team.project.service.AnswerService;
import Team.project.service.AssignmentService;
import Team.project.service.AssignmentSubmitService;
import Team.project.service.ClazzMemberService;
import Team.project.service.MultipleService;
import Team.project.service.QuestionService;
import Team.project.service.TagService;

@Controller
@RequestMapping("/room")
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
  @Autowired
  MultipleService multipleService;
  @Autowired
  ClazzMemberService clazzMemberService;

  @RequestMapping("lesson/list")
  public String list(int no, Model model) throws Exception {
    List<Assignment> assignmentList = assignmentService.list(no);
    model.addAttribute("assignments", assignmentList);

    List<Question> questionList = questionService.list(no);
    model.addAttribute("questions", questionList);
    return "/WEB-INF/jsp/room/lesson.jsp";
  }

  @RequestMapping("question/detail")
  public String detail(int qno, Model model) throws Exception {
    List<Answer> answerList = answerService.findAll(qno); // 한 질문에 대한 여러 답변들

    for (Answer a : answerList) {
      System.out.println("============>" + a.getUser().getName());
      System.out.println("===========>" + a.getContent());
      System.out.println("===========>" + a.getMultipleNo());
    }
    HashMap<Integer, Multiple> multiples = new HashMap<>();
    for (Answer a : answerList) {
      int multipleNo = a.getMultipleNo();
      int questionNo = a.getQuestionNo();
      if (multipleNo > 0) {
        multiples.put(multipleNo, multipleService.get(questionNo, multipleNo)); // 한 답변에 들어
      }
    }


    model.addAttribute("multiples", multiples);
    model.addAttribute("answers", answerList);
    return "/WEB-INF/jsp/answer/list.jsp";
  }



}
