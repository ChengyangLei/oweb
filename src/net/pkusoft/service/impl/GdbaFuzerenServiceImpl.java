package net.pkusoft.service.impl;

import java.util.HashMap;
import java.util.List;

import net.pkusoft.mapper.GdbaFuzerenMapper;
import net.pkusoft.model.GdbaFuzeren;
import net.pkusoft.service.GdbaFuzerenService;
import net.pkusoft.utils.BeanUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class GdbaFuzerenServiceImpl implements GdbaFuzerenService {

	@Autowired
	private GdbaFuzerenMapper gdbaFuzerenMapper;
	
	@Override
	public int getTotalNum() {
		return gdbaFuzerenMapper.getTotalNum();
	}

	@Override
	public GdbaFuzeren getGdbaFuzerenById( Integer fuzerenId ) {
		return gdbaFuzerenMapper.getGdbaFuzerenById( fuzerenId );
	}

	@Override
	public List<GdbaFuzeren> getGdbaFuzerenByUserId( Integer userId ) {
		return gdbaFuzerenMapper.getGdbaFuzerenByUserId( userId );
	}

	@Override
	public List<GdbaFuzeren> getGdbaFuzerenList( int start, int rowCount ) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put( "start", start );
		params.put( "rowCount", rowCount );
		return gdbaFuzerenMapper.getGdbaFuzerenList( params );
	}

	@Override
	public void insert( GdbaFuzeren gdbaFuzeren ) {
		gdbaFuzerenMapper.insert( gdbaFuzeren );
	}

	@Override
	public void update( GdbaFuzeren gdbaFuzeren ) {
		GdbaFuzeren oldGdbaFuzeren = gdbaFuzerenMapper.getGdbaFuzerenById( gdbaFuzeren.getFuzerenId() );
		BeanUtils.copyPropertiesNotNull( oldGdbaFuzeren, gdbaFuzeren );
		gdbaFuzerenMapper.update(oldGdbaFuzeren);
	}

	@Override
	public void delete( Integer fuzerenId ) {
		gdbaFuzerenMapper.delete( fuzerenId );
	}


}
