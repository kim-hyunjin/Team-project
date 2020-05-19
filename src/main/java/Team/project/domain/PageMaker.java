package Team.project.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

  private int totalCount;
  private int startPage;
  private int endPage;
  private boolean prev;
  private boolean next;
  private int displayPageNum = 10;

  public PageMaker(int page, int perPageNum, int totalCount) {
    this.totalCount = totalCount;
    this.calcData(page, perPageNum);
  }

  public void calcData(int page, int perPageNum) {
    endPage = (int) (Math.ceil(page / (double) displayPageNum) * displayPageNum);
    startPage = (endPage - displayPageNum) + 1;

    int tempEndPage = (int) (Math.ceil(totalCount / (double) perPageNum));
    if (endPage > tempEndPage) {
      endPage = tempEndPage;
    }
    this.prev = startPage == 1 ? false : true;
    this.next = endPage * perPageNum >= totalCount ? false : true;
  }

  public String makeQuery(int page) {
    UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
        .queryParam("perPageNum", 10).build();

    return uriComponents.toUriString();
  }

  public int getTotalCount() {
    return totalCount;
  }

  public void setTotalCount(int totalCount) {
    this.totalCount = totalCount;
  }

  public int getStartPage() {
    return startPage;
  }

  public void setStartPage(int startPage) {
    this.startPage = startPage;
  }

  public int getEndPage() {
    return endPage;
  }

  public void setEndPage(int endPage) {
    this.endPage = endPage;
  }

  public boolean isPrev() {
    return prev;
  }

  public void setPrev(boolean prev) {
    this.prev = prev;
  }

  public boolean isNext() {
    return next;
  }

  public void setNext(boolean next) {
    this.next = next;
  }

  public int getDisplayPageNum() {
    return displayPageNum;
  }

  public void setDisplayPageNum(int displayPageNum) {
    this.displayPageNum = displayPageNum;
  }



}
