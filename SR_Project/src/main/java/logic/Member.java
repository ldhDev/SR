package logic;

public class Member {
	private String user_id;
	private String name;
	private String email;
	private String gender;
	private int age;
	private int bookmark1;
	private int bookmark2;
	private int bookmark3;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getBookmark1() {
		return bookmark1;
	}
	public void setBookmark1(int bookmark1) {
		this.bookmark1 = bookmark1;
	}
	public int getBookmark2() {
		return bookmark2;
	}
	public void setBookmark2(int bookmark2) {
		this.bookmark2 = bookmark2;
	}
	public int getBookmark3() {
		return bookmark3;
	}
	public void setBookmark3(int bookmark3) {
		this.bookmark3 = bookmark3;
	}
	@Override
	public String toString() {
		return "Member [user_id=" + user_id + ", name=" + name + ", email=" + email + ", gender=" + gender + ", age="
				+ age + ", bookmark1=" + bookmark1 + ", bookmark2=" + bookmark2 + ", bookmark3=" + bookmark3 + "]";
	}

	
	
}
