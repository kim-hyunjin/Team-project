package Team.project.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
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
import Team.project.domain.Clazz;
import Team.project.domain.ClazzMember;
import Team.project.domain.FileVO;
import Team.project.domain.Multiple;
import Team.project.domain.Question;
import Team.project.service.AnswerService;
import Team.project.service.ClazzMemberService;
import Team.project.service.FileService;
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
  @Autowired
  FileService fileService;
  @Autowired
  ClazzMemberService clazzMemberService;

  @GetMapping("form")
  public String form() {
    return "/WEB-INF/jsp/question/form.jsp";
  }

  @PostMapping("add")
  public String add(Question question, HttpSession session, Integer[] no, String[] multipleContent,
      MultipartFile partfile) throws Exception {
    Clazz clazz = (Clazz) session.getAttribute("clazzNow");
    ClazzMember member = (ClazzMember) session.getAttribute("nowMember");
    question.setClassNo(clazz.getClassNo());
    question.setMemberNo(member.getMemberNo());

    // 파일 처리 부분
    if (partfile.getSize() > 0) {
      String fileId = UUID.randomUUID().toString();
      String dirPath = servletContext.getRealPath("/upload/lesson/question");
      fileService.add(partfile, fileId, dirPath);
      question.setFilePath(fileId);
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

    return "redirect:../lesson/list?room_no=" + clazz.getClassNo();
  }

  @GetMapping("detail")
  public String detail(int qno, Model model, HttpSession session) throws Exception {
    Question question = questionService.get(qno);
    FileVO file = fileService.get(question.getFilePath());

    model.addAttribute("question", question);
    model.addAttribute("file", file);
    model.addAttribute("multiple", multipleService.list(qno));

    // 선생인 경우와 학생인 경우 보여주는 detail화면을 다르게 함
    ClazzMember clazzMember = (ClazzMember) session.getAttribute("nowMember");
    int role = clazzMember.getRole();
    if (role == 0) {
      return "/WEB-INF/jsp/question/detail.jsp";
    } else {
      // 학생인 경우 답변이 있는 지 찾아 있다면 모델에 담아준다.
      Answer answer = answerService.get(clazzMember.getMemberNo(), qno);
      if (answer != null) {
        model.addAttribute("answer", answer);
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
    Clazz clazz = (Clazz) session.getAttribute("clazzNow");
    ClazzMember member = (ClazzMember) session.getAttribute("nowMember");
    question.setClassNo(clazz.getClassNo());
    question.setMemberNo(member.getMemberNo());

    if (partfile.getSize() > 0) {
      String fileId = UUID.randomUUID().toString();
      String dirPath = servletContext.getRealPath("/upload/lesson/question");
      fileService.add(partfile, fileId, dirPath);

      // 파일 업데이트 시 기존 파일을 삭제하고 새로 추가한다.
      String oldFile = question.getFilePath();
      if (oldFile != null) {
        File deleteFile = new File(dirPath + "/" + oldFile);
        deleteFile.deleteOnExit();
        fileService.delete(oldFile);
      }

      question.setFilePath(fileId);
    }

    questionService.update(question);

    return "redirect:../lesson/list?room_no=" + clazz.getClassNo();
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

  @GetMapping("submitted")
  public String submitted(int qno, Model model, HttpSession session) throws Exception {
    // 답변 찾아 model에 담는 부분
    List<Answer> answerList = answerService.findAll(qno);
    HashMap<Integer, Multiple> multipleAnswerMap = new HashMap<>();
    for (Answer a : answerList) {
      int multipleNo = a.getMultipleNo();
      if (multipleNo > 0) {
        multipleAnswerMap.put(multipleNo, multipleService.getAnswer(a.getQuestionNo(), multipleNo));
      }
    }
    int clazzNo = (int) session.getAttribute("clazzNowNo");
    float memberCount = clazzMemberService.findAllByClassNo(clazzNo).stream()
        .filter(member -> member.getRole() == 1).count();
    System.out.println("전체 학생 수 ==>" + memberCount);

    Question question = questionService.get(qno);
    List<Multiple> multipleList = multipleService.list(qno);
    HashMap<Integer, Integer> ratioMap = new HashMap<>();
    for (Multiple m : multipleList) {
      float answerCount =
          answerList.stream().filter(a -> a.getMultipleNo() == m.getMultipleNo()).count();
      System.out.println(m.getMultipleNo() + "번 답변 수 ===>" + answerCount);
      System.out.println("답변 비율" + answerCount / memberCount * 100);
      ratioMap.put(m.getMultipleNo(), Math.round(answerCount / memberCount * 100));
    }
    model.addAttribute("ratioMap", ratioMap);
    model.addAttribute("multiples", multipleList);
    model.addAttribute("multipleAnswerMap", multipleAnswerMap);
    model.addAttribute("answers", answerList);
    model.addAttribute("question", question);
    return "/WEB-INF/jsp/question/submitted.jsp";
  }

}
