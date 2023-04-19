package egovframework.example.sample.service;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class productVO {
	private int prodnum;
	private String name;
	private String kind;
	private int price;
	private String content;
	private String image;
	private Date regdate;
	private MultipartFile uploadFile;

	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getProdnum() {
		return prodnum;
	}
	public void setProdnum(int prodnum) {
		this.prodnum = prodnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "productVO [prodnum=" + prodnum + ", name=" + name + ", kind=" + kind + ", price=" + price + ", content="
				+ content + ", image=" + image + ", regdate=" + regdate + ", uploadFile=" + uploadFile + "]";
	}



}
