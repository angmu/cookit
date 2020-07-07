package com.javalec.ex.BDto;

import java.sql.Timestamp;

public class BDto {
	public BDto(){}
	
	//출력시 사용
	public BDto(String bId,String bName,String bTitle,String bType,String bContent,String bFile1,String bFile2,Timestamp bDate,Timestamp uDate,Timestamp start_date,Timestamp end_date,int bHit,int bGroup,int bStep,int bIndent,int bNum){
		this.bId=bId;
		this.bName=bName;
		this.bTitle=bTitle;
		this.bType=bType;
		this.bContent=bContent;
		this.bFile1=bFile1;
		this.bFile2=bFile2;
		this.bDate=bDate;
		this.uDate=uDate;
		this.start_date=start_date;
		this.end_date=end_date;
		this.bHit=bHit;
		this.bGroup=bGroup;
		this.bStep=bStep;
		this.bIndent=bIndent;
		this.bNum=bNum;
	}
	private String bId,bName,bTitle,bType,bContent,bFile1,bFile2;
	private Timestamp bDate,uDate,start_date,end_date;
	private int bHit,bGroup,bIndent,bStep,bNum;
	public String getbId() {
		return bId;
	}

	public void setbId(String bId) {
		this.bId = bId;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	
	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbFile1() {
		return bFile1;
	}

	public void setbFile1(String bFile1) {
		this.bFile1 = bFile1;
	}

	public String getbFile2() {
		return bFile2;
	}

	public void setbFile2(String bFile2) {
		this.bFile2 = bFile2;
	}

	public Timestamp getbDate() {
		return bDate;
	}

	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}

	public Timestamp getuDate() {
		return uDate;
	}

	public void setuDate(Timestamp uDate) {
		this.uDate = uDate;
	}
	
	public Timestamp getStart_date() {
		return start_date;
	}

	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}

	public Timestamp getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Timestamp end_date) {
		this.end_date = end_date;
	}

	public int getbHit() {
		return bHit;
	}

	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	
	public int getbGroup() {
		return bGroup;
	}

	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}


	public int getbStep() {
		return bStep;
	}

	public void setbStep(int bStep) {
		this.bStep = bStep;
	}
	public int getbIndent() {
		return bIndent;
	}

	public void setbIndent(int bIndent) {
		this.bIndent = bIndent;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	
	
}
