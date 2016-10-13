package net.pkusoft.service;

import java.util.List;

import net.pkusoft.model.GdbaGd;

public interface GdbaGdService {
	int getTotalNum();
	
	GdbaGd getGdbaGdById(int gdId);
	
	List<GdbaGd> getGdbaGdByCategoryAndGsbm( String category, Integer gsbm );
	
	List<GdbaGd> getGdbaGdByGsbm( Integer gsbm );
	
	List<GdbaGd> getGdbaGdList( int start, int rowCount  );
	
	int insert( GdbaGd gdbaGd );

	void update( GdbaGd gdbaGd );

	void delete( Integer id );

}
