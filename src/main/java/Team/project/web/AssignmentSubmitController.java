package Team.project.web;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import com.google.gson.Gson;
import Team.project.domain.Assignment;
import Team.project.domain.AssignmentSubmit;
import Team.project.domain.Clazz;
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

  // 학생이 새로 과제물을 제출할 때 호출됨
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
    return "redirect:../lesson/list?room_no=" + session.getAttribute("clazzNowNo");
  }

  // 학생이 제출한 과제물 변경 시 호출됨
  @PostMapping("update")
  public String update(HttpSession session, AssignmentSubmit assignmentSubmit,
      @RequestPart(required = false) MultipartFile partfile) throws Exception {
    if (partfile != null) {
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

  // 선생이 과제에 대한 학생 제출물을 볼 때 호출됨
  @GetMapping("submitted")
  public String submitted(int assignmentNo, int from, Model model) throws Exception {
    // from 0 = 과제 상세보기화면, 1 = 성적화면
    ArrayList<AssignmentSubmit> submittedList =
        (ArrayList<AssignmentSubmit>) assignmentSubmitService.list(assignmentNo);
    Gson gson = new Gson();
    System.out.println(gson.toJson(submittedList));
    Assignment assignment = assignmentService.get(assignmentNo);
    model.addAttribute("assignment", assignment);
    model.addAttribute("submittedList", gson.toJson(submittedList));
    model.addAttribute("from", from);
    return "/WEB-INF/jsp/assignmentSubmit/submitted.jsp";
  }

  @PostMapping("eval")
  public String update(HttpSession session, AssignmentSubmit assignmentSubmit, int from)
      throws Exception {
    assignmentSubmitService.update(assignmentSubmit);
    return "redirect:submitted?assignmentNo=" + assignmentSubmit.getAssignmentNo() + "&from="
        + from;
  }
}
