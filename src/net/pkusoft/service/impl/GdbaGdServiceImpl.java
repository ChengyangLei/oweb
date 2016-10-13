package net.pkusoft.service.impl;

import java.util.HashMap;
import java.util.List;

import net.pkusoft.mapper.GdbaGdMapper;
import net.pkusoft.model.GdbaGd;
import net.pkusoft.service.GdbaGdService;
import net.pkusoft.utils.BeanUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class GdbaGdServiceImpl implements GdbaGdService {

	@Autowired
	private GdbaGdMapper gdbaGdMapper;

	@Override
	public int getTotalNum() {
		return gdbaGdMapper.getTotalNum();
	}

	@Override
	public GdbaGd getGdbaGdById( int gdId ) {
		return gdbaGdMapper.getGdbaGdById( gdId );
	}

	@Override
	public List<GdbaGd> getGdbaGdByCategoryAndGsbm( String category, Integer gsbm ) {
		return gdbaGdMapper.getGdbaGdByCategoryAndGsbm( category, gsbm );
	}

	@Override
	public List<GdbaGd> getGdbaGdByGsbm( Integer gsbm ) {
		return gdbaGdMapper.getGdbaGdByGsbm( gsbm );
	}

	@Override
	public List<GdbaGd> getGdbaGdList( int start, int rowCount ) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put( "start", start );
		params.put( "rowCount", rowCount );
		return gdbaGdMapper.getGdbaGdList( params );
	}

	@Override
	public int insert( GdbaGd gdbaGd ) {
		return gdbaGdMapper.insert( gdbaGd );
	}

	@Override
	public void update( GdbaGd gdbaGd ) {
		GdbaGd oldGdbaGd = gdbaGdMapper.getGdbaGdById( gdbaGd.getGdId() );
		BeanUtils.copyPropertiesNotNull( oldGdbaGd, gdbaGd );
		gdbaGdMapper.update(oldGdbaGd);		
	}

	@Override
	public void delete( Integer id ) {
		gdbaGdMapper.delete( id );
	}

}
