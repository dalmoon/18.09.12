package com.test.dvo;

import java.sql.Date;

public class CCodemngVO {
	
	private String cdno;
	private int cdlvl;
	private String upcd;
	private String cdname;
	private String insuser;
	private Date insdate;
	private String useyn;
	
	public String getCdno() {
		return cdno;
	}
	public void setCdno(String cdno) {
		this.cdno = cdno;
	}
	public int getCdlvl() {
		return cdlvl;
	}
	public void setCdlvl(int cdlvl) {
		this.cdlvl = cdlvl;
	}
	public String getUpcd() {
		return upcd;
	}
	public void setUpcd(String upcd) {
		this.upcd = upcd;
	}
	public String getCdname() {
		return cdname;
	}
	public void setCdname(String cdname) {
		this.cdname = cdname;
	}
	public String getInsuser() {
		return insuser;
	}
	public void setInsuser(String insuser) {
		this.insuser = insuser;
	}
	public Date getInsdate() {
		return insdate;
	}
	public void setInsdate(Date insdate) {
		this.insdate = insdate;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	
}
