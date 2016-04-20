package com.shop.admin.weixin.controller;

import java.io.File;  
import java.util.ArrayList;  
import java.util.Iterator;  
import java.util.List;  
  

import org.dom4j.Document;  
import org.dom4j.DocumentException;  
import org.dom4j.Element;  
import org.dom4j.io.SAXReader;  

import com.shop.common.utils.json.JsonUtils;
  
public class PdmParser {
  
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
                    col.setLength(e_col.elementTextTrim("Length") == null ? null : Integer.parseInt(e_col.elementTextTrim("Length")));
                   
                    list.add(col);  
                    System.out.println(col);  
                } catch (Exception ex) {  
                    // col.setType(e_col.elementTextTrim("DataType"));  
                    System.out.println("+++++++++有错误++++" );  
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
  
    public static void main(String[] args) {  
        PdmParser pp = new PdmParser();  
        Table[] tab = pp.parsePDM_VO("J:\\temp\\test.pdm");
        
        
        pp.initTable(tab);  
    }  
  
    public void initTable(Table[] tabs) {  
        List<String> list = new ArrayList<String>();  
        for (Table tab : tabs) {  
            list.add(tab.getName());  
            System.out.println(JsonUtils.objectToJson(tab));  
        }  
    }  
}  