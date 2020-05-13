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
import Team.project.service.AssignmentService;
import Team.project.service.AssignmentSubmitService;
import Team.project.service.FileService;

@Controller
@RequestMapping("/room/assignmentSubmit")
public class AssignmentSubmitController {
  @Autowired
  ServletContext servletContext;

  @Autowired
  AssignmentService assignmentService;

  @Autowired
  AssignmentSubmitService assignmentSubmitService;
  @Autowired
  FileService fileService;

  @PostMapping("form")
  public String form(Assignment assignment, Model model) {
    model.addAttribute("assignment", assignment);
    return "/WEB-INF/jsp/assignmentSubmit/form.jsp";
  }

  @PostMapping("add")
  public String add(HttpSession session, AssignmentSubmit assignmentSubmit, MultipartFile partfile)
      throws Exception {

    if (partfile.getSize() > 0) {
      String fileId = UUID.randomUUID().toString();
      String dirPath = servletContext.getRealPath("/upload/lesson/assignmentSubmit");
      fileService.add(partfile, fileId, dirPath);
      assignmentSubmit.setFile(fileId);
    }
    assignmentSubmitService.add(assignmentSubmit);
    return "redirect:../lesson/list?room_no="
        + ((Clazz) session.getAttribute("clazzNow")).getClassNo();
  }

  @GetMapping("detail")
  public String detailByStudent(int assignmentNo, HttpSession session, Model model)
      throws Exception {
    AssignmentSubmit submit = assignmentSubmitService.get(assignmentNo,
        ((ClazzMember) session.getAttribute("nowMember")).getMemberNo());
    Assignment assignment = assignmentService.get(assignmentNo);
    model.addAttribute("file", fileService.get(submit.getFile()));
    model.addAttribute("assignmentSubmit", submit);
    model.addAttribute("assignmentTitle", assignment.getTitle());
    return "/WEB-INF/jsp/assignmentSubmit/detail_student.jsp";
  }

  @PostMapping("update")
  public String update(HttpSession session, AssignmentSubmit assignmentSubmit,
      MultipartFile partfile) throws Exception {
    if (partfile.getSize() > 0) {
      String fileId = UUID.randomUUID().toString();
      String dirPath = servletContext.getRealPath("/upload/lesson/assignmentSubmit");
      fileService.add(partfile, fileId, dirPath);

      // 파일 업데이트 시 기존 파일을 삭제하고 새로 추가한다.
      String oldFile = assignmentSubmit.getFile();
      if (oldFile != null) {
        File deleteFile = new File(dirPath + "/" + oldFile);
        deleteFile.deleteOnExit();
        fileService.delete(oldFile);
      }

      assignmentSubmit.setFile(fileId);
    }
    assignmentSubmitService.update(assignmentSubmit);
    return "redirect:../lesson/list?room_no="
        + ((Clazz) session.getAttribute("clazzNow")).getClassNo();
  }

  // 선생이 submitted 목록에서 제출된 과제물 보기를 클릭시 호출됨
  @GetMapping("review")
  public String detailByTeacher(int assignmentNo, int memberNo, HttpSession session, Model model)
      throws Exception {
    AssignmentSubmit submit = assignmentSubmitService.get(assignmentNo, memberNo);
    Assignment assignment = assignmentService.get(assignmentNo);
    model.addAttribute("file", fileService.get(submit.getFile()));
    model.addAttribute("assignmentSubmit", submit);
    model.addAttribute("assignmentTitle", assignment.getTitle());
    return "/WEB-INF/jsp/assignmentSubmit/detail_teacher.jsp";
  }

  // 선생이 제출된 과제물 상세보기에서 평가시 호출됨
  @PostMapping("evaluation")
  public String evaluation(AssignmentSubmit assignmentSubmit) throws Exception {
    assignmentSubmitService.update(assignmentSubmit);
    return "redirect:../assignment/submitted?assignmentNo=" + assignmentSubmit.getAssignmentNo();
  }


}
