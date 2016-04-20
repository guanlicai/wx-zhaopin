package com.${projectName}.admin.${moduleName}.controller;

import java.util.Date;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.${projectName}.base.hibernate.helper.Page;
import com.${projectName}.common.utils.controller.BaseController;
import com.${projectName}.common.utils.json.JsonUtils;
import com.${projectName}.common.utils.string.ExStringUtils;
import com.${projectName}.module.${moduleName}.${className};
import com.${projectName}.service.${moduleName}.${className}Service;

/**
 * ${desc}Controller
 * 
 * @author ${author}
 * @date ${date}
 *
 */
@Controller
public class ${className}Controller extends BaseController{

	Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private ${className}Service ${fileName}Service;
	
	@RequestMapping("/${moduleName}/${fileName}/list.html")
	public String list(Page objPage, HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, Object> condition = new HashMap<String,Object>();
		
		try{
			Page page = ${fileName}Service.findPageByCondition(condition, objPage);
		
			request.setAttribute("condition", condition);
			request.setAttribute("page", page);
		}
		catch(Exception e){
			logger.error("进入列表页面出错了/${moduleName}/${fileName}/list.html", e.fillInStackTrace());
		}
		
		
		return "/${moduleName}/${fileName}_list";
	}
	
	@RequestMapping("/${moduleName}/${fileName}/edit.html")
	public String editPage(Integer id, HttpServletRequest request, HttpServletResponse response) {
		
		${className} ${fileName} = new ${className}();
		
		
		if (id != null && id > 0) {
			${fileName} =  ${fileName}Service.get(id);
		}
		
		request.setAttribute("${fileName}", ${fileName});
		
		return "/${moduleName}/${fileName}_edit";
	}
	
	@RequestMapping("/${moduleName}/${fileName}/save.html")
	public void save(${className} ${fileName},HttpServletRequest request, HttpServletResponse response) {
		
		try{
			if(${fileName}.getId() == null){
				${fileName}Service.save(${fileName});
			}
			else{
				${fileName}Service.update(${fileName});
			}
			
			result.put("status", "success");
			result.put("url", "/${moduleName}/${fileName}/list.html");
		}
		catch(Exception e){
		
			result.put("status", "error");
			result.put("msg", "保存失败，请稍候重试");
		
			logger.error("保存出错了/${moduleName}/${fileName}/save.html", e.fillInStackTrace());
		}
		
		renderJson(response,JsonUtils.mapToJson(result));
	}
	
	@RequestMapping("/${moduleName}/${fileName}/delete.html")
	public void delete(String ids,HttpServletRequest request, HttpServletResponse response) {
		
		try{
			if(ExStringUtils.isNotEmpty(ids)){
				${fileName}Service.deleteByIds(ids);
			}
			
			result.put("status", "success");
			result.put("url", "/${moduleName}/${fileName}/list.html");
			result.put("msg", "删除成功");
		}
		catch(Exception e){
			result.put("status", "error");
			result.put("msg", "删除失败，请稍候重试");
			
			logger.error("保存出错了/${moduleName}/${fileName}/delete.html", e.fillInStackTrace());
		}
		
		renderJson(response,JsonUtils.mapToJson(result));
	}

}