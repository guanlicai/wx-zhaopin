package com.${projectName}.service.${moduleName};

import java.util.Map;

import com.${projectName}.base.exception.ServiceException;
import com.${projectName}.base.hibernate.helper.Page;
import com.${projectName}.base.service.BaseService;
import com.${projectName}.module.${moduleName}.${className};

/**
 * ${desc} 接口定义
 * 
 * @author ${author}
 * @date ${date}
 *
 */
public interface ${className}Service extends BaseService<${className}>{

	/**
	 * 根据条件查找分页记录
	 * 
	 * @param condition
	 * @return
	 * @throws ServiceException
	 */
	Page findPageByCondition(Map<String, Object> condition, Page page) throws ServiceException;
	
	/**
	 * 根据主键删除
	 * @param ids
	 * @throws ServiceException
	 */
	void deleteByIds(String ids) throws ServiceException;
}