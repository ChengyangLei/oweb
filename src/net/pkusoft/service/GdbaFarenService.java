package net.pkusoft.service;

import java.util.List;

import net.pkusoft.model.GdbaFaren;

public interface GdbaFarenService {
	int getTotalNum();
	
	GdbaFaren getGdbaFarenById(int farenId);
	
	GdbaFaren getGdbaFarenByUserId( Integer userId );
	
	List<GdbaFaren> getGdbaFarenList( int start, int rowCount ) ;
	
	int insert( GdbaFaren gdbaFaren );

	void update( GdbaFaren gdbaFaren );

	void delete( Integer farenId );

}
