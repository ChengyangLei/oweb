package net.pkusoft.mapper;

import java.util.HashMap;
import java.util.List;

import net.pkusoft.model.GdbaFarenResume;

public interface GdbaFarenResumeMapper {

	int getTotalNum();
	
	GdbaFarenResume getGdbaFarenResumeById(int resumeId);
	
	
	List<GdbaFarenResume> getGdbaFarenResumeByFarenId( Integer farenId );
	
	List<GdbaFarenResume> getGdbaFarenResumeList( HashMap<String, Object> params );
	
	int insert( GdbaFarenResume gdbaFarenResume );

	void update( GdbaFarenResume gdbaFarenResume );

	void delete( Integer resumeId );

}
