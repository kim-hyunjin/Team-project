package Team.project.web;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import Team.project.domain.Board;
import Team.project.domain.Clazz;
import Team.project.service.BoardService;
import Team.project.service.PostService;

@Controller
@RequestMapping("/room/board")
public class BoardController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  BoardService boardService;

  @Autowired
  PostService postService;

  // @RequestMapping("list")
  // public String boardList(HttpSession session, Model model, Board board, Clazz clazz)
  // throws Exception {
  // int roomNo = ((Clazz) session.getAttribute("clazzNow")).getClassNo();
  // model.addAttribute("list", boardService.list(roomNo));
  //
  // int boardNo = ((Board) session.getAttribute("bno")).getBoardNo();
  // Gson gson = new Gson();
  // if (boardNo == 1) {
  // List<Board> boardLists = boardService.list(boardNo);
  // model.addAttribute("boardList", gson.toJson(boardLists));
  //
  // List<Clazz> clazzLists = ClazzService.list(clazz.getClassNo());
  // model.addAttribute("clazzList", gson.toJson(clazzLists));
  //
  //
  // }
  //
  // return "/WEB-INF/jsp/board/list.jsp";
  // }

  // 이전 소스
  @RequestMapping("list")
  public String boardList(HttpSession session, Model model) throws Exception {
    int roomNo = ((Clazz) session.getAttribute("clazzNow")).getClassNo();
    model.addAttribute("list", boardService.list(roomNo));
    System.out.println("---------------------------------------->" + roomNo);

    return "/WEB-INF/jsp/board/list.jsp";
  }

  @GetMapping("form")
  public String form() {
    return "/WEB-INF/jsp/board/form.jsp";
  }

  @PostMapping("add")
  public String add(HttpSession session, Board board) throws Exception {
    Clazz clazz = (Clazz) session.getAttribute("clazzNow");
    board.setClassNo(clazz.getClassNo());
    System.out.println(board.toString());
    boardService.add(board);
    return "redirect:list"; //
  }

  @GetMapping("delete")
  public String delete(int no) throws Exception {
    if (boardService.delete(no) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("삭제할 게시판 번호가 유효하지 않습니다.");
    }
  }

  @RequestMapping("updateForm")
  public String updateForm(int no, Model model) throws Exception {
    model.addAttribute("board", boardService.get(no));
    return "/WEB-INF/jsp/board/updateForm.jsp";
  }

  @PostMapping("update")
  public String update(HttpSession session, Board board) throws Exception {
    boardService.update(board);
    return "redirect:list";
  }



}


