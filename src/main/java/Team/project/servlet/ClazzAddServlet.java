package Team.project.servlet;

import java.io.IOException;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import Team.project.domain.Clazz;
import Team.project.service.ClazzService;

@WebServlet("/clazz/add")
public class ClazzAddServlet extends HttpServlet{
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    resp.setContentType("text/html;charset=UTF-8");
    req.getRequestDispatcher("/clazz/form.jsp").include(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    try {
      req.setCharacterEncoding("utf-8");
      ClazzService clazzService =
          ((ApplicationContext)req.getServletContext().getAttribute("iocContainer")).
          getBean(ClazzService.class);
      Clazz clazz = new Clazz();
      clazz.setName(req.getParameter("name"));
      clazz.setDescription(req.getParameter("description"));
      clazz.setRoom(req.getParameter("room"));

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
      resp.sendRedirect("list");

    }catch(Exception e) {
      req.setAttribute("error", e);
      req.setAttribute("url", "list");
      req.getRequestDispatcher("/error").forward(req, resp);
    }
  }
}
