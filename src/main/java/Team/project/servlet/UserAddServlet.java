package Team.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import Team.project.domain.User;
import Team.project.service.UserService;

@WebServlet("/user/add")
public class UserAddServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    resp.setContentType("text/html;charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<meta charset='UTF-8'>");
    out.println("<title>회원 입력</title>");
    out.println("</head>");
    out.println("<body>");
    out.println("<h1>회원 입력</h1>");
    out.println("<form action='add' method='post'>");
    out.println("이메일: <input name='email' type='email'><br>");
    out.println("이름: <input name='name' type='text'><br>");
    out.println("암호: <input name='password' type='password'><br>");
    out.println("전화: <input name='tel' type='tel'><br>");
    out.println("전공: <input name='major' type='text'><br>");
    out.println("자기소개<br><textarea name='introduce' rows='5' cols='60'></textarea><br>");
    out.println("사진: <input name='profilePhoto' type='text'><br>");
    out.println("로그인 방식");
    out.print("<label><input type='checkbox' name='loginMethod' value='0'>이메일</label>");
    out.print("<label><input type='checkbox' name='loginMethod' value='1'>카카오</label>");
    out.print("<label><input type='checkbox' name='loginMethod' value='2'>구글</label>");
    out.println("<button>등록</button>");
    out.println("</form>");
    out.println("</body>");
    out.println("</html>");
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    try {
      req.setCharacterEncoding("utf-8");
      resp.setContentType("text/html;charset=UTF-8");
      PrintWriter out = resp.getWriter();

      ServletContext servletContext = getServletContext();
      ApplicationContext iocContainer =
          (ApplicationContext) servletContext.getAttribute("iocContainer");

      UserService userService = iocContainer.getBean(UserService.class);
      User user = new User();
      user.setEmail(req.getParameter("email"));
      user.setName(req.getParameter("name"));
      user.setPassword(req.getParameter("password"));
      user.setTel(req.getParameter("tel"));
      user.setMajor(req.getParameter("major"));
      user.setIntroduce(req.getParameter("introduce"));
      user.setProfilePhoto(req.getParameter("profilePhoto"));
      user.setLoginMethod(Integer.parseInt(req.getParameter("loginMethod")));

      userService.add(user);

      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<meta charset='UTF-8'>");
      out.println("<meta http-equiv='refresh' content='2;url=list'>");
      out.println("<title>유저 입력</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>유저 입력 결과</h1>");
      out.println("<p>새 유저를 등록했습니다.</p>");
      out.println("</body>");
      out.println("</html>");
    } catch (Exception e) {
      throw new ServletException(e);
    }
  }
}
