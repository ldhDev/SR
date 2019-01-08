package logic;

public class Station {
	private int call_no;
	private int number;
	private String station_id;
	private String name;
	private String gu;
	private String address;
	private int rack_totCnt;
	private String latitude;
	private String longitude;
	
	
	public int getCall_no() {
		return call_no;
	}
	public void setCall_no(int call_no) {
		this.call_no = call_no;
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
	public int getRack_totCnt() {
		return rack_totCnt;
	}
	public void setRack_totCnt(int rack_totCnt) {
		this.rack_totCnt = rack_totCnt;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	@Override
	public String toString() {
		return "Station [call_no=" + call_no + ", number=" + number + ", station_id=" + station_id + ", name=" + name
				+ ", gu=" + gu + ", address=" + address + ", rack_totCnt=" + rack_totCnt + ", latitude=" + latitude
				+ ", longitude=" + longitude + "]";
	}
	
	
	
	
}
