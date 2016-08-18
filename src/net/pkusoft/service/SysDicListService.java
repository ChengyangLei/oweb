package net.pkusoft.service;

import java.util.List;

import net.pkusoft.model.SysDicList;

public interface SysDicListService {

	public int getTotalNum();

	public SysDicList getSysDicListById( String dicName);

	public List<SysDicList> getSysDicListList();

	
	
}
