package Team.project.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import Team.project.domain.Clazz;
import Team.project.domain.ClazzMember;
import Team.project.domain.User;
import Team.project.service.ClazzMemberService;

@Component
public class RoomUserInterceptor implements HandlerInterceptor {

  @Autowired
  ClazzMemberService memberService;

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    System.out.println("========> RoomUserInterceptor.preHandle()");

    User user = (User) request.getSession().getAttribute("loginUser");
    int userNo = user.getUserNo();
    System.out.println("userNo ===> " + userNo);
    int classNo = 0;
    try {
      classNo = Integer.parseInt(request.getParameter("room_no"));
    } catch (Exception e) {
      Clazz clazz = (Clazz) request.getSession().getAttribute("clazzNow");
      classNo = clazz.getClassNo();
    }
    System.out.println("classNo ===> " + classNo);
    if (classNo == 0) {
      response.setStatus(403);
      response.sendRedirect("/Team-project/app/clazz/list");
      return false;
    }
    try {
      ClazzMember member = memberService.get(userNo, classNo);
      if (member == null) {
        response.setStatus(403);
        response.sendRedirect("/Team-project/app/clazz/list");
        return false;
      }
      request.getSession().setAttribute("nowMember", member);

    } catch (Exception e) {
      e.printStackTrace();
    }
    return true;
  }

}
