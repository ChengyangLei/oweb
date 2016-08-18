package net.pkusoft.service.impl;

import java.util.HashMap;
import java.util.List;

import net.pkusoft.mapper.JbxxCzrkMapper;
import net.pkusoft.model.JbxxCzrk;
import net.pkusoft.service.DatagridService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class DatagridServiceImpl implements DatagridService {

	@Autowired
	private JbxxCzrkMapper jbxxCzrkMapper;

	public int getTotalNum() {
		return jbxxCzrkMapper.getTotalNum();
	}

	public JbxxCzrk getJbxxCzrkById( int rkbm ) {
		return jbxxCzrkMapper.getJbxxCzrkById( rkbm );
	}

	public List<JbxxCzrk> getJbxxCzrkList( int start, int rowCount ) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put( "start", start );
		params.put( "rowCount", rowCount );
		return jbxxCzrkMapper.getJbxxCzrkList( params );
	}

}
