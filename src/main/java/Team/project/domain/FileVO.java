package Team.project.domain;

public class FileVO {
  private String fileId;
  private String originalName;
  private String extension;
  private String path;
  private Long fileSize;

  public String getFileId() {
    return fileId;
  }

  public void setFileId(String fileId) {
    this.fileId = fileId;
  }

  public String getOriginalName() {
    return originalName;
  }

  public void setOriginalName(String originalName) {
    this.originalName = originalName;
  }

  public String getExtension() {
    return extension;
  }

  public void setExtension(String extension) {
    this.extension = extension;
  }

  public String getPath() {
    return path;
  }

  public void setPath(String path) {
    this.path = path;
  }

  public Long getFileSize() {
    return fileSize;
  }

  public void setFileSize(Long fileSize) {
    this.fileSize = fileSize;
  }

  @Override
  public String toString() {
    return "FileVO [fileId=" + fileId + ", originalName=" + originalName + ", extension="
        + extension + ", path=" + path + "]";
  }



}
