package Team.project.service;

import org.springframework.web.multipart.MultipartFile;
import Team.project.domain.FileVO;

public interface FileService {
  int add(MultipartFile partfile, String fileId, String path) throws Exception;

  int update(FileVO fileVO) throws Exception;

  int delete(String fileId) throws Exception;

  FileVO get(String fileId) throws Exception;

}
