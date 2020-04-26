package Team.project.web;

import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

  @RequestMapping("/room/board/")
  public String boardList() throws Exception {
    return "/WEB-INF/jsp/post/list.jsp";
  }



}


