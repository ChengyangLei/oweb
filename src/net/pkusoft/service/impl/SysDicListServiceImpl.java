package net.pkusoft.service.impl;

import java.util.HashMap;
import java.util.List;

import net.pkusoft.mapper.SysDicListMapper;
import net.pkusoft.model.SysDicList;
import net.pkusoft.service.SysDicListService;
import net.pkusoft.utils.DicUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class SysDicListServiceImpl implements SysDicListService {

	@Autowired
	private SysDicListMapper sysDicListMapper;

	public int getTotalNum() {
		return sysDicListMapper.getTotalNum();
	}

	public SysDicList getSysDicListById( String dicName) {
		return sysDicListMapper.getSysDicListById( dicName );
	}

	public List<SysDicList> getSysDicListList() {
		return sysDicListMapper.getSysDicListList(  );
	}

}
