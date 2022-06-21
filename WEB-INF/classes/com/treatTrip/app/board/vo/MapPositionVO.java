package com.treatTrip.app.board.vo;

public class MapPositionVO {
	private int position_serial;
	private double lat;		//위도
	private double lng;		//경도
	private String juso_1;	//도로명
	private String juso_2;	//지번
	
	public MapPositionVO() {;}
	
	public int getPosition_serial() {
		return position_serial;
	}
	public void setPosition_serial(int position_serial) {
		this.position_serial = position_serial;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public String getJuso_1() {
		return juso_1;
	}
	public void setJuso_1(String juso_1) {
		this.juso_1 = juso_1;
	}
	public String getJuso_2() {
		return juso_2;
	}
	public void setJuso_2(String juso_2) {
		this.juso_2 = juso_2;
	}
	
}
