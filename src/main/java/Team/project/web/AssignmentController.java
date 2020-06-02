package Team.project.web;

import java.io.File;
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
import Team.project.domain.Assignment;
import Team.project.domain.AssignmentSubmit;
import Team.project.domain.Clazz;
import Team.project.domain.ClazzMember;
import Team.project.domain.FileVO;
import Team.project.service.AssignmentService;
import Team.project.service.AssignmentSubmitService;
import Team.project.service.FileService;

@Controller
@RequestMapping("/room/assignment")
public class AssignmentController {
  @Autowired
  ServletContext servletContext;

  @Autowired
  AssignmentService assignmentService;

  @Autowired
  AssignmentSubmitService assignmentSubmitService;

  @Autowired
  FileService fileService;

  @GetMapping("form")
  public String form() {
    return "/WEB-INF/jsp/assignment/form.jsp";
  }

  @PostMapping("add")
  public String add(HttpSession session, Assignment assignment, MultipartFile partfile)
      throws Exception {
    int clazzNowNo = (int) session.getAttribute("clazzNowNo");
    ClazzMember member = (ClazzMember) session.getAttribute("nowMember");
    assignment.setClassNo(clazzNowNo);
    assignment.setMemberNo(member.getMemberNo());

    if (partfile.getSize() > 0) { // 파일 업로드 처리
      String fileId = UUID.randomUUID().toString();
      String dirPath = servletContext.getRealPath("/upload/lesson/assignment");
      fileService.add(partfile, fileId, dirPath);
      assignment.setFile(fileId);
    }
    assignmentService.add(assignment);
    return "redirect:../lesson/list?room_no=" + clazzNowNo;
  }

  @GetMapping("delete")
  public String delete(HttpSession session, int no) throws Exception {
    if (assignmentService.delete(no) > 0) {
      return "redirect:../lesson/list?room_no=" + session.getAttribute("clazzNowNo");
    } else {
      throw new Exception("삭제할 과제 번호가 유효하지 않습니다.");
    }
  }

  // 현재 접속자가 과제에 대해 detail 요청을 할 시 과제에 대한 제출물이 있다면 함께 보여줌
  @GetMapping("detail")
  public String detail(int assignmentNo, Model model, HttpSession session) throws Exception {
    Assignment assignment = assignmentService.get(assignmentNo);
    FileVO file = fileService.get(assignment.getFile());
    if (file != null) {
      model.addAttribute("file", file);
    }
    model.addAttribute("assignment", assignment);
    AssignmentSubmit submit = assignmentSubmitService.get(assignmentNo,
        ((ClazzMember) session.getAttribute("nowMember")).getMemberNo());
    model.addAttribute("assignmentSubmit", submit);
    if (assignment.getDeadline().after(new java.sql.Date(System.currentTimeMillis()))) {
      System.out.println("마감 시간 안지남!");
      model.addAttribute("timeout", false);
    } else {
      System.out.println("마감 시간 지남!");
      model.addAttribute("timeout", true);
    }
    return "/WEB-INF/jsp/assignment/detail.jsp";
  }

  @PostMapping("update")
  public String update(HttpSession session, Assignment assignment, MultipartFile partfile)
      throws Exception {
    Clazz clazz = (Clazz) session.getAttribute("clazzNow");
    assignment.setClassNo(clazz.getClassNo());

    if (partfile.getSize() > 0) { // 파일 업로드 처리
      String fileId = UUID.randomUUID().toString();
      String dirPath = servletContext.getRealPath("/upload/lesson/assignment");
      fileService.add(partfile, fileId, dirPath);

      // 파일 업데이트 시 기존 파일을 삭제한다.
      String oldFile = assignment.getFile();
      if (oldFile != null) {
        File deleteFile = new File(dirPath + "/" + oldFile);
        deleteFile.deleteOnExit();
        fileService.delete(oldFile);
      }

      assignment.setFile(fileId);
    }

    if (assignmentService.update(assignment) > 0) {
      return "redirect:../lesson/list?room_no=" + clazz.getClassNo();
    } else {
      throw new Exception("변경할 회원 번호가 유효하지 않습니다.");
    }
  }



}
