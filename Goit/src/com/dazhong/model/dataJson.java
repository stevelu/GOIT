package com.dazhong.model;

import java.util.List;

public class dataJson {
	private String status;
	private String total_count;
	private String count;
	private List<businesses> businesses;
	public List<businesses> getBusinesses() {
		return businesses;
	}
	public void setBusinesses(List<businesses> businesses) {
		this.businesses = businesses;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTotal_count() {
		return total_count;
	}
	public void setTotal_count(String total_count) {
		this.total_count = total_count;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	

}
