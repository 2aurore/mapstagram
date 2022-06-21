package com.treatTrip.app.board.vo;

public class BoardReplyVO {
	private int reply_num;
	private int board_num;
	private String reply_memberid;
	private String reply_contents;
	private String reply_date;

	public BoardReplyVO() {;}
	
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getReply_memberId() {
		return reply_memberid;
	}
	public void setReply_memberId(String reply_memberId) {
		this.reply_memberid = reply_memberId;
	}
	public String getReply_contents() {
		return reply_contents;
	}
	public void setReply_contents(String reply_contents) {
		this.reply_contents = reply_contents;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
}
