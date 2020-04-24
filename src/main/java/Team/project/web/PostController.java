package Team.project.web;

import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import Team.project.domain.Board;
import Team.project.service.BoardService;
import Team.project.service.PostService;

@Controller
@RequestMapping("/room/board/")
public class PostController {

  @Autowired
  ServletContext servletContext;
  @Autowired
  BoardService boardService;

  @Autowired
  PostService postService;

  @RequestMapping("list")
  public String list(int no, Model model) throws Exception {
    Board board = boardService.get(no);
    model.addAttribute("posts", postService.list(board.getBoardNo()));
    return "/WEB-INF/jsp/post/list.jsp";
  }

  // @RequestMapping("detail")
  // public String detail(int no, Model model) throws Exception {
  // model.addAttribute("postLists", postService.get(no));
  // return "/WEB-INF/jsp/post/detail.jsp";
  // }
}


