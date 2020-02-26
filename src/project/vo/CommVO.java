package project.vo;

public class CommVO {
	private String c_idx, writer, content, pwd, write_date, ip, b_idx;
	
	// constructor --------------------------------------------------------------------------------
	public CommVO() { }
	public CommVO(String writer, String content, String pwd, String ip, String b_idx) {
		this.writer = writer;
		this.content = content;
		this.pwd = pwd;
		this.ip = ip;
		this.b_idx = b_idx;
	}

	// getter setter ------------------------------------------------------------------------------
	public String getC_idx() { return c_idx; }
	public void setC_idx(String c_idx) { this.c_idx = c_idx; }
	public String getWriter() { return writer; }
	public void setWriter(String writer) { this.writer = writer; }
	public String getContent() { return content; }
	public void setContent(String content) { this.content = content; }
	public String getPwd() { return pwd; }
	public void setPwd(String pwd) { this.pwd = pwd; }
	public String getWrite_date() { return write_date; }
	public void setWrite_date(String write_date) { this.write_date = write_date; }
	public String getIp() { return ip; }
	public void setIp(String ip) { this.ip = ip; }
	public String getB_idx() { return b_idx; }
	public void setB_idx(String b_idx) { this.b_idx = b_idx; }
}
