package Team.project.web;

import java.io.File;
import java.util.ArrayList;
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
import com.google.gson.Gson;
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
  public String add(Question question, HttpSession session, Integer[] no, String[] multipleContent,
      MultipartFile partfile) throws Exception {
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
    // 객관식 항목이 있다면 for문을 돌며 insert 수행
    if (no != null) {
      for (int i = 0; i < no.length; i++) {
        Multiple multiple = new Multiple();
        multiple.setQuestionNo(question.getQuestionNo());
        multiple.setNo(no[i]);
        multiple.setMultipleContent(multipleContent[i]);
        multipleService.insert(multiple);
      }
    }

    return "redirect:../lesson/list?room_no=" + session.getAttribute("clazzNowNo");
  }

  @GetMapping("detail")
  public String detail(int qno, Model model, HttpSession session) throws Exception {
    model.addAttribute("question", questionService.get(qno));
    model.addAttribute("multiple", multipleService.list(qno));

    // 답변 찾아 model에 담는 부분
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
    ClazzMember clazzMember = (ClazzMember) session.getAttribute("nowMember");
    int role = clazzMember.getRole();
    if (role == 0) { // 선생인 경우와 학생인 경우 보여주는 detail화면을 다르게 함
      return "/WEB-INF/jsp/question/detail.jsp";
    } else {
      // 학생인 경우 답변이 있는 지 찾아 있다면 모델에 담아준다.
      Answer answer = answerService.get(clazzMember.getMemberNo(), qno);
      if (answer != null) {
        Gson gson = new Gson();
        model.addAttribute("answer", gson.toJson(answer));
      }
      return "/WEB-INF/jsp/question/detail_student.jsp";
    }
  }


  @PostMapping("update")
  public String update(Question question, HttpSession session, Integer[] multipleNo, Integer[] no,
      String[] multipleContent, Integer[] deleteNo, MultipartFile partfile) throws Exception {
    // 넘어온 no와 multipleContent배열을 가지고 ArrayList<Multiple> 생성하여 update 실행
    if (multipleNo != null) {
      ArrayList<Multiple> multipleList = new ArrayList<>();
      for (int i = 0; i < multipleNo.length; i++) {
        Multiple temp = new Multiple();
        temp.setMultipleNo(multipleNo[i]);
        temp.setQuestionNo(question.getQuestionNo());
        temp.setNo(no[i]);
        temp.setMultipleContent(multipleContent[i]);
        multipleList.add(temp);
      }
      multipleService.update(multipleList);
    }
    // int배열 deleteNo로 넘어온 값을 가지고 객관식 항목 삭제
    if (deleteNo != null) {
      for (int delNo : deleteNo) {
        multipleService.delete(delNo);
      }
    }

    // 넘어온 question에 정보 추가 후 update 실행
    int memberNo = ((ClazzMember) session.getAttribute("nowMember")).getMemberNo();
    question.setMemberNo(memberNo);
    if (partfile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/lesson/question");
      String originalName = partfile.getOriginalFilename();
      // String extention = originalName.substring(originalName.lastIndexOf(".") + 1);
      partfile.transferTo(new File(dirPath + "/" + originalName));
      question.setFilePath(originalName);
    }
    questionService.update(question);

    return "redirect:../lesson/list?room_no=" + session.getAttribute("clazzNowNo");
  }

  @GetMapping("delete")
  public String delete(int no, HttpSession session) throws Exception {
    questionService.delete(no);
    return "redirect:../lesson/list?room_no=" + session.getAttribute("clazzNowNo");
  }

  @PostMapping("submit")
  // 퀴즈 디테일에서 학생인 경우 바로 답변을 제출할 수 있도록 함
  public String submit(HttpSession session, Answer answer) throws Exception {
    answer.setMemberNo(((ClazzMember) session.getAttribute("nowMember")).getMemberNo());
    answerService.add(answer);
    return "redirect:../lesson/list?room_no=" + session.getAttribute("clazzNowNo");
  }

  @PostMapping("updateAnswer")
  public String updateAnswer(Answer answer, HttpSession session) throws Exception {
    answer.setMemberNo(((ClazzMember) session.getAttribute("nowMember")).getMemberNo());
    answerService.update(answer);
    return "redirect:../lesson/list?room_no=" + session.getAttribute("clazzNowNo");
  }
}
