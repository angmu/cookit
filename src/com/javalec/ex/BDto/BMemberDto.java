package com.javalec.ex.BDto;

import java.sql.Timestamp;

public class BMemberDto {
	public BMemberDto() {}
	public BMemberDto(String id,String pw,String name,String email,String addr_num,String address1,String address2,String phone1,String phone2,String phone3,Timestamp birth,String birthtype,String gender,String newsok,String smsok,String m_job,String marry,String h_computer,String h_movie,String h_music,String h_shopping,String h_game,String h_art,String h_baby,String h_cook,String h_interior,String h_leisure,String h_diet,String h_fashion,String m_level,Timestamp m_date,Timestamp u_date,int m_point) {
		this.id=id;
		this.pw=pw;
		this.name=name;
		this.email=email;
		this.addr_num=addr_num;
		this.address1=address1;
		this.address2=address2;
		this.phone1=phone1;
		this.phone2=phone2;
		this.phone3=phone3;
		this.birth=birth;
		this.birthtype=birthtype;
		this.gender=gender;
		this.newsok=newsok;
		this.smsok=smsok;
		this.m_job=m_job;
		this.marry=marry;
		this.h_computer=h_computer;
		this.h_movie=h_movie;
		this.h_music=h_music;
		this.h_shopping=h_shopping;
		this.h_game=h_game;
		this.h_art=h_art;
		this.h_baby=h_baby;
		this.h_cook=h_cook;
		this.h_interior=h_interior;
		this.h_leisure=h_leisure;
		this.h_diet=h_diet;
		this.h_fashion=h_fashion;
		this.m_level=m_level;
		this.m_date=m_date;
		this.u_date=u_date;
		this.m_point=m_point;
	}
	private String id,pw,name,email,addr_num,address1,address2,phone1,phone2,phone3,birthtype,gender,newsok,smsok,m_job,marry,h_computer,h_movie,h_music,h_shopping,h_game,h_art,h_baby,h_cook,h_interior,h_leisure,h_diet,h_fashion,m_level;
	private Timestamp birth,m_date,u_date;
	private int m_point;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
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
	public String getAddr_num() {
		return addr_num;
	}
	public void setAddr_num(String addr_num) {
		this.addr_num = addr_num;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getBirthtype() {
		return birthtype;
	}
	public void setBirthtype(String birthtype) {
		this.birthtype = birthtype;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNewsok() {
		return newsok;
	}
	public void setNewsok(String newsok) {
		this.newsok = newsok;
	}
	public String getSmsok() {
		return smsok;
	}
	public void setSmsok(String smsok) {
		this.smsok = smsok;
	}
	public String getM_job() {
		return m_job;
	}
	public void setM_job(String m_job) {
		this.m_job = m_job;
	}
	public String getMarry() {
		return marry;
	}
	public void setMarry(String marry) {
		this.marry = marry;
	}
	public String getH_computer() {
		return h_computer;
	}
	public void setH_computer(String h_computer) {
		this.h_computer = h_computer;
	}
	public String getH_movie() {
		return h_movie;
	}
	public void setH_movie(String h_movie) {
		this.h_movie = h_movie;
	}
	public String getH_music() {
		return h_music;
	}
	public void setH_music(String h_music) {
		this.h_music = h_music;
	}
	public String getH_shopping() {
		return h_shopping;
	}
	public void setH_shopping(String h_shopping) {
		this.h_shopping = h_shopping;
	}
	public String getH_game() {
		return h_game;
	}
	public void setH_game(String h_game) {
		this.h_game = h_game;
	}
	public String getH_art() {
		return h_art;
	}
	public void setH_art(String h_art) {
		this.h_art = h_art;
	}
	public String getH_baby() {
		return h_baby;
	}
	public void setH_baby(String h_baby) {
		this.h_baby = h_baby;
	}
	public String getH_cook() {
		return h_cook;
	}
	public void setH_cook(String h_cook) {
		this.h_cook = h_cook;
	}
	public String getH_interior() {
		return h_interior;
	}
	public void setH_interior(String h_interior) {
		this.h_interior = h_interior;
	}
	public String getH_leisure() {
		return h_leisure;
	}
	public void setH_leisure(String h_leisure) {
		this.h_leisure = h_leisure;
	}
	public String getH_diet() {
		return h_diet;
	}
	public void setH_diet(String h_diet) {
		this.h_diet = h_diet;
	}
	public String getH_fashion() {
		return h_fashion;
	}
	public void setH_fashion(String h_fashion) {
		this.h_fashion = h_fashion;
	}
	
	
	public String getM_level() {
		return m_level;
	}
	public void setM_level(String m_level) {
		this.m_level = m_level;
	}
	public Timestamp getBirth() {
		return birth;
	}
	public void setBirth(Timestamp birth) {
		this.birth = birth;
	}
	
	
	public Timestamp getM_date() {
		return m_date;
	}
	public void setM_date(Timestamp m_date) {
		this.m_date = m_date;
	}
	public Timestamp getU_date() {
		return u_date;
	}
	public void setU_date(Timestamp u_date) {
		this.u_date = u_date;
	}
	public int getM_point() {
		return m_point;
	}
	public void setM_point(int m_point) {
		this.m_point = m_point;
	}
	
	
	
}
