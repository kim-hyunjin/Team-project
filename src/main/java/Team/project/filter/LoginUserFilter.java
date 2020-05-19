package Team.project.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Team.project.domain.User;

@WebFilter("/app/*")
public class LoginUserFilter implements Filter {
  private String contextPath;

  @Override
  public void destroy() {
    // TODO Auto-generated method stub
  }

  @Override
  public void init(FilterConfig filterConfig) throws ServletException {
    // TODO Auto-generated method stub
    // 웹페이지의 root페이지의 url를 취득한다.
    contextPath = filterConfig.getServletContext().getContextPath();
  }


  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    HttpServletRequest req = (HttpServletRequest) request;
    HttpServletResponse res = (HttpServletResponse) response;
    User user = (User)req.getSession().getAttribute("loginUser");
    if (user != null) {
      chain.doFilter(req, res);
      return;
    }
    String path = req.getRequestURI();
    if (path.contains("/auth") || path.contains("/user/form") || path.contains("/user/add") || path.contains("signup")) {
      chain.doFilter(req, res);
      return;
    }
    res.setStatus(403);
    res.sendRedirect(contextPath + "/app/auth/form");
  }
}
