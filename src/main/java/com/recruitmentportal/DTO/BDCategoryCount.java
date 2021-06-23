package com.recruitmentportal.DTO;

public class BDCategoryCount {
private String bdname;
private int ccount;
private int ftecount;
@Override
public String toString() {
	return "BDCategoryCount [bdname=" + bdname + ", ccount=" + ccount + ", ftecount=" + ftecount + "]";
}
public String getBdname() {
	return bdname;
}
public void setBdname(String bdname) {
	this.bdname = bdname;
}
public int getCcount() {
	return ccount;
}
public void setCcount(int ccount) {
	this.ccount = ccount;
}
public int getFtecount() {
	return ftecount;
}
public void setFtecount(int ftecount) {
	this.ftecount = ftecount;
}
}
