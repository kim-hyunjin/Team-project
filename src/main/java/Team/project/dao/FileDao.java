package Team.project.dao;

import Team.project.domain.FileVO;

public interface FileDao {

  public int insert(FileVO fileVO) throws Exception;

  public int update(FileVO fileVO) throws Exception;

  public int delete(String fileId) throws Exception;

  public FileVO findById(String fileId) throws Exception;

}


