package net.pkusoft.mapper;

import java.util.List;

import net.pkusoft.model.SysDicItem;

public interface SysDicItemMapper {

	int getTotalNum();
	
	SysDicItem getSysDicItemById(int itemId);
	
	List<SysDicItem> getSysDicItemList(String dicName);
}
