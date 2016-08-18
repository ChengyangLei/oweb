package net.pkusoft.service.impl;

import java.util.List;

import net.pkusoft.mapper.SysDicItemMapper;
import net.pkusoft.model.SysDicItem;
import net.pkusoft.service.SysDicItemService;
import net.pkusoft.utils.DicUtils;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class SysDicItemServiceImpl implements SysDicItemService {
	private Logger logger = Logger.getLogger( SysDicItemServiceImpl.class );
	@Autowired
	private SysDicItemMapper sysDicItemMapper;

	public int getTotalNum() {
		return sysDicItemMapper.getTotalNum();
	}

	public SysDicItem getSysDicItemById( int itemId) {
		return sysDicItemMapper.getSysDicItemById( itemId );
	}

	public List<SysDicItem> getSysDicItemList(String dicName) {
		return sysDicItemMapper.getSysDicItemList( dicName );
	}

	@Override
	public byte[] getSysDicBytesByDicName( String dicName ) {
		try {
			return DicUtils.convertToDicXmlBytes( dicName, sysDicItemMapper.getSysDicItemList( dicName ) );
		} catch ( Exception e) {
			logger.error( "获取字典流失败" );
			return null;
		}
	}

	
}
