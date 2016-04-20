package com.shop.admin.weixin.controller;

public class Column {

	private String name;	//字段名称
	
	private String code;	//字段编码
	
	private String variableName;	//生成实体变量名称
	
	private String dataType;//字段类型
	
	private String require;//是否必填
	
	private Integer length;	//字段长度
	
	private String comment;	//字段注释
	
	private String isNumber;	//是否数字类型
	
	private String isString;	//是否字符串类型
	
	private String isDate;	//是否日期类型

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

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public Integer getLength() {
		return length;
	}

	public void setLength(Integer length) {
		this.length = length;
	}

	public String getVariableName() {
		return variableName;
	}

	public void setVariableName(String variableName) {
		this.variableName = variableName;
	}

	public String getRequire() {
		return require;
	}

	public void setRequire(String require) {
		this.require = require;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getIsNumber() {
		return isNumber;
	}

	public void setIsNumber(String isNumber) {
		this.isNumber = isNumber;
	}

	public String getIsString() {
		return isString;
	}

	public void setIsString(String isString) {
		this.isString = isString;
	}

	public String getIsDate() {
		return isDate;
	}

	public void setIsDate(String isDate) {
		this.isDate = isDate;
	}
	
	
}
