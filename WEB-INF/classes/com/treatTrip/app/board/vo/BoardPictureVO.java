package com.treatTrip.app.board.vo;

public class BoardPictureVO {
	private String picture_file;
	private int board_num;

	public BoardPictureVO() {;}
	
	public String getPicture_file() {
		return picture_file;
	}
	public void setPicture_file(String picture_file) {
		this.picture_file = picture_file;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
}
