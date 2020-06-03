package Team.project.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import Team.project.domain.ClazzMember;
import Team.project.domain.User;
import Team.project.service.ClazzMemberService;
import Team.project.service.MailSendService;
import Team.project.service.UserService;

@Controller
@RequestMapping("/room/user/")
public class ClazzMemberController {
  @Autowired
  UserService userService;
  @Autowired
  ClazzMemberService clazzMemberService;
  @Autowired
  private MailSendService mailsender;

  @RequestMapping("form")
  public String studentForm(Model model, int class_no, int role) {
    model.addAttribute("class_no", class_no);
    model.addAttribute("role", role);
    return "/WEB-INF/jsp/room/user/form.jsp";
  }

  @RequestMapping("invite")
  public void add(@RequestBody Map<String, Object> json, HttpServletResponse response,
      HttpServletRequest request) throws Exception {
    User result = userService.get(json.get("email").toString());
    if (result != null) {
      // 이메일 보내기
      String email = json.get("email").toString();
      int invitorNo = Integer.parseInt(json.get("invitorNo").toString());
      int classNo = Integer.parseInt(json.get("classNo").toString());
      int role = Integer.parseInt(json.get("role").toString());
      System.out.println(String.format("!!!!!!!!이메일은 %s, 초대자는 %s, 수업번호는 %d, 역할은 %d", email,
          invitorNo, classNo, role));
      mailsender.clazzInvite(email, classNo, role, invitorNo, request);
      response.setStatus(200);
    } else {
      response.setStatus(404);
      throw new Exception("회원을 추가할 수 없습니다.");
    }
  }

  @RequestMapping("delete")
  public String delete(int member_no, int room_no, Model model) throws Exception {
    if (clazzMemberService.delete(member_no) > 0) { // 삭제했다면,
      if (member_no != 0) {
        return "redirect:list?room_no=" + room_no;
      } else {
        return "redirect:list";
      }
    } else {
      throw new Exception("해당 번호의 회원이 없습니다.");
    }
  }

  @RequestMapping("detail")
  @ResponseBody
  public Object roomDetail(int user_no, Model model, int member_no) throws Exception {
    User user = userService.get(user_no);
    HashMap<String, Object> map = new HashMap<>();
    map.put("user", new Gson().toJson(user));
    map.put("memberNo", member_no);
    return map;
  }

  @RequestMapping("list")
  public String list(int room_no, Model model) throws Exception {
    List<ClazzMember> memberList = clazzMemberService.findAllByClassNo(room_no);
    List<ClazzMember> teachers = new ArrayList<>();
    List<ClazzMember> students = new ArrayList<>();
    for (ClazzMember member : memberList) {
      if (member.getRole() == 0) {
        teachers.add(member);
      } else {
        students.add(member);
      }
    }
    model.addAttribute("teachers", teachers);
    model.addAttribute("students", students);
    model.addAttribute("room_no", room_no);
    return "/WEB-INF/jsp/room/user/list.jsp";
  }

  @GetMapping("check")
  public void check(HttpSession session, HttpServletResponse response, String email)
      throws Exception {
    User isUser = userService.get(email); // 유효한 이메일인지 확인한다.
    if (isUser == null) {
      response.setStatus(404); // 유효한 이메일이 아니면 404으로 응답
    } else {
      int roomNo = (int) session.getAttribute("clazzNowNo");
      User isMember = userService.get(roomNo, email); // 이메일이 유효한 경우 클래스룸 소속인지 확인한다.
      if (isMember != null) {
        response.setStatus(200); // 클래스룸 소속이면 200으로 응답
      } else {
        response.setStatus(204); // 클래스룸 소속이 아니면 204로 응답
      }
    }
  }
}
