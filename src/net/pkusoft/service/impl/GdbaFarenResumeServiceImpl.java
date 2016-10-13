package net.pkusoft.service.impl;

import java.util.HashMap;
import java.util.List;

import net.pkusoft.mapper.GdbaFarenResumeMapper;
import net.pkusoft.model.GdbaFarenResume;
import net.pkusoft.model.GdbaGd;
import net.pkusoft.service.GdbaFarenResumeService;
import net.pkusoft.utils.BeanUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class GdbaFarenResumeServiceImpl implements GdbaFarenResumeService {

	@Autowired
	private GdbaFarenResumeMapper gdbaFarenResumeMapper;

	@Override
	public int getTotalNum() {
		return gdbaFarenResumeMapper.getTotalNum();
	}

	@Override
	public GdbaFarenResume getGdbaFarenResumeById( int resumeId ) {
		return gdbaFarenResumeMapper.getGdbaFarenResumeById( resumeId );
	}

	@Override
	public List<GdbaFarenResume> getGdbaFarenResumeByFarenId( Integer farenId ) {
		return gdbaFarenResumeMapper.getGdbaFarenResumeByFarenId( farenId );
	}


	@Override
	public List<GdbaFarenResume> getGdbaFarenResumeList( int start, int rowCount ) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put( "start", start );
		params.put( "rowCount", rowCount );
		return gdbaFarenResumeMapper.getGdbaFarenResumeList( params );
	}

	@Override
	public int insert( GdbaFarenResume gdbaFarenResume ) {
		return gdbaFarenResumeMapper.insert( gdbaFarenResume );
	}

	@Override
	public void update( GdbaFarenResume gdbaFarenResume ) {
		GdbaFarenResume oldGdbaFarenResume = gdbaFarenResumeMapper.getGdbaFarenResumeById( gdbaFarenResume.getResumeId() );
		BeanUtils.copyPropertiesNotNull( oldGdbaFarenResume, gdbaFarenResume );
		gdbaFarenResumeMapper.update(oldGdbaFarenResume);		
	}

	@Override
	public void delete( Integer resumeId ) {
		gdbaFarenResumeMapper.delete( resumeId );
	}

}
