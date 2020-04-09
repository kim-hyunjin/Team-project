package Team.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/error")
public class ErrorServlet extends HttpServlet{
  private static final long serialVersionUID = 1L;

  @Override
  protected void service(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    resp.setContentType("text/html;charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<meta charset='UTF-8'>");
    out.println("<title>에러</title>");
    out.println("</head>");
    out.println("<body>");
    out.println("<h1>오류 내용</h1>");
    out.printf("%s<br>", ((Exception)req.getAttribute("error")).getMessage());
    String url = (String)req.getAttribute("url");
    if(url != null) {
      out.printf("<a href=%s>뒤로가기</a>", url);
    }
    out.println("</body>");
    out.println("</html>");
  }
}
