package com.${projectName}.service.${moduleName}.impl;

import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.${projectName}.base.exception.ServiceException;
import com.${projectName}.base.hibernate.helper.Page;
import com.${projectName}.base.service.impl.BaseServiceImpl;
import com.${projectName}.common.utils.string.ExStringUtils;
import com.${projectName}.module.${moduleName}.${className};
import com.${projectName}.service.${moduleName}.${className}Service;



@Service(value="${fileName}Service")
@Transactional
public class ${className}ServiceImpl extends BaseServiceImpl<${className}> implements ${className}Service{
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public Page findPageByCondition(Map<String, Object> condition, Page page)
			throws ServiceException {
		
		DetachedCriteria criteria = DetachedCriteria.forClass(${className}.class);
		
		
		if(condition.get("isDeleted") != null){
			criteria.add(Restrictions.eq("isDeleted", condition.get("isDeleted")));
		}
		else{
			criteria.add(Restrictions.eq("isDeleted", 0));
		}
		
		return findPageByCriteria(criteria, page);
	}

	@Override
	public void deleteByIds(String ids) throws ServiceException {
		
		String[] items = ids.split(",");
		
		for(String id : items){
			${className} ${fileName} = super.get(ExStringUtils.parseInt(id));
			${fileName}.setIsDeleted(new Integer(1));
			
			super.update(${fileName});
		}
	}
	
	
	
}
