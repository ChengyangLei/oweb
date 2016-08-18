package net.pkusoft.service;

import java.util.List;

import net.pkusoft.model.RecordList;

public interface RecordListService {

	public int getTotalNum();

	public RecordList getRecordListById( Integer listId);

	public List<RecordList> getRecordListList();

	public int insert( RecordList recordList );
	
	public void update( RecordList recordList );

	
}
