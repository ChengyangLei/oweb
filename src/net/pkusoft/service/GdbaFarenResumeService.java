package net.pkusoft.service;

import java.util.List;

import net.pkusoft.model.GdbaFarenResume;
import net.pkusoft.model.GdbaGd;

public interface GdbaFarenResumeService {
	
	int getTotalNum();
	
	GdbaFarenResume getGdbaFarenResumeById(int resumeId);
	
	
	List<GdbaFarenResume> getGdbaFarenResumeByFarenId( Integer farenId );
	
	List<GdbaFarenResume> getGdbaFarenResumeList( int start, int rowCount  );
	
	int insert( GdbaFarenResume gdbaFarenResume );

	void update( GdbaFarenResume gdbaFarenResume );

	void delete( Integer resumeId );

}
