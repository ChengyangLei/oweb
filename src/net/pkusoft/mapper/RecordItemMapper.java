package net.pkusoft.mapper;

import java.util.List;

import net.pkusoft.model.RecordItem;

public interface RecordItemMapper {

	int getTotalNum();
	
	RecordItem getRecordItemById(int itemId);
	
	List<RecordItem> getRecordItemList();
	
	List<RecordItem> getRecordItemListByListId(Integer listId);
	
	int insert( RecordItem recordItem );
	
	void update( RecordItem recordItem );

}
