package Team.project.servlet;

import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.springframework.context.ApplicationContext;
import Team.project.domain.User;
import Team.project.service.UserService;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.name.Rename;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
@WebServlet("/user/update")
public class UserUpdateServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private String uploadDir;

  @Override
  public void init() throws ServletException {
    this.uploadDir = this.getServletContext().getRealPath("/upload");
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    try {
      req.setCharacterEncoding("utf-8");


      ServletContext servletContext = getServletContext();
      ApplicationContext iocContainer =
          (ApplicationContext) servletContext.getAttribute("iocContainer");
      UserService userService = iocContainer.getBean(UserService.class);

      User user = new User();
      user.setUserNo(Integer.parseInt(req.getParameter("no")));
      user.setEmail(req.getParameter("email"));
      user.setName(req.getParameter("name"));
      user.setPassword(req.getParameter("password"));
      user.setTel(req.getParameter("tel"));
      user.setMajor(req.getParameter("major"));
      user.setIntroduce(req.getParameter("introduce"));
      Part photoPart = req.getPart("profilePhoto");
      String filename = "";
      if (photoPart.getSize() > 0) {
        // 파일을 선택해서 업로드 했다면,
        filename = UUID.randomUUID().toString();
        photoPart.write(this.uploadDir + "/" + filename);
        Thumbnails.of(this.uploadDir + "/" + filename).size(160, 160).outputFormat("jpg").toFiles(Rename.PREFIX_DOT_THUMBNAIL);
        user.setProfilePhoto(filename);
      }

      if (userService.update(user) > 0) {
        resp.sendRedirect("list");
      } else {
        throw new Exception("변경에 실패했습니다.");
      }

    } catch (Exception e) {
      req.setAttribute("error", e);
      req.setAttribute("url", "list");
      req.getRequestDispatcher("/error").forward(req, resp);
    }


  }
}
