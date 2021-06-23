package com.recruitmentportal.controller;

public class HandlingException extends Exception{
	
	private static final long serialVersionUID = 1L;

	private String errCode;
	private String errMsg;
	private String errMsgContent;
	
	public String getErrCode() {
		return errCode;
	}

	public void setErrCode(String errCode) {
		this.errCode = errCode;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public HandlingException(String errCode, String errMsg, String errMsgContent) {
		this.errCode = errCode;
		this.errMsg = errMsg;
		this.errMsgContent = errMsgContent;
	}

	public String getErrMsgContent() {
		return errMsgContent;
	}

	public void setErrMsgContent(String errMsgContent) {
		this.errMsgContent = errMsgContent;
	}
	

}
