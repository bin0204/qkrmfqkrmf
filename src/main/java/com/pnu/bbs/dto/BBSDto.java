package com.pnu.bbs.dto;

public class BBSDto {

	private String gu;
	private String dong;
	private String result1;
	
	public BBSDto() {}
	
	public BBSDto(String gu, String dong, String result1) {
		super();
		this.gu = gu;
		this.dong = dong;
		this.result1 = result1;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getResult1() {
		return result1;
	}
	public void setResult1(String result1) {
		this.result1 = result1;
	}
}
