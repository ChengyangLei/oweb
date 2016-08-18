package net.pkusoft.controller;

import java.util.List;

import net.pkusoft.model.JbxxCzrk;
import net.pkusoft.service.DatagridService;
import net.pkusoft.service.SysDicItemService;
import net.pkusoft.service.SysDicListService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller  
public class DatagridController {

	@Autowired
    private DatagridService datagridService;  
	
	@ResponseBody
	@RequestMapping("/Datagrid")
	public DatagridJsonResult getData(int current, int rowCount) {
		DatagridJsonResult jsonResult = new DatagridJsonResult();
		int start = ( current - 1 ) * rowCount;
		int totalNum = datagridService.getTotalNum();
		List<JbxxCzrk> jbxxCzrkList = datagridService.getJbxxCzrkList( start, rowCount);
		
		jsonResult.setCurrent( current );
		jsonResult.setRowCount( rowCount );
		jsonResult.setTotal( totalNum );
		jsonResult.setRows( jbxxCzrkList );
		
		return jsonResult;
	}
	
}
