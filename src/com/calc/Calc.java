package com.calc;

public class Calc {

	private int su1;
	private int su2;
	private String oper;

	public int getSu1() {
		return su1;
	}

	public void setSu1(int su1) {
		this.su1 = su1;
	}

	public int getSu2() {
		return su2;
	}

	public void setSu2(int su2) {
		this.su2 = su2;
	}

	public String getOper() {
		return oper;
	}

	public void setOper(String oper) {
		this.oper = oper;
	}

	public String result() {

		String str = "";
		int sum = 0;

		if (oper != null) {
			if (oper.equals("+"))
				sum = su1 + su2;
			else if (oper.equals("-"))
				sum = su1 - su2;
			else if (oper.equals("*"))
				sum = su1 * su2;
			else if (oper.equals("/"))
				sum = su1 / su2;
		}

		str = String.format("%d %s %d = %d", su1, oper, su2, sum);

		return str;

	}

	public String result(int su1, int su2, String oper) {

		String str = "";
		int sum = 0;

		if (oper != null) {
			if (oper.equals("+"))
				sum = su1 + su2;
			else if (oper.equals("-"))
				sum = su1 - su2;
			else if (oper.equals("*"))
				sum = su1 * su2;
			else if (oper.equals("/"))
				sum = su1 / su2;
		}

		str = String.format("%d %s %d = %d", su1, oper, su2, sum);

		return str;

	}

}
