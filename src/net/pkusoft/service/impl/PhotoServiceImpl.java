package net.pkusoft.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;

import net.pkusoft.mapper.PhotoMapper;
import net.pkusoft.model.Photo;
import net.pkusoft.model.SysUser;
import net.pkusoft.service.PhotoService;
import net.pkusoft.utils.BeanUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class PhotoServiceImpl implements PhotoService {

	@Autowired
	private PhotoMapper photoMapper;

	@Override
	public Integer getTotalNum() {
		return photoMapper.getTotalNum();
	}

	@Override
	public Photo getPhotoById( Integer photoId ) {
		return photoMapper.getPhotoById( photoId );
	}

	@Override
	public Photo getPhotoDataById( Integer photoId ) {
		return photoMapper.getPhotoDataById( photoId );
	}

	@Override
	public List<Photo> getPhotoList() {
		return photoMapper.getPhotoList();
	}

	@Override
	public int insert( Photo photo ) {
		return photoMapper.insert( photo );
	}

	@Override
	public int update( Photo photo ) {
		Photo oldPhoto = photoMapper.getPhotoById( photo.getPhotoId() );
		BeanUtils.copyPropertiesNotNull( oldPhoto, photo );
		return photoMapper.update( oldPhoto );	
	}

	@Override
	public List<Photo> getPhotoListByUserId( Integer userId ) {
		return photoMapper.getPhotoListByUserId( userId );
	}

	@Override
	public List<Photo> getPhotoListByUserIdAndCategory( Integer userId, String category ) {
		return photoMapper.getPhotoListByUserIdAndCategory( userId, category );
	}


}
