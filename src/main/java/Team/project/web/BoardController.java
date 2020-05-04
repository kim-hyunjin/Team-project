package Team.project.web;

import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

  @RequestMapping("room/board/form")
  public String form() {
    return "/WEB-INF/jsp/board/form.jsp";
  }

  @RequestMapping("/room/board/add")
  public String add(Board board, Model model) throws Exception {
    Clazz clazz = new Clazz();
    board.setClassNo(clazz.getClassNo());
    boardService.add(board);
    return "redirect:/app/room/board/"; //
  }


}


