package logic;

import java.util.Date;

public class Board {
	private int board_no;
	private int number;
	private String user_id;
	private int type;
	private String title;
	private String user_name;
	private String content;
	private int readcnt;
	private Date regdate;
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "board [board_no=" + board_no + ", number=" + number + ", user_id=" + user_id + ", type=" + type
				+ ", title=" + title + ", user_name=" + user_name + ", content=" + content + ", readcnt=" + readcnt
				+ ", regdate=" + regdate + "]";
	}
	
}
