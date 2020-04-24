package Team.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import Team.project.domain.User;
import Team.project.service.ClazzMemberService;

public class GlobalInterceptor extends HandlerInterceptorAdapter {

  @Autowired
  ClazzMemberService memberService;

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {

    User user = (User) request.getSession().getAttribute("loginUser");
    if (user == null) {
      response.sendRedirect("/Team-project/app/auth/form");
      return false;
    }

    return super.preHandle(request, response, handler);
  }
}
