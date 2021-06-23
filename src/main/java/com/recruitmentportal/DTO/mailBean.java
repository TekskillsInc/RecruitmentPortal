 package com.recruitmentportal.DTO;

public class mailBean {
private static String mail_User;
private static String mail_password;
private static String mail_Host;
private static String mail_link;


public static String getMail_link() {
	return mail_link;
}
public static void setMail_link(String mail_link) {
	mailBean.mail_link = mail_link;
}
public static String getMail_Host() {
	return mail_Host;
}
public static void setMail_Host(String mail_Host) {
	mailBean.mail_Host = mail_Host;
}
public static String getMail_User() {
	return mail_User;
}
public static void setMail_User(String mail_User) {
	mailBean.mail_User = mail_User;
}
public static String getMail_password() {
	return mail_password;
}
public static void setMail_password(String mail_password) {
	mailBean.mail_password = mail_password;
}

}
