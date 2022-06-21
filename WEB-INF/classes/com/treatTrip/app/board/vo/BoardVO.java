package com.treatTrip.app.board.vo;

public class BoardVO {
	private String member_id;
	private int board_num;
	private String board_title;
	private String board_contents;
	private String board_hidden;
	private String board_date;
	private int board_cnt;
	private int board_heart_cnt;
	private int position_serial;
	
	public BoardVO() {;}
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_contents() {
		return board_contents;
	}
	public void setBoard_contents(String board_contents) {
		this.board_contents = board_contents;
	}
	public String getBoard_hidden() {
		return board_hidden;
	}
	public void setBoard_hidden(String board_hidden) {
		this.board_hidden = board_hidden;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public int getBoard_cnt() {
		return board_cnt;
	}
	public void setBoard_cnt(int board_cnt) {
		this.board_cnt = board_cnt;
	}
	public int getBoard_heart_cnt() {
		return board_heart_cnt;
	}
	public void setBoard_heart_cnt(int board_heart_cnt) {
		this.board_heart_cnt = board_heart_cnt;
	}
	public int getPosition_serial() {
		return position_serial;
	}
	public void setPosition_serial(int position_serial) {
		this.position_serial = position_serial;
	}
	
}
