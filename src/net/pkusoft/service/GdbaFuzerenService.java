package net.pkusoft.service;

import java.util.List;

import net.pkusoft.model.GdbaFuzeren;

public interface GdbaFuzerenService {
	
	int getTotalNum();
	
	GdbaFuzeren getGdbaFuzerenById( Integer fuzerenId );
	
	List<GdbaFuzeren> getGdbaFuzerenByUserId( Integer userId );
	
	List<GdbaFuzeren> getGdbaFuzerenList( int start, int rowCount   );
	
	void insert( GdbaFuzeren gdbaFuzeren );
	
	void update( GdbaFuzeren gdbaFuzeren );
	
	void delete( Integer fuzerenId );

}
