package net.pkusoft.service;

import java.util.List;

import net.pkusoft.model.RecordItem;

public interface RecordItemService {

	public int getTotalNum();

	public RecordItem getRecordItemById( Integer itemId);

	public List<RecordItem> getRecordItemList();
	
	public List<RecordItem> getRecordItemListByListId(Integer listId);

	public int insert( RecordItem recordItem );
	
	public void update( RecordItem recordItem );

	
}
