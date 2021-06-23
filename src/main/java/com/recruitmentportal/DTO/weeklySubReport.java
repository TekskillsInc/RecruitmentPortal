package com.recruitmentportal.DTO;

import java.sql.Date;

public class weeklySubReport {

	private Date fd;
	private Date ed;
	private Integer count;
	public Date getFd() {
		return fd;
	}
	public void setFd(Date fd) {
		this.fd = fd;
	}
	public Date getEd() {
		return ed;
	}
	public void setEd(Date ed) {
		this.ed = ed;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
}
