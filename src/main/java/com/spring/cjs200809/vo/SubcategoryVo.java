package com.spring.cjs200809.vo;

public class SubcategoryVo {
	private String scCODE;
	private String scNAME;
	private String cCODE;
	public String getScCODE() {
		return scCODE;
	}
	public void setScCODE(String scCODE) {
		this.scCODE = scCODE;
	}
	public String getScNAME() {
		return scNAME;
	}
	public void setScNAME(String scNAME) {
		this.scNAME = scNAME;
	}
	public String getcCODE() {
		return cCODE;
	}
	public void setcCODE(String cCODE) {
		this.cCODE = cCODE;
	}
	@Override
	public String toString() {
		return "SubcategoryVo [scCODE=" + scCODE + ", scNAME=" + scNAME + ", cCODE=" + cCODE + "]";
	}
	
	
}
