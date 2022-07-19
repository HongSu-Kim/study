package com.naver;

public class NaverVO {

	private String id;
	private String pwd;
	private String name;
	private String year;
	private String month;
	private String day;
	private String email;
	private String tel;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getEmail() {

		if (email != "" || email != null)
			return "입력안함";
		
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getBirth() {
		
		String birth = year + "-";
		
		if (month.length() == 1)
			birth += "0";
		birth += month + "-";
		
		if (day.length() == 1)
			birth += "0";
		birth += day;
		
		return birth;
	}

	public String getTel_() {

		String tel_ = tel.substring(0,3) + "-" + tel.substring(3,7) + "-" + tel.substring(7);
		
		return tel_;
	}
	
	@Override
	public String toString() {
		
		String str =
				"id : " + id +
				"\npwd : " + pwd +
				"\nname : " + name +
				"\nymd : " + year + "년 " + month + "월 " + day + "일" +
				"\nbirth : " + getBirth() +
				"\nemail : " + getEmail() +
				"\ntel : " + tel +
				"\ntel_ : " + getTel_();
					
		return str;
	}
}
