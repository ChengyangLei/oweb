package net.pkusoft.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import net.pkusoft.mapper.RecordListMapper;
import net.pkusoft.model.RecordList;
import net.pkusoft.service.RecordListService;
import net.pkusoft.utils.BeanUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class RecordListServiceImpl implements RecordListService {

	@Autowired
	private RecordListMapper recordListMapper;

	public int getTotalNum() {
		return recordListMapper.getTotalNum();
	}

	public RecordList getRecordListById( Integer listId) {
		return recordListMapper.getRecordListById( listId );
	}

	public List<RecordList> getRecordListList() {
		return recordListMapper.getRecordListList(  );
	}

	@Override
	public int insert( RecordList recordList ) {
		String addtime = ( new SimpleDateFormat("yyyyMMddHHmmss") ).format( new Date() );
		recordList.setAddtime( addtime );
		recordList.setVisible( "1" );
		return recordListMapper.insert( recordList );
	}

	@Override
	public void update( RecordList recordList ) {
		RecordList oldRecordList = recordListMapper.getRecordListById( recordList.getListId() );
		BeanUtils.copyPropertiesNotNull( oldRecordList, recordList );
		recordListMapper.update( oldRecordList );		
	}


}
