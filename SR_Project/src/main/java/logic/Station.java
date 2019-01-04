package logic;

public class Station {
	private int Station_no;
	private int number;
	private String station_id;
	private String name;
	private String gu;
	private String address;
	private int rackTotCnt;
	private String latitude;
	private String longtitude;
	
	public int getStation_no() {
		return Station_no;
	}
	public void setStation_no(int station_no) {
		Station_no = station_no;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getStation_id() {
		return station_id;
	}
	public void setStation_id(String station_id) {
		this.station_id = station_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getRackTotCnt() {
		return rackTotCnt;
	}
	public void setRackTotCnt(int rackTotCnt) {
		this.rackTotCnt = rackTotCnt;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongtitude() {
		return longtitude;
	}
	public void setLongtitude(String longtitude) {
		this.longtitude = longtitude;
	}
	@Override
	public String toString() {
		return "Station [Station_no=" + Station_no + ", number=" + number + ", station_id=" + station_id + ", name="
				+ name + ", gu=" + gu + ", address=" + address + ", rackTotCnt=" + rackTotCnt + ", latitude=" + latitude
				+ ", longtitude=" + longtitude + "]";
	}
	
}
