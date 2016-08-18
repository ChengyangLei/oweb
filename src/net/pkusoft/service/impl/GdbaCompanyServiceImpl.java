package net.pkusoft.service.impl;

import java.util.HashMap;
import java.util.List;

import net.pkusoft.mapper.GdbaCompanyMapper;
import net.pkusoft.model.GdbaCompany;
import net.pkusoft.service.GdbaCompanyService;
import net.pkusoft.utils.BeanUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class GdbaCompanyServiceImpl implements GdbaCompanyService {

	@Autowired
	private GdbaCompanyMapper gdbaCompanyMapper;

	public int getTotalNum() {
		return gdbaCompanyMapper.getTotalNum();
	}

	public GdbaCompany getGdbaCompanyById( int gsbm ) {
		return gdbaCompanyMapper.getGdbaCompanyById( gsbm );
	}

	public List<GdbaCompany> getGdbaCompanyList( int start, int rowCount ) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put( "start", start );
		params.put( "rowCount", rowCount );
		return gdbaCompanyMapper.getGdbaCompanyList( params );
	}

	@Override
	public int insert( GdbaCompany gdbaCompany ) {
		return gdbaCompanyMapper.insert( gdbaCompany );
	}

	@Override
	public void update( GdbaCompany gdbaCompany ) {
		GdbaCompany oldGdbaCompany = gdbaCompanyMapper.getGdbaCompanyById( gdbaCompany.getGsbm() );
		BeanUtils.copyPropertiesNotNull( oldGdbaCompany, gdbaCompany );
		gdbaCompanyMapper.update(oldGdbaCompany);
	}

	@Override
	public GdbaCompany getGdbaCompanyByUserId( Integer userId ) {
		return gdbaCompanyMapper.getGdbaCompanyByUserId( userId );
	}

}
