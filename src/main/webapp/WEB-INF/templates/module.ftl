package com.${projectName}.module.${moduleName};

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.${projectName}.base.hibernate.model.BaseModel;

/**
 * ${desc}
 * 
 * @author guanlc
 */
@Entity
@Table(name = "${tableName}")
public class ${className} extends BaseModel implements Serializable {

	private static final long serialVersionUID = 1L;

	<#list columnList as column>
	<#if column.isNumber == 'true'>
	<#assign varType="Integer">
	<#elseif column.isDate == 'true'>
	<#assign varType="Date">
	<#else>
	<#assign varType="String">
	</#if>
	<#if column.variableName != 'id' && column.variableName != 'isDeleted' && column.variableName != 'version'>
	
	@Column(name = "${column.code}")
	private ${varType} ${column.variableName};   //${column.comment}
	</#if>
	</#list>
	
	<#list columnList as column>
	<#if column.isNumber == 'true'>
	<#assign varType="Integer">
	<#elseif column.isDate == 'true'>
	<#assign varType="Date">
	<#else>
	<#assign varType="String">
	</#if>
	
	<#assign varName="${column.variableName}">
	<#if column.variableName != 'id' && column.variableName != 'isDeleted' && column.variableName != 'version'>
	public ${varType} get${varName?cap_first}() {
		return ${varName};
	}
	public void set${varName?cap_first}(${varType} ${column.variableName}) {
		this.${column.variableName} = ${column.variableName};
	}
	</#if>
	</#list>

	@Override
	public Integer getId() {
		return super.getId();
	}
}
