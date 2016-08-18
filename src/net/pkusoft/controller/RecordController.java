package net.pkusoft.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import net.pkusoft.model.RecordItem;
import net.pkusoft.model.RecordList;
import net.pkusoft.service.RecordItemService;
import net.pkusoft.service.RecordListService;
import net.pkusoft.utils.JsonResult;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller  
public class RecordController {
	private Logger logger = Logger.getLogger( RecordController.class );

	@Autowired
    private RecordListService recordListService;
	@Autowired
	private RecordItemService recordItemService;  
	
	@RequestMapping("/record/index")
	public ModelAndView getData(ModelAndView model) {
		
		List<Map<String, Object>> recordList = new ArrayList<Map<String, Object>>();
		
		List<RecordList> recordListList = recordListService.getRecordListList();
		for( RecordList _recordList : recordListList ) {
			Map<String, Object> recordMap = new LinkedHashMap<String, Object>();
			Integer listId = _recordList.getListId();
			List<RecordItem> recordItemList = recordItemService.getRecordItemListByListId( listId );
			recordMap.put( "recordList", _recordList );
			recordMap.put( "recordItemList", recordItemList );
			recordList.add( recordMap );
		}
		
		model.addObject( "recordList", recordList );
		
		model.setViewName( "/record/index" );
		return model;
	}
	
	@RequestMapping("/record/list/save")
	@ResponseBody
	public JsonResult saveRecordList( RecordList  recordList ) {
		JsonResult jsonResult = new JsonResult( true );
		Integer listId = recordList.getListId();
		try {
			if ( listId == null ) { // insert 	
				recordListService.insert( recordList );
			} else { // update
				recordListService.update( recordList );
			}
			jsonResult.setData( recordList.getListId() + "" );	
		} catch ( Exception e ) {
			e.printStackTrace();
			logger.error( "保存 RecordList 出错" );
			jsonResult.setSuccess( false );
			return jsonResult;
		}
		return jsonResult;
	}
	
	@RequestMapping("/record/item/save")
	@ResponseBody
	public JsonResult saveRecordItem( RecordItem  recordItem ) {
		JsonResult jsonResult = new JsonResult( true );
		Integer itemId = recordItem.getItemId();
		try {
			if ( itemId == null ) { // insert 	
				recordItemService.insert( recordItem );
			} else { // update
				recordItemService.update( recordItem );
			}
			jsonResult.setData( recordItem.getItemId() + "" );	
		} catch ( Exception e ) {
			e.printStackTrace();
			logger.error( "保存 RecordItem 出错" );
			jsonResult.setSuccess( false );
			return jsonResult;
		}
		return jsonResult;
	}
	
}
