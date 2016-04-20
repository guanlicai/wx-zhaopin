package com.shop.admin.file.controller;

import java.util.Date;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.base.hibernate.helper.Page;
import com.shop.common.utils.controller.BaseController;
import com.shop.common.utils.json.JsonUtils;
import com.shop.common.utils.string.ExStringUtils;
import com.shop.module.file.Teacher;
import com.shop.service.file.TeacherService;

/**
 * 教师信息Controller
 * 
 * @author guanlc
 * @date 2016-03-08 21:03
 *
 */
@Controller
public class TeacherController extends BaseController{

	Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private TeacherService teacherService;
	
	@RequestMapping("/file/teacher/list.html")
	public String list(Page objPage, HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, Object> condition = new HashMap<String,Object>();
		
		try{
			Page page = teacherService.findPageByCondition(condition, objPage);
		
			request.setAttribute("condition", condition);
			request.setAttribute("page", page);
		}
		catch(Exception e){
			logger.error("进入列表页面出错了/file/teacher/list.html", e.fillInStackTrace());
		}
		
		
		return "/file/teacher_list";
	}
	
	@RequestMapping("/file/teacher/edit.html")
	public String editPage(Integer id, HttpServletRequest request, HttpServletResponse response) {
		
		Teacher teacher = new Teacher();
		
		
		if (id != null && id > 0) {
			teacher =  teacherService.get(id);
		}
		
		request.setAttribute("teacher", teacher);
		
		return "/file/teacher_edit";
	}
	
	@RequestMapping("/file/teacher/save.html")
	public void save(Teacher teacher,HttpServletRequest request, HttpServletResponse response) {
		
		try{
			if(teacher.getId() == null){
				teacherService.save(teacher);
			}
			else{
				teacherService.update(teacher);
			}
			
			result.put("status", "success");
			result.put("url", "/file/teacher/list.html");
		}
		catch(Exception e){
		
			result.put("status", "error");
			result.put("msg", "保存失败，请稍候重试");
		
			logger.error("保存出错了/file/teacher/save.html", e.fillInStackTrace());
		}
		
		renderJson(response,JsonUtils.mapToJson(result));
	}
	
	@RequestMapping("/file/teacher/delete.html")
	public void delete(String ids,HttpServletRequest request, HttpServletResponse response) {
		
		try{
			if(ExStringUtils.isNotEmpty(ids)){
				teacherService.deleteByIds(ids);
			}
			
			result.put("status", "success");
			result.put("url", "/file/teacher/list.html");
			result.put("msg", "删除成功");
		}
		catch(Exception e){
			result.put("status", "error");
			result.put("msg", "删除失败，请稍候重试");
			
			logger.error("保存出错了/file/teacher/delete.html", e.fillInStackTrace());
		}
		
		renderJson(response,JsonUtils.mapToJson(result));
	}

}