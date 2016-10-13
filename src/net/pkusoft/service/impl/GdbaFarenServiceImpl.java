package net.pkusoft.service.impl;

import java.util.HashMap;
import java.util.List;

import net.pkusoft.mapper.GdbaFarenMapper;
import net.pkusoft.model.GdbaCompany;
import net.pkusoft.model.GdbaFaren;
import net.pkusoft.service.GdbaFarenService;
import net.pkusoft.utils.BeanUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class GdbaFarenServiceImpl implements GdbaFarenService {

	@Autowired
	private GdbaFarenMapper gdbaFarenMapper;

	@Override
	public int getTotalNum() {
		return gdbaFarenMapper.getTotalNum();
	}

	@Override
	public GdbaFaren getGdbaFarenById( int farenId ) {
		return gdbaFarenMapper.getGdbaFarenById( farenId );
	}

	@Override
	public GdbaFaren getGdbaFarenByUserId( Integer userId ) {
		return gdbaFarenMapper.getGdbaFarenByUserId( userId );
	}

	@Override
	public List<GdbaFaren> getGdbaFarenList( int start, int rowCount ) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put( "start", start );
		params.put( "rowCount", rowCount );
		return gdbaFarenMapper.getGdbaFarenList( params );
	}

	@Override
	public int insert( GdbaFaren gdbaFaren ) {
		return gdbaFarenMapper.insert( gdbaFaren );
	}

	@Override
	public void update( GdbaFaren gdbaFaren ) {
		GdbaFaren oldGdbaFaren = gdbaFarenMapper.getGdbaFarenById( gdbaFaren.getFarenId() );
		BeanUtils.copyPropertiesNotNull( oldGdbaFaren, gdbaFaren );
		gdbaFarenMapper.update(oldGdbaFaren);
	}

	@Override
	public void delete( Integer farenId ) {
		gdbaFarenMapper.delete( farenId );
	}

}
