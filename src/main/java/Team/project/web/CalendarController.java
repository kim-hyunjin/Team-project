package Team.project.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import Team.project.service.ClazzMemberService;
import Team.project.service.ClazzService;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

  @Autowired
  ClazzService clazzService;
  @Autowired
  ClazzMemberService clazzMemberService;

  

  @GetMapping("calendar")
  public String calendar() {
    return "/WEB-INF/jsp/calendar/calendar.jsp";
  }
  
 
  
}
