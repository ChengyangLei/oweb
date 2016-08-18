package net.pkusoft.service;

import java.util.List;

import net.pkusoft.model.SysDicItem;

public interface SysDicItemService {

	public int getTotalNum();

	public SysDicItem getSysDicItemById( int itemId);

	public List<SysDicItem> getSysDicItemList(String dicName);

	public byte[] getSysDicBytesByDicName( String dicName );
}
