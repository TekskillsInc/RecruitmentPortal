package com.recruitmentportal.DTO;

public class ManagerReport {
private int userid;
private int mgr_ttlReq;
private int mgr_ttlSub;
private int mgr_ttlOnbrd;
private String mgr_name;

public String getMgr_name() {
	return mgr_name;
}
public void setMgr_name(String mgr_name) {
	this.mgr_name = mgr_name;
}
public int getUserid() {
	return userid;
}
public void setUserid(int userid) {
	this.userid = userid;
}
public int getMgr_ttlReq() {
	return mgr_ttlReq;
}
public void setMgr_ttlReq(int mgr_ttlReq) {
	this.mgr_ttlReq = mgr_ttlReq;
}
public int getMgr_ttlSub() {
	return mgr_ttlSub;
}
public void setMgr_ttlSub(int mgr_ttlSub) {
	this.mgr_ttlSub = mgr_ttlSub;
}
public int getMgr_ttlOnbrd() {
	return mgr_ttlOnbrd;
}
public void setMgr_ttlOnbrd(int mgr_ttlOnbrd) {
	this.mgr_ttlOnbrd = mgr_ttlOnbrd;
}
}
