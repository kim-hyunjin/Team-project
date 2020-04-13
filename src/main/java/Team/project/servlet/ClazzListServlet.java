package Team.project.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import Team.project.domain.Clazz;
import Team.project.service.ClazzService;

@WebServlet("/clazz/list")
public class ClazzListServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    try {
      ClazzService clazzService =
          ((ApplicationContext)req.getServletContext().getAttribute("iocContainer")).
          getBean(ClazzService.class);
      List<Clazz> clazzList = clazzService.list();
      req.setAttribute("clazzList", clazzList);
      resp.setContentType("text/html;charset=utf-8");
      req.getRequestDispatcher("/clazz/list.jsp").include(req, resp);
    } catch(Exception e) {
      req.setAttribute("error", e);
      req.setAttribute("url", "list");
      req.getRequestDispatcher("/error").forward(req, resp);
    }
  }
}
