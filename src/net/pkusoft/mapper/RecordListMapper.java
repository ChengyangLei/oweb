package net.pkusoft.mapper;

import java.util.List;

import net.pkusoft.model.RecordList;

public interface RecordListMapper {

	int getTotalNum();
	
	RecordList getRecordListById(int listId);
	
	List<RecordList> getRecordListList();
	
	int insert( RecordList recordList );
	
	void update( RecordList recordList );

}
