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
    model.addAttribute("boardNo", bno);

    return "/WEB-INF/jsp/post/form.jsp";
  }

  @PostMapping("add")
  public String add(HttpSession session, Post post, MultipartFile partFile, Model model)
      throws Exception {

    ClazzMember member = (ClazzMember) session.getAttribute("nowMember");
    post.setMemberNo(member.getMemberNo());

    if (partFile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/post");
      String fileId = UUID.randomUUID().toString();
      fileService.add(partFile, fileId, dirPath);
      post.setFile(fileId);
    }
    postService.add(post);
    return "redirect:list?boardNo="+post.getBoardNo();
  }


  @GetMapping("detail") 
  public String detail(HttpSession session, Model model, int postNo) throws Exception {
    model.addAttribute("classMember", ((ClazzMember)session.getAttribute("nowMember")).getMemberNo());
    Post post = postService.get(postNo);
    String fileId = post.getFile();
    model.addAttribute("file", fileService.get(fileId));
    model.addAttribute("post", post);

    return "/WEB-INF/jsp/post/detail.jsp";
  }


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
    return "redirect:list?boardNo="+post.getBoardNo();
  }

  @GetMapping("delete")
  public String delete(int no, int bno, Model model) throws Exception {

    postService.delete(no);
    model.addAttribute("boardNo", bno);

    return "redirect:list";
  }

  @RequestMapping("list")
  public String list(@RequestParam(value = "page", defaultValue = "1") int page, int boardNo,
      Model model) throws Exception {
    model.addAttribute("posts", postService.list(boardNo, page));
    int totalCount = postService.listCount(boardNo);
    model.addAttribute("pageMaker", new PageMaker(page, 10, totalCount));
    model.addAttribute("board", boardService.get(boardNo));
    return "/WEB-INF/jsp/post/list.jsp";
  }
  
  @RequestMapping("search")
  public String search(int boardNo, String searchType, String keyword, Model model) throws Exception {
	  if(keyword.length() == 0) {
		  return "redirect:list?boardNo="+boardNo;
	  }
	  HashMap<String, Object> params = new HashMap<>();
	  params.put("boardNo", boardNo);
	  params.put("type", searchType);
	  params.put("keyword", keyword);
	  List<Post> posts = postService.search(params);
	  model.addAttribute("pageMaker", new PageMaker(1, 10, posts.size()));
	  model.addAttribute("posts", posts);
	  model.addAttribute("board", boardService.get(boardNo));
	  return "/WEB-INF/jsp/post/list.jsp";
  }


}


