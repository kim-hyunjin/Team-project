package Team.project.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import Team.project.domain.Clazz;
import Team.project.domain.User;
import Team.project.service.ClazzMemberService;

@Service("myfilter")
public class RoomUserFilter implements Filter {
  @Autowired
  ClazzMemberService memberService;

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    HttpServletRequest req = (HttpServletRequest) request;
    HttpServletResponse res = (HttpServletResponse) response;
    User user = (User) req.getSession().getAttribute("loginUser");
    if(user == null) {
      res.setStatus(403);
      res.sendRedirect("/Team-project/app/auth/form");
      return;
    }
    int userNo = user.getUserNo();
    System.out.println("userNo ===> " + userNo);
    int classNo = 0;
    try {
    classNo = Integer.parseInt(req.getParameter("no"));
    } catch(Exception e) {
      Clazz clazz = (Clazz) req.getSession().getAttribute("clazzNow");
      classNo = clazz.getClassNo();
    }
    System.out.println("classNo ===> " + classNo);
    if(classNo == 0) {
      res.setStatus(403);
      res.sendRedirect("/Team-project/app/clazz/list");
      return;
    }
    try {
      if (memberService.get(userNo, classNo) != null) {
        chain.doFilter(req, res);
        return;
      }
      res.setStatus(403);
      res.sendRedirect("/Team-project/app/clazz/list");
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
