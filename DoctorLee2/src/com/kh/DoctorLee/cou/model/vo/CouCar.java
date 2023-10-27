package com.kh.DoctorLee.cou.model.vo;

public class CouCar {
	
	private int carNo;
	private int couNo;
	private String carContent;
	
	public CouCar() {
		super();
	}

	public CouCar(int carNo, int couNo, String carContent) {
		super();
		this.carNo = carNo;
		this.couNo = couNo;
		this.carContent = carContent;
	}

	public int getCarNo() {
		return carNo;
	}

	public void setCarNo(int carNo) {
		this.carNo = carNo;
	}

	public int getCouNo() {
		return couNo;
	}

	public void setCouNo(int couNo) {
		this.couNo = couNo;
	}

	public String getCarContent() {
		return carContent;
	}

	public void setCarContent(String carContent) {
		this.carContent = carContent;
	}

	@Override
	public String toString() {
		return "CouCar [carNo=" + carNo + ", couNo=" + couNo + ", carContent=" + carContent + "]";
	}
	
}
