package egovframework.example.sample.service;

import java.util.Date;

public class memberVO {
	private String u_id;
	private String password;
	private String name;
	private String email;
	private String address;
	private String phone;
	private Date regdate;
	private String domain;
	private String dAddress;
	private String zip_code;


	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getdAddress() {
		return dAddress;
	}
	public void setdAddress(String dAddress) {
		this.dAddress = dAddress;
	}
	@Override
	public String toString() {
		return "memberVO [u_id=" + u_id + ", password=" + password + ", name=" + name + ", email=" + email
				+ ", address=" + address + ", phone=" + phone + ", regdate=" + regdate + ", domain=" + domain
				+ ", dAddress=" + dAddress + ", zip_code=" + zip_code + "]";
	}





}
