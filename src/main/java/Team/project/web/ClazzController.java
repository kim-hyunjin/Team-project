package Team.project.web;

import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import Team.project.domain.Clazz;
import Team.project.domain.ClazzMember;
import Team.project.domain.User;
import Team.project.service.ClazzMemberService;
import Team.project.service.ClazzService;

@Controller
@RequestMapping("/clazz")
public class ClazzController {

  @Autowired
  ClazzService clazzService;
  @Autowired
  ClazzMemberService clazzMemberService;

  @GetMapping("list")
  public String list(HttpSession session) throws Exception {
    int no = -1;
    if (session.getAttribute("loginUser") != null) {
      no = ((User) session.getAttribute("loginUser")).getUserNo();
    }
    List<Clazz> clazzList = clazzService.list(no);
    if (clazzList != null) {
      System.out.println("수업목록==========>" + clazzList);
      session.setAttribute("clazzList", clazzList);
    }
    return "/WEB-INF/jsp/clazz/list.jsp";
  }


  @PostMapping("add")
  public String add(HttpSession session, Clazz clazz) throws Exception {
    System.out.println("색깔!!!!!!!!!!!!!!!!!" + clazz.getColor());
    // 랜덤 수업 코드 생성
    StringBuffer temp = new StringBuffer();
    Random rnd = new Random();
    for (int i = 0; i < 8; i++) {
      int rIndex = rnd.nextInt(3);
      switch (rIndex) {
        case 0:
          // a-z
          temp.append((char) ((rnd.nextInt(26)) + 97));
          break;
        case 1:
          // A-Z
          temp.append((char) ((rnd.nextInt(26)) + 65));
          break;
        case 2:
          // 0-9
          temp.append((rnd.nextInt(10)));
          break;
      }
    }
    clazz.setClassCode(temp.toString());
    clazzService.add(clazz);
    ClazzMember member = new ClazzMember();
    member.setClazzNo(clazz.getClassNo());
    member.setUserNo(((User) session.getAttribute("loginUser")).getUserNo());
    member.setRole(0);
    clazzMemberService.add(member);
    return "redirect:list";
  }

  @GetMapping("delete")
  public String delete(int no) throws Exception {

    if (clazzService.delete(no) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("삭제할 수업 번호가 유효하지 않습니다.");
    }
  }

  @GetMapping("detail")
  @ResponseBody
  public ResponseEntity<String> detail(HttpSession session,
      @RequestParam(defaultValue = "0") int classNo) throws Exception {

    Clazz clazz = null;
    if (classNo == 0) {
      clazz = (Clazz) session.getAttribute("clazzNow");
    } else {
      clazz = clazzService.get(classNo);
    }
    System.out.println(clazz);
    Gson gson = new Gson();
    String jsonData = gson.toJson(clazz);
    HttpHeaders header = new HttpHeaders();
    header.add("Content-Type", "text/html;charset=utf-8");
    return new ResponseEntity<>(jsonData, header, HttpStatus.OK);
  }

  @PostMapping("update")
  public String update(HttpSession session, Clazz clazz, int userNo, String from, Model model)
      throws Exception {
    int role = clazzMemberService.get(userNo, clazz.getClassNo()).getRole();
    if (role == 0) {
      clazzService.update(clazz);
    } else {
      return "redirect:list";
    }
    if (from.equals("main")) {
      return "redirect:list";
    }
    return "redirect:../room/lesson/list?room_no=" + session.getAttribute("clazzNowNo");
  }

  // 클래스를 찾은 뒤에 수업 목록에 추가하기
  @GetMapping("join")
  public void join(HttpSession session, Model model, HttpServletResponse response, String code)
      throws Exception {
    // 사용자가 입력한 코드를 가진 수업이 있는지 확인
    Clazz clazz = clazzService.get(code);
    if (clazz != null) {
      @SuppressWarnings("unchecked")
      List<Clazz> clazzList = (List<Clazz>) session.getAttribute("clazzList");
      // 사용자가 이미 가입한 수업이 아닌 경우에만 가입 성공
      for (Clazz c : clazzList) {
        if (c.getClassNo() == clazz.getClassNo()) {
          response.setStatus(400);
          return;
        }
      }
      ClazzMember clazzMember = new ClazzMember();
      clazzMember.setClazzNo(clazz.getClassNo());
      User user = (User) session.getAttribute("loginUser");
      clazzMember.setUserNo(user.getUserNo());
      clazzMember.setRole(1);

      clazzMemberService.add(clazzMember);
      response.setStatus(200);
      return;
    } else {
      response.setStatus(204);
      return;
    }
  }

  @RequestMapping("invited")
  public String join(int userNo, int clazzNo, int role) throws Exception {
    ClazzMember clazzMember = new ClazzMember();
    clazzMember.setUserNo(userNo);
    clazzMember.setClazzNo(clazzNo);
    clazzMember.setRole(role);
    clazzMemberService.add(clazzMember);

    return "redirect:../room/lesson/list?room_no=" + clazzNo;
  }

}// ClazzController
