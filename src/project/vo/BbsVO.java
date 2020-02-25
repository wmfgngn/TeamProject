package project.vo;

import java.util.List;

public class BbsVO {

	private String type, b_idx, subject, writer, content, file_name, ori_name,
					pwd, write_date, ip, hit, status, recommend, kategorie;
	private List<CommVO> c_list;
	
	// constructor --------------------------------------------------------------------------------
	public BbsVO() { }
	public BbsVO(String b_idx, String subject, String writer, String content) {
		this.b_idx = b_idx;
		this.subject = subject;
		this.writer = writer;
		this.content = content;
	}
	public BbsVO(String subject, String writer, String content,
			String file_name, String ori_name, String pwd, String ip,
			String hit, String status, String recommend, String kategorie, String type) {
		this.subject = subject;
		this.writer = writer;
		this.content = content;
		this.file_name = file_name;
		this.ori_name = ori_name;
		this.pwd = pwd;
		this.ip = ip;
		this.hit = hit;
		this.status = status;
		this.recommend = recommend;
		this.kategorie = kategorie;
		this.type = type;
	}

	// getter setter ------------------------------------------------------------------------------
	public String getB_idx() { return b_idx; }
	public void setB_idx(String b_idx) { this.b_idx = b_idx; }
	public String getSubject() { return subject; }
	public void setSubject(String subject) { this.subject = subject; }
	public String getWriter() { return writer; }
	public void setWriter(String writer) { this.writer = writer; }
	public String getContent() { return content; }
	public void setContent(String content) { this.content = content; }
	public String getFile_name() { return file_name; }
	public void setFile_name(String file_name) { this.file_name = file_name; }
	public String getOri_name() { return ori_name; }
	public void setOri_name(String ori_name) { this.ori_name = ori_name; }
	public String getPwd() { return pwd; }
	public void setPwd(String pwd) { this.pwd = pwd; }
	public String getWrite_date() { return write_date; }
	public void setWrite_date(String write_date) { this.write_date = write_date; }
	public String getIp() { return ip; }
	public void setIp(String ip) { this.ip = ip; }
	public String getHit() { return hit; }
	public void setHit(String hit) { this.hit = hit; }
	public String getStatus() { return status; }
	public void setStatus(String status) { this.status = status; }
	public List<CommVO> getC_list() { return c_list; }
	public void setC_list(List<CommVO> c_list) { this.c_list = c_list; }
	public String getRecommend() { return recommend; }
	public void setRecommend(String recommend) { this.recommend = recommend; }
	public String getKategorie() { return kategorie; }
	public void setKategorie(String kategorie) { this.kategorie = kategorie; }
	public String getType() { return type; }
	public void setType(String type) { this.type = type; }
	
}
