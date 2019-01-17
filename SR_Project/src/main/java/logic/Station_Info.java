package logic;

public class Station_Info {
	
	int info_no;
	String month;
	int number;
	int m_use;
	int f_use;
	int nomember_use;
	int total_usetime;
	int age_10;
	int age_20;
	int age_30;
	int age_40;
	int age_50;
	int age_60;
	public int getInfo_no() {
		return info_no;
	}
	public void setInfo_no(int info_no) {
		this.info_no = info_no;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getM_use() {
		return m_use;
	}
	public void setM_use(int m_use) {
		this.m_use = m_use;
	}
	public int getF_use() {
		return f_use;
	}
	public void setF_use(int f_use) {
		this.f_use = f_use;
	}
	public int getNomember_use() {
		return nomember_use;
	}
	public void setNomember_use(int nomember_use) {
		this.nomember_use = nomember_use;
	}
	public int getTotal_usetime() {
		return total_usetime;
	}
	public void setTotal_usetime(int total_usetime) {
		this.total_usetime = total_usetime;
	}
	public int getAge_10() {
		return age_10;
	}
	public void setAge_10(int age_10) {
		this.age_10 = age_10;
	}
	public int getAge_20() {
		return age_20;
	}
	public void setAge_20(int age_20) {
		this.age_20 = age_20;
	}
	public int getAge_30() {
		return age_30;
	}
	public void setAge_30(int age_30) {
		this.age_30 = age_30;
	}
	public int getAge_40() {
		return age_40;
	}
	public void setAge_40(int age_40) {
		this.age_40 = age_40;
	}
	public int getAge_50() {
		return age_50;
	}
	public void setAge_50(int age_50) {
		this.age_50 = age_50;
	}
	public int getAge_60() {
		return age_60;
	}
	public void setAge_60(int age_60) {
		this.age_60 = age_60;
	}
	
	@Override
	public String toString() {
		return "Station_Info [info_no=" + info_no + ", month=" + month + ", number=" + number + ", m_use=" + m_use
				+ ", f_use=" + f_use + ", nomember_use=" + nomember_use + ", total_usetime=" + total_usetime
				+ ", age_10=" + age_10 + ", age_20=" + age_20 + ", age_30=" + age_30 + ", age_40=" + age_40
				+ ", age_50=" + age_50 + ", age_60=" + age_60 + "]";
	}
	
}
