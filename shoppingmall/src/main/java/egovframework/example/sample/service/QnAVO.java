package egovframework.example.sample.service;

import java.util.Date;

public class QnAVO {
	private int qseq;
	private int prodnum;
	private String u_id;
	private String title;
	private String content;
	private String reply;
	private int rep;
	private Date indate;
	private String name;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQseq() {
		return qseq;
	}
	public void setQseq(int qseq) {
		this.qseq = qseq;
	}
	public int getProdnum() {
		return prodnum;
	}
	public void setProdnum(int prodnum) {
		this.prodnum = prodnum;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public int getRep() {
		return rep;
	}
	public void setRep(int rep) {
		this.rep = rep;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	@Override
	public String toString() {
		return "QnAVO [qseq=" + qseq + ", prodnum=" + prodnum + ", u_id=" + u_id + ", title=" + title + ", content="
				+ content + ", reply=" + reply + ", rep=" + rep + ", indate=" + indate + "]";
	}




}
