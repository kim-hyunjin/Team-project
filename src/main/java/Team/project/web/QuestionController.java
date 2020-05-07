package Team.project.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import Team.project.domain.Answer;
import Team.project.domain.ClazzMember;
import Team.project.domain.Multiple;
import Team.project.domain.Question;
import Team.project.service.AnswerService;
import Team.project.service.MultipleService;
import Team.project.service.QuestionService;
import Team.project.service.TagService;

@Controller
@RequestMapping("/room/question")
public class QuestionController {
  @Autowired
  ServletContext servletContext;
  @Autowired
  QuestionService questionService;
  @Autowired
  AnswerService answerService;
  @Autowired
  TagService tagService;
  @Autowired
  MultipleService multipleService;

  @GetMapping("form")
  public String form() {
    return "/WEB-INF/jsp/question/form.jsp";
  }

  @PostMapping("add")
  public String add(Question question, HttpSession session, MultipartFile partfile)
      throws Exception {
    int memberNo = ((ClazzMember) session.getAttribute("nowMember")).getMemberNo();
    question.setMemberNo(memberNo);
    if (partfile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/lesson/question");
      String originalName = partfile.getOriginalFilename();
      // String extention = originalName.substring(originalName.lastIndexOf(".") + 1);
      partfile.transferTo(new File(dirPath + "/" + originalName));
      question.setFilePath(originalName);
    }

    questionService.add(question);
    return "redirect:../lesson/list?room_no=" + session.getAttribute("clazzNowNo");
  }

  @GetMapping("detail")
  public String detail(int qno, Model model) throws Exception {
    model.addAttribute("question", questionService.get(qno));
    model.addAttribute("multiple", multipleService.list(qno));

    List<Answer> answerList = answerService.findAll(qno);
    HashMap<Integer, Multiple> multipleMap = new HashMap<>();
    for (Answer a : answerList) {
      int multipleNo = a.getMultipleNo();
      int questionNo = a.getQuestionNo();
      if (multipleNo > 0) {
        multipleMap.put(multipleNo, multipleService.getAnswer(questionNo, multipleNo));
      }
    }
    model.addAttribute("multipleAnswers", multipleMap);
    model.addAttribute("answers", answerList);
    return "/WEB-INF/jsp/question/detail.jsp";
  }


  @PostMapping("update")
  public String update(Question question, HttpSession session) throws Exception {
    questionService.update(question);
    return "redirect:../lesson/list?room_no=" + session.getAttribute("clazzNowNo");
  }

  @GetMapping("delete")
  public String delete(int no, HttpSession session) throws Exception {
    questionService.delete(no);
    return "redirect:../lesson/list?room_no=" + session.getAttribute("clazzNowNo");
  }
}
