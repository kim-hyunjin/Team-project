package Team.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import Team.project.domain.ClazzMember;
import Team.project.domain.User;
import Team.project.service.ClazzMemberService;

public class RoomInterceptor extends HandlerInterceptorAdapter {

  @Autowired
  ClazzMemberService memberService;

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {

    User user = (User) request.getSession().getAttribute("loginUser");
    int userNo = user.getUserNo();
    int classNo = Integer.parseInt(request.getParameter("no"));
    ClazzMember member;
    try {
      member = memberService.get(userNo, classNo);
      if (member == null) {
        response.sendRedirect("/Team-project/app/clazz/list");
        return false;
      }
    } catch (Exception e) {
      e.printStackTrace();
    }

    return super.preHandle(request, response, handler);
  }
}
