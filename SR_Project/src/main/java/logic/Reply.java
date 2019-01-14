package logic;

import java.util.Date;

public class Reply {
	private int reply_no;
	private int board_no;
	private String user_id;
	private String user_name;
	private String content;
	private Date regdate;
	private int ref;
	private int reflevel;
	
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getReflevel() {
		return reflevel;
	}
	public void setReflevel(int reflevel) {
		this.reflevel = reflevel;
	}
	@Override
	public String toString() {
		return "Reply [reply_no=" + reply_no + ", board_no=" + board_no + ", user_id=" + user_id + ", user_name="
				+ user_name + ", content=" + content + ", regdate=" + regdate + ", ref=" + ref + ", reflevel="
				+ reflevel + "]";
	}
	
	
}
