package Team.project.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import Team.project.domain.ClazzMember;
import Team.project.domain.PageMaker;
import Team.project.domain.Post;
import Team.project.service.BoardService;
import Team.project.service.FileService;
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

  @Autowired
  FileService fileService;


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
      String fileId = UUID.randomUUID().toString();
      fileService.add(partFile, fileId, dirPath);
      post.setFile(fileId);
    }
    postService.add(post);
    model.addAttribute("bno", post.getBoardNo());
    model.addAttribute("bTitle", boardService.get(post.getBoardNo()).getTitle());
    return "redirect:list";
  }


  @GetMapping("detail") // postNo가 넘어온다. => detail.jsp
  public String detail(HttpSession session, Model model, int no) throws Exception {

    ClazzMember member = (ClazzMember) session.getAttribute("nowMember");
    int cmNo = member.getMemberNo();

    model.addAttribute("classMember", cmNo);
    System.out.println("memberNo========>" + cmNo);

    session.getAttribute(Integer.toString(cmNo));
    Post post = postService.get(no);
    String fileId = post.getFile();
    model.addAttribute("file", fileService.get(fileId));
    model.addAttribute("post", post);
    return "/WEB-INF/jsp/post/detail.jsp";
  }

  //////////////////////////////////////////////////////////////////////

  @PostMapping("update")
  public String update(Post post, HttpSession session, MultipartFile partFile, Model model)
      throws Exception {

    if (partFile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/post");
      String fileId = UUID.randomUUID().toString();
      fileService.add(partFile, fileId, dirPath);
      String oldFile = post.getFile();
      if (oldFile != null) {
        File deleteFile = new File(dirPath + "/" + oldFile);
        deleteFile.deleteOnExit();
        fileService.delete(oldFile);
      }
      post.setFile(fileId);
    }

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

  @RequestMapping("list")
  public String list(@RequestParam(value = "page", defaultValue = "1") int page, int bno,
      Model model, String bTitle) throws Exception {
    System.out.println("pageNum=====>" + page);
    System.out.println("bno=======>" + bno);
    System.out.println("bTitle=======>" + bTitle);
    model.addAttribute("posts", postService.list(bno, page));
    int totalCount = postService.listCount(bno);
    model.addAttribute("pageMaker", new PageMaker(page, 10, totalCount));
    model.addAttribute("boardNo", bno);
    model.addAttribute("boardTitle", bTitle);

    System.out.println("=========================================>" + bTitle);
    return "/WEB-INF/jsp/post/list.jsp";
  }

  @GetMapping("search")
  public String search(int boardNo, String searchType, String keyword, Model model)
      throws Exception {


    HashMap<String, Object> map = new HashMap<>();
    List<Post> posts = null;
    if (searchType.equals("title")) {
      map.put("type", "title");
    }
    if (searchType.equals("content")) {
      map.put("type", "content");
    }
    if (searchType.equals("name")) {
      map.put("type", "name");
    }

    map.put("keyword", keyword);
    map.put("boardNo", boardNo);
    posts = postService.search(map);

    model.addAttribute("posts", posts);
    int totalCount = posts.size();
    model.addAttribute("pageMaker", new PageMaker(1, 10, totalCount));
    model.addAttribute("boardNo", posts.get(0).getBoardNo());
    model.addAttribute("boardTitle", posts.get(0).getBoard().getTitle());

    return "/WEB-INF/jsp/post/list.jsp";
  }


}


