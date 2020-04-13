package Team.project.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import Team.project.domain.Clazz;
import Team.project.service.ClazzService;

@WebServlet("/clazz/detail")
public class ClazzDetailServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    req.setCharacterEncoding("utf-8");
    int no = Integer.parseInt(req.getParameter("no"));
    try {
      resp.setContentType("text/html;charset=utf-8");
      ClazzService clazzService =
          ((ApplicationContext)getServletContext().getAttribute("iocContainer")).
          getBean(ClazzService.class);
      Clazz clazz = clazzService.get(no);
      req.setAttribute("clazz", clazz);
      req.getRequestDispatcher("/clazz/detail.jsp").include(req, resp);

    } catch(Exception e) {
      req.setAttribute("error", e);
      req.setAttribute("url", "clazz/detail?no="+no);
      req.getRequestDispatcher("/error").forward(req, resp);
    }
  }
}
