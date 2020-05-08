package Team.project.web;

import java.io.File;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import Team.project.domain.ClazzMember;
import Team.project.domain.Post;
import Team.project.service.BoardService;
import Team.project.service.PostService;

@Controller
@RequestMapping("/room/post")
public class PostController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  BoardService boardService;

  @Autowired
  PostService postService;

  @RequestMapping("list")
  public String list(int bno, Model model) throws Exception {
    model.addAttribute("posts", postService.list(bno));
    model.addAttribute("boardNo", bno);
    return "/WEB-INF/jsp/post/list.jsp";
  }

  @GetMapping("form")
  public String form(String bno, Model model) throws Exception {
    System.out.println("================>" + bno);
    model.addAttribute("boardNo", bno);
    return "/WEB-INF/jsp/post/form.jsp";
  }

  @PostMapping("add")
  public String add(HttpSession session, Post post, MultipartFile partFile, Model model)
      throws Exception {

    ClazzMember member = (ClazzMember) session.getAttribute("nowMember");
    int memberNo = member.getMemberNo();
    System.out.println("memberNo========>" + memberNo);
    post.setMemberNo(memberNo);

    if (partFile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/post");
      String originalName = partFile.getOriginalFilename();
      System.out.println("origianlName=============>" + originalName);
      // String extention = originalName.substring(originalName.lastIndexOf(".") + 1);
      partFile.transferTo(new File(dirPath + "/" + originalName));
      post.setFile(originalName);
    }
    postService.add(post);
    model.addAttribute("bno", post.getBoardNo());
    return "redirect:list";
  }

  @GetMapping("detail") // postNo가 넘어온다. => detail.jsp
  public String detail(Model model, int no) throws Exception {
    model.addAttribute("post", postService.get(no));
    return "/WEB-INF/jsp/post/detail.jsp";
  }

  @PostMapping("update")
  public String update(Post post, HttpSession session, MultipartFile partFile, Model model)
      throws Exception {

    postService.update(post);
    model.addAttribute("bno", post.getBoardNo());
    return "redirect:list";
  }

  @GetMapping("delete")
  public String delete(int no, int bno, Model model) throws Exception {

    postService.delete(no);
    model.addAttribute("bno", bno);

    return "redirect:list";
  }
}


