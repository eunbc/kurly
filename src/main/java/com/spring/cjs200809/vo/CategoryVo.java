package com.spring.cjs200809.vo;

public class CategoryVo {
	private String cCODE;
	private String cNAME;
	public String getcCODE() {
		return cCODE;
	}
	public void setcCODE(String cCODE) {
		this.cCODE = cCODE;
	}
	public String getcNAME() {
		return cNAME;
	}
	public void setcNAME(String cNAME) {
		this.cNAME = cNAME;
	}
	@Override
	public String toString() {
		return "CategoryVo [cCODE=" + cCODE + ", cNAME=" + cNAME + "]";
	}
	
	
}
