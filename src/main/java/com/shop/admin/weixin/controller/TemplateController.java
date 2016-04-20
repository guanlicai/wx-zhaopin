package com.shop.admin.weixin.controller;

import java.io.File;

import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.common.utils.controller.BaseController;
import com.shop.common.utils.date.DateUtils;
import com.shop.common.utils.json.JsonUtils;
import com.shop.common.utils.template.FreeMarkerConfig;

import freemarker.template.Template;

@Controller
@SuppressWarnings("all")
public class TemplateController extends BaseController{
	
	public Table[] parsePDM_VO(String filePath) {  
        Table[] tabs = new Table[] {};
        List<Table> voS = new ArrayList<Table>();  
        Table vo = null;
        Column[] cols = null;
        File f = new File(filePath);
        SAXReader sr = new SAXReader();
        Document doc = null;
        try {
            doc = sr.read(f);
        } catch (DocumentException e) {
            e.printStackTrace();  
        }  
        Iterator itr = doc.selectNodes("//c:Tables//o:Table").iterator();  
        while (itr.hasNext()) {  
            vo = new Table();  
            cols = new Column[] {};  
            List<Column> list = new ArrayList<Column>();  
            Column col = null;  
            Element e_table = (Element) itr.next();  
            vo.setName(e_table.elementTextTrim("Name"));  
            vo.setCode(e_table.elementTextTrim("Code"));  
            Iterator itr1 = e_table.element("Columns").elements("Column").iterator();  
            while (itr1.hasNext()) {  
                try {  
  
                    col = new Column();  
                    Element e_col = (Element) itr1.next();  
                    String id = e_col.attributeValue("id");  
                    //col.setDefaultValue(e_col.elementTextTrim("DefaultValue"));  
                    col.setName(e_col.elementTextTrim("Name"));  
                    if(e_col.elementTextTrim("DataType").indexOf("(") >0){  
                        col.setDataType(e_col.elementTextTrim("DataType").substring(0, e_col.elementTextTrim("DataType").indexOf("(")));  
                    }else {  
                        col.setDataType(e_col.elementTextTrim("DataType"));  
                    }  
                    col.setCode(e_col.elementTextTrim("Code"));  
                    col.setLength(e_col.elementTextTrim("Length") == null ? 255 : Integer.parseInt(e_col.elementTextTrim("Length")));
                    col.setComment(e_col.elementTextTrim("Comment") == null ? "" : e_col.elementTextTrim("Comment"));
                    col.setRequire(e_col.elementTextTrim("Column.Mandatory") == null ? "false" : "true");
                                        
                    String type = col.getDataType();
                    
                    if(type.indexOf("date") > -1){
                    	col.setIsDate("true");
                    	col.setIsNumber("false");
                    	col.setIsString("false");
                    }
                    else if(type.indexOf("int") > -1){
                    	col.setIsNumber("true");
                    	col.setIsDate("false");
                    	col.setIsString("false");
                    }
                    else{
                    	col.setIsString("true");
                    	col.setIsNumber("false");
                    	col.setIsDate("false");
                    }
                    
                   
                   // System.out.println(">>>>>>code:" + col.getCode());
                    
                    String[] items = col.getCode().split("_");

                    
    				StringBuffer variableName = new StringBuffer();
    				
    				
    				String firstVarialbleItem = items[0];
    				firstVarialbleItem = firstVarialbleItem.substring(0, 1).toLowerCase() + firstVarialbleItem.substring(1);
    				
    				variableName.append(firstVarialbleItem);
    				
    				
    				for(int j=1;j<=items.length -1;j++){
    					
    					items[j] = items[j].substring(0, 1).toUpperCase() + items[j].substring(1);
    					
    					variableName.append(items[j]);
    				}
                    
                    col.setVariableName(variableName.toString());
                    
                    list.add(col);  
                } catch (Exception ex) {  
                    // col.setType(e_col.elementTextTrim("DataType"));  
                    System.out.println("+++++++++有错误++++");  
                    ex.printStackTrace();  
                }  
            }  
            vo.setCols(list);
            voS.add(vo);  
            System.out.println(vo);  
            System.out.println("======================");  
            System.out.println();  
        }  
        return voS.toArray(tabs);  
    }
	
