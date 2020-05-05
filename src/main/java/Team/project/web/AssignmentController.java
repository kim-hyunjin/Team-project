package Team.project.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
  @GetMapping("updateForm")
  public String updateForm(int no, Model model) {
    model.addAttribute("no", no);
    return "/WEB-INF/jsp/assignment/updateForm.jsp";
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
    return "redirect:../lesson/list?room_no=" + clazz.getClassNo();
  }
  @GetMapping("delete")
  public String delete(HttpSession session, int no) throws Exception {
    Clazz clazz = (Clazz) session.getAttribute("clazzNow");
    if (assignmentService.delete(no) > 0) {
      return "redirect:../lesson/list?room_no=" + clazz.getClassNo();
    } else {
      throw new Exception("삭제할 과제 번호가 유효하지 않습니다.");
    }
  }
  
  @GetMapping("detail")
  public String detail(HttpServletRequest request,HttpServletResponse response,
      int no, Model model) throws Exception{
  Assignment assignment = assignmentService.get(no);
    System.out.println(assignment);
  model.addAttribute("assignment", assignment);
  return "/WEB-INF/jsp/assignment/detail.jsp";
  }
  
  @PostMapping("update") 
  public String update(HttpSession session,
      Assignment assignment) throws Exception{
    Clazz clazz = (Clazz) session.getAttribute("clazzNow");
    ClazzMember member = (ClazzMember) session.getAttribute("nowMember");
    assignment.setClassNo(clazz.getClassNo());
    assignment.setMemberNo(member.getMemberNo());
//    if (partfile.getSize() > 0) {
//      String dirPath = servletContext.getRealPath("/upload/lesson/assignment");
//      String originalName = UUID.randomUUID().toString();
//      partfile.transferTo(new File(dirPath + "/" + originalName));
//      assignment.setFile(originalName);
//    }
    
    if (assignmentService.update(assignment) > 0) {
      return "redirect:../lesson/list?room_no="+ clazz.getClassNo();
    } else {
      throw new Exception("변경할 회원 번호가 유효하지 않습니다.");
    }
  }
  
  
}
