package net.pkusoft.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import net.pkusoft.mapper.RecordItemMapper;
import net.pkusoft.model.RecordItem;
import net.pkusoft.service.RecordItemService;
import net.pkusoft.utils.BeanUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class RecordItemServiceImpl implements RecordItemService {

	@Autowired
	private RecordItemMapper recordItemMapper;

	public int getTotalNum() {
		return recordItemMapper.getTotalNum();
	}

	public RecordItem getRecordItemById( Integer itemId) {
		return recordItemMapper.getRecordItemById( itemId );
	}

	public List<RecordItem> getRecordItemList() {
		return recordItemMapper.getRecordItemList(  );
	}

	@Override
	public int insert( RecordItem recordItem ) {
		String addtime = ( new SimpleDateFormat("yyyyMMddHHmmss") ).format( new Date() );
		recordItem.setAddtime( addtime );
		recordItem.setVisible( "1" );
		return recordItemMapper.insert( recordItem );
	}

	@Override
	public void update( RecordItem recordItem ) {
		RecordItem oldRecordItem = recordItemMapper.getRecordItemById( recordItem.getListId() );
		BeanUtils.copyPropertiesNotNull( oldRecordItem, recordItem );
		recordItemMapper.update( oldRecordItem );		
	}

	@Override
	public List<RecordItem> getRecordItemListByListId( Integer listId ) {
		return recordItemMapper.getRecordItemListByListId( listId );
	}


}