	public void generalController(String author, String desc, String projectName,String moduleName, String className, String fileName) throws Exception{
		
		Template template = null;
		Map<String,Object> root = new HashMap<String, Object>();
		
		template = FreeMarkerConfig.getDefaultTemplate("controller.ftl");
		
		root.put("author", author);
		root.put("date", DateUtils.getFormatDate(new Date(), "yyyy-mm-dd HH:mm"));
		root.put("desc", desc);
		root.put("projectName", projectName);
		root.put("moduleName", moduleName);
		root.put("className", className);
		root.put("fileName", fileName);
		
		String path = "E:\\temp\\" + className + "Controller.java";
		
		Writer out = new OutputStreamWriter(new FileOutputStream(path), "utf-8");
		
		template.process(root, out);
		
	}
	
	public void generalModule(List<Column> columnList,String author, String desc, String projectName,String moduleName, String className, String fileName, String tableName) throws Exception{
		
		Template template = null;
		Map<String,Object> root = new HashMap<String, Object>();
		
		template = FreeMarkerConfig.getDefaultTemplate("module.ftl");
		
		root.put("author", author);
		root.put("date", DateUtils.getFormatDate(new Date(), "yyyy-mm-dd HH:mm"));
		root.put("desc", desc);
		root.put("tableName", tableName);
		root.put("projectName", projectName);
		root.put("moduleName", moduleName);
		root.put("className", className);
		root.put("fileName", fileName);
		root.put("columnList", columnList);
		
		String path = "E:\\temp\\" + className + ".java";
		
		Writer out = new OutputStreamWriter(new FileOutputStream(path), "utf-8");
		
		template.process(root, out);
		
	}
	
	public void generalService(String author, String desc, String projectName,String moduleName, String className, String fileName) throws Exception{
		
		Template template = null;
		Map<String,Object> root = new HashMap<String, Object>();
		
		template = FreeMarkerConfig.getDefaultTemplate("service.ftl");
		
		root.put("author", author);
		root.put("date", DateUtils.getFormatDate(new Date(), "yyyy-mm-dd HH:mm"));
		root.put("desc", desc);
		root.put("projectName", projectName);
		root.put("className", className);
		root.put("moduleName", moduleName);
		root.put("fileName", fileName);
		
		
		String path = "E:\\temp\\" + className + "Service.java";
		
		Writer out = new OutputStreamWriter(new FileOutputStream(path), "utf-8");
		
		template.process(root, out);
		
	}
	
	public void generalServiceImpl(String author, String desc, String projectName,String moduleName, String className, String fileName) throws Exception{
		
		Template template = null;
		Map<String,Object> root = new HashMap<String, Object>();
		
		template = FreeMarkerConfig.getDefaultTemplate("serviceImpl.ftl");
		
		root.put("author", author);
		root.put("date", DateUtils.getFormatDate(new Date(), "yyyy-mm-dd HH:mm"));
		root.put("desc", desc);
		root.put("projectName", projectName);
		root.put("moduleName", moduleName);
		root.put("className", className);
		root.put("fileName", fileName);
		
		String path = "E:\\temp\\" + className + "ServiceImpl.java";
		
		Writer out = new OutputStreamWriter(new FileOutputStream(path), "utf-8");
		
		template.process(root, out);
		
	}
	
	
	public void generalList(List<Column> columnList, String moduleName,String fileName) throws Exception{
		
		Template template = null;
		Map<String,Object> root = new HashMap<String, Object>();
		
		template = FreeMarkerConfig.getDefaultTemplate("list.ftl");
		
		root.put("editUrl", "/"+ moduleName + "/" + fileName +"/edit.html");
		root.put("listUrl", "/"+ moduleName + "/" + fileName +"/list.html");
		root.put("deleteUrl", "/"+ moduleName + "/" + fileName +"/delete.html");
		
		List<String> nameList = new ArrayList<String>();
		for(Column column : columnList){
			if("id".equals(column.getName()) || "isDeleted".equals(column.getName()) || "version".equals(column.getName())){
				continue;
			}
			nameList.add(column.getName());
		}
		
		root.put("nameList", nameList);
		
		List<String> valueList = new ArrayList<String>();
		valueList.add("entity.id");
		
		for(Column column : columnList){
			if("id".equals(column.getName()) || "isDeleted".equals(column.getName()) || "version".equals(column.getName())){
				continue;
			}
			valueList.add("entity." + column.getVariableName());
		}
		
		root.put("valueList", valueList);
		
		root.put("title", "用户管理");
		
		String path = "E:\\temp\\"+ fileName +"_list.jsp";
		
		Writer out = new OutputStreamWriter(new FileOutputStream(path), "utf-8");
		
		template.process(root, out);
		
	}
	
