package Team.project.web;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import Team.project.domain.Board;
import Team.project.domain.Clazz;
import Team.project.service.BoardService;
import Team.project.service.PostService;

@Controller
public class BoardController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  BoardService boardService;

  @Autowired
  PostService postService;

  @RequestMapping("/room/board")
  public String boardList() throws Exception {
    return "/WEB-INF/jsp/post/list.jsp";
  }

  @GetMapping("/room/board/form")
  public String form() {
    return "/WEB-INF/jsp/board/form.jsp";
  }

  @PostMapping("/room/board/add")
  public String add(HttpSession session, Board board) throws Exception {
    Clazz clazz = (Clazz) session.getAttribute("clazzNow");
    board.setClassNo(clazz.getClassNo());
    System.out.println(board.toString());
    boardService.add(board);
    return "redirect:./"; //
  }


}


