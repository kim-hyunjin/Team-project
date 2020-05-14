package Team.project.web;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import Team.project.domain.FileVO;
import Team.project.service.FileService;

@Controller
public class DownloadController {
  @Autowired
  FileService fileService;

  @RequestMapping("/room/download")
  public void download(String fileId, HttpServletResponse response) throws Exception {
    FileVO fileVO = fileService.get(fileId);
    // 해당 파일이 존재하는 경우 response에 파일을 담아 보낸다.
    if (fileVO != null) {
      File file = new File(fileVO.getPath() + "/" + fileVO.getFileId());
      response.setContentType("application/octet-stream");
      response.setContentLengthLong(fileVO.getFileSize());
      response.setHeader("Content-Disposition",
          "attachment; filename=\"" + URLEncoder.encode(fileVO.getOriginalName(), "UTF-8") + "\"");
      response.setHeader("Content-Transfer-Encoding", "binary");
      FileInputStream fis = new FileInputStream(file);

      IOUtils.copy(fis, response.getOutputStream());

      IOUtils.closeQuietly(fis);
    } else {
      // 파일이 없는 경우 204
      response.setStatus(204);
    }
  }
}
