package Team.project.service.impl;

import java.io.File;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import Team.project.dao.FileDao;
import Team.project.domain.FileVO;
import Team.project.service.FileService;

@Component
public class FileServiceImpl implements FileService {
  @Autowired
  ServletContext servletContext;
  @Autowired
  FileDao fileDao;

  @Override
  public int add(MultipartFile partfile, String fileId, String path) throws Exception {
    // 멀티파트 파일을 받아 파일 정보를 얻고, 경로에 파일을 저장한다.
    String originalName = partfile.getOriginalFilename();
    String extension = originalName.substring(originalName.lastIndexOf(".") + 1);
    long fileSize = partfile.getSize();
    partfile.transferTo(new File(path + "/" + fileId));

    // 파일 ValueObject(domain)에 파일 정보를 담아 insert한다.
    FileVO fileVO = new FileVO();
    fileVO.setFileId(fileId);
    fileVO.setOriginalName(originalName);
    fileVO.setExtension(extension);
    fileVO.setPath(path);
    fileVO.setFileSize(fileSize);
    return fileDao.insert(fileVO);
  }

  @Override
  public int update(FileVO fileVO) throws Exception {
    return fileDao.update(fileVO);
  }

  @Override
  public int delete(String fileId) throws Exception {
    return fileDao.delete(fileId);
  }

  @Override
  public FileVO get(String fileId) throws Exception {
    return fileDao.findById(fileId);
  }

}
