package net.pkusoft.mapper;

import java.util.List;

import net.pkusoft.model.Photo;

public interface PhotoMapper {

	Integer getTotalNum();
	
	Photo getPhotoById( Integer photoId );
	
	Photo getPhotoDataById( Integer photoId );
	
	List<Photo> getPhotoList();
	
	List<Photo> getPhotoListByUserId(Integer userId);
	
	List<Photo> getPhotoListByUserIdAndCategory(Integer userId, String category);
	
	int insert( Photo photo );
	
	int update( Photo photo );
	
}
