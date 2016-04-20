package com.shop.admin.weixin.controller;

import java.util.List;

public class Table {

	public String name;	//表名称
	public String code;	//表编码 　模板名_表名称
	
	public List<Column> cols;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public List<Column> getCols() {
		return cols;
	}
	public void setCols(List<Column> cols) {
		this.cols = cols;
	}
	
}
