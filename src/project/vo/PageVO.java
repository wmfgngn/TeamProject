package project.vo;

public class PageVO {
	private int totalRecord = 0; // BbsDAO.getTotalCount();	// 총 게시물 수 (1)
	private int numPerPage = 10;	// 한 페이지당 보여지는 게시물 수 (2)
	private int totalPage = 0; //(int)(Math.ceil((double)totalRecord/numPerPage));		// 전체 페이지 수 (3)
	private int nowPage = 1;		// cPage(현재 페이지값) 
	private int pagePerBlock = 3;	// 페이지 묶음 (5)
	private int begin, end;			// 각 페이지별 처음 ~ 끝 게시물 rownum
	private int startPage, endPage;	/* 페이지 Block별 처음 ~ 끝 페이지 번호
							 * startPage가 pagePerBlock보다 작을 때는 이전버튼 비활성화
							 * endPage가 totalPage보다 작을 때만 다음버튼 활성화			*/
	
	// constructor --------------------------------------------------------------------------------
	public PageVO() { }
	public PageVO(int numPerPage, int pagePerBlock) {
		super();
		this.numPerPage = numPerPage;
		this.pagePerBlock = pagePerBlock;
	}
	
	// getter setter ------------------------------------------------------------------------------
	public int getTotalRecord() { return totalRecord; }
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		this.totalPage = (int)(Math.ceil((double)totalRecord/numPerPage));
	}
	public int getNumPerPage() { return numPerPage; }
	public void setNumPerPage(int numPerPage) { this.numPerPage = numPerPage; }
	public int getTotalPage() { return totalPage; }
	public void setTotalPage(int totalPage) { this.totalPage = totalPage; }
	public int getNowPage() { return nowPage; }
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		if(nowPage > totalPage) {
			this.nowPage = totalPage;
		}
		
		// 각 페이지의 게시물 리스트 선별을 위한 범위 (begin, end) 초기화 (6)
		begin = (this.nowPage-1)*numPerPage + 1;
		end = begin+numPerPage-1;
		
		// 페이지 Block의 처음과 끝 페이지 (startPage, endPage) 초기화 (7)
		startPage = (((this.nowPage-1)/pagePerBlock)*pagePerBlock) + 1;
		if(startPage < 1) {
			startPage = 1;		
		}
		endPage = startPage + pagePerBlock - 1;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
	}
	public int getPagePerBlock() { return pagePerBlock; }
	public void setPagePerBlock(int pagePerBlock) { this.pagePerBlock = pagePerBlock; }
	public int getBegin() { return begin; }
	public void setBegin(int begin) { this.begin = begin; }
	public int getEnd() { return end; }
	public void setEnd(int end) { this.end = end; }
	public int getStartPage() { return startPage; }
	public void setStartPage(int startPage) { this.startPage = startPage; }
	public int getEndPage() { return endPage; }
	public void setEndPage(int endPage) { this.endPage = endPage; }

}
