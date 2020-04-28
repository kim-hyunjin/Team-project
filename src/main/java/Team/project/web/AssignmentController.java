package Team.project.web;

import java.io.File;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import Team.project.domain.Assignment;
import Team.project.domain.Clazz;
import Team.project.domain.ClazzMember;
import Team.project.service.AssignmentService;

@Controller
@RequestMapping("/room/assignment")
public class AssignmentController {
  @Autowired
  ServletContext servletContext;

  @Autowired
  AssignmentService assignmentService;

  @GetMapping("form")
  public String form() {
    return "/WEB-INF/jsp/assignment/form.jsp";
  }

  @PostMapping("add")
  public String add(HttpSession session, Assignment assignment, MultipartFile partfile)
      throws Exception {
    Clazz clazz = (Clazz) session.getAttribute("clazzNow");
    ClazzMember member = (ClazzMember) session.getAttribute("nowMember");
    assignment.setClassNo(clazz.getClassNo());
    assignment.setMemberNo(member.getMemberNo());
    if (partfile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/lesson/assignment");
      String originalName = partfile.getOriginalFilename();
      // String extention = originalName.substring(originalName.lastIndexOf(".") + 1);
      partfile.transferTo(new File(dirPath + "/" + originalName));
      assignment.setFile(originalName);
    }
    assignmentService.add(assignment);
    return "redirect:../lesson/list?no=" + clazz.getClassNo();
  }
}
