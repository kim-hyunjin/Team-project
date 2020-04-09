package Team.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import Team.project.domain.User;
import Team.project.service.UserService;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
@WebServlet("/user/detail")
public class UserDetailServlet extends HttpServlet{
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    req.setCharacterEncoding("utf-8");
    int no = Integer.parseInt(req.getParameter("no"));
    try {
      resp.setContentType("text/html;charset=UTF-8");
      PrintWriter out = resp.getWriter();

      ServletContext servletContext = getServletContext();
      ApplicationContext iocContainer =
          (ApplicationContext) servletContext.getAttribute("iocContainer");
      UserService userService = iocContainer.getBean(UserService.class);

      User user = userService.get(no);

      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<meta charset='UTF-8'>");
      out.println("<title>회원 상세정보</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>회원 상세정보</h1>");

      if (user != null) {
        out.printf("<img src='../upload/%s'><br>\n", user.getProfilePhoto());
        out.println("<form action='update' method='post' enctype='multipart/form-data'>");
        out.printf("번호: <input name='no' type='text' readonly value='%d'><br>\n", //
            user.getUserNo());
        out.printf("이메일: <input name='email' type='email' value='%s'><br>\n", //
            user.getEmail());
        out.printf("이름: <input name='name' type='text' value='%s'><br>\n", //
            user.getName());
        out.println("암호: <input name='password' type='password'><br>");
        out.printf("전화: <input name='tel' type='tel' value='%s'><br>\n", //
            user.getTel());
        out.printf("전공: <input name='major' type='text' value='%s'><br>\n", //
            user.getMajor());
        out.printf("자기소개<br><textarea name='introduce' rows='5' cols='60'>%s</textarea><br>\n", //
            user.getIntroduce());
        out.printf("사진: <input name='profilePhoto' type='file'><br>\n");
        int loginm = user.getLoginMethod();
        String loginstr;
        switch(loginm) {
          case 0 : loginstr = "이메일"; break;
          case 1 : loginstr = "카카오"; break;
          case 2 : loginstr = "구글"; break;
          default : loginstr = "null";
        }
        out.printf("로그인 방식: %s<br>", loginstr);
        out.printf("회원가입일 : %s", user.getCreateDate());
        out.println("<p><button>변경</button>");
        out.printf("<a href='delete?no=%d'>삭제</a></p>\n", //
            user.getUserNo());
        out.println("</form>");
      } else {
        throw new Exception("해당 번호의 회원이 없습니다.");
      }
      out.println("</body>");
      out.println("</html>");
    } catch (Exception e) {
      req.setAttribute("error", e);
      req.setAttribute("url", "user/detail?no="+no);
      req.getRequestDispatcher("/error").forward(req, resp);
    }
  }
}
