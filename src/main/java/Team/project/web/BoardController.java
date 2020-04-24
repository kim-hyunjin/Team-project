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

// @RequestMapping("form")
// public String form() {
// return "/WEB-INF/jsp/board/form.jsp";
// }

// @RequestMapping("add")
// public String add(Board board) throws Exception {
// if (boardService.add(board) > 0) {
// return "redirect:list"
// } else {
// throw new Exception("게시판을 추가할 수 없습니다.");
// }
// }

// @RequestMapping("delete")
// public String delete(int no) throws Exception {
// if (userService.delete(no) > 0) { // 삭제했다면,
// return "redirect:list";
// } else {
// throw new Exception("해당 번호의 회원이 없습니다.");
// }
// }



// @RequestMapping("search")
// public String search(String keyword, Model model) throws Exception {
// model.addAttribute("users", userService.search(keyword));
// return "/WEB-INF/jsp/user/search.jsp";
// }
//
// @RequestMapping("update")
// public String update(HttpSession session, User user, MultipartFile photo) throws Exception {
// if (photo.getSize() > 0) {
// String dirPath = servletContext.getRealPath("/upload/user");
// String filename = UUID.randomUUID().toString();
// photo.transferTo(new File(dirPath + "/" + filename));
// Thumbnails.of(dirPath + "/" + filename).size(160, 160).outputFormat("jpg")
// .toFiles(Rename.PREFIX_DOT_THUMBNAIL);
// user.setProfilePhoto(filename);
// }
//
// if (userService.update(user) > 0) {
// session.removeAttribute("loginUser");
// session.setAttribute("loginUser", user);
// return "redirect:../clazz/list";
// } else {
// throw new Exception("유저 정보 변경에 실패했습니다.");
// }
// }