	public void generalEdit(List<Column> columnList, String moduleName,String fileName,String title) throws Exception{
		
		Template template = null;
		Map<String,Object> root = new HashMap<String, Object>();
		
		template = FreeMarkerConfig.getDefaultTemplate("edit.ftl");
		
		root.put("saveUrl", "/"+ moduleName + "/" + fileName +"/save.html");
		
		root.put("title", title);
		
		//edit页面
		List<Map<String, Object>> itemList = new ArrayList<Map<String,Object>>();
		
		Map<String, Object> item = new HashMap<String, Object>();
		for(Column column : columnList){
			
			item = new HashMap<String, Object>();
			
			item.put("name", column.getName());
			item.put("type", column.getVariableName());
			item.put("require", column.getRequire());
			item.put("number", column.getIsNumber());
			item.put("date", column.getIsDate());
			item.put("maxlength", column.getLength());
			
			itemList.add(item);
		}
		
		root.put("itemList", itemList);
		
		String path = "E:\\temp\\"+ fileName +"_edit.jsp";
		
		Writer out = new OutputStreamWriter(new FileOutputStream(path), "utf-8");
		
		template.process(root, out);
	}
	
	
	@RequestMapping("/template/test.html")
	public void test(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			
			String pdmPath = "E:\\temp\\test.pdm";
			
			Table[] tables = parsePDM_VO(pdmPath);
			
			String projectName = "shop";
			String author = "guanlc";
			
			String moduleName = "";
			String className = "";
			String fileName = "";
			
			for (Table table : tables) {  
				
				moduleName = "";
				className = "";
				fileName = "";
				
				if(table.getCode().indexOf("_") == -1){
					continue;
				}
				
				String[] items = table.getCode().split("_");
				
				moduleName = items[0].toLowerCase();
				
				for(int j=1;j<=items.length-1;j++){
					
					items[j] = items[j].substring(0, 1).toUpperCase() + items[j].substring(1);
					
					className += items[j];
				}
				
				fileName = className.substring(0, 1).toLowerCase() + className.substring(1);
				
				System.out.println(">>>>>moduleName:" + moduleName);
				System.out.println(">>>>>className:" + className);
				System.out.println(">>>>>fileName:" + fileName);
				System.out.println(">>>>>table:" + JsonUtils.objectToJson(table));
				
				System.out.println("--------------------------------");
				
				
				//生成 list 页面
				generalList(table.getCols(), moduleName, fileName);
				
				//生成 edit 页面
				generalEdit(table.getCols(), moduleName, fileName, table.getName());
				
				//生成controller
				generalController(author, table.getName(), projectName, moduleName, className, fileName);
				
				//生成module
				generalModule(table.getCols(), author, table.getName(), projectName, moduleName, className, fileName, table.getCode());
				
				
				//生成service
				generalService(author, table.getName(), projectName, moduleName, className, fileName);
			
				//生成serviceImpl
				generalServiceImpl(author, table.getName(), projectName, moduleName, className, fileName);
				
	        }
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
