package net.pkusoft.mapper;

import java.util.List;

import net.pkusoft.model.SysDicList;

public interface SysDicListMapper {

	int getTotalNum();
	
	SysDicList getSysDicListById(String dicName);
	
	List<SysDicList> getSysDicListList();
}
