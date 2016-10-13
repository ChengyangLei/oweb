package net.pkusoft.mapper;

import java.util.HashMap;
import java.util.List;

import net.pkusoft.model.GdbaGd;

public interface GdbaGdMapper {

	int getTotalNum();
	
	GdbaGd getGdbaGdById(int gdId);
	
	List<GdbaGd> getGdbaGdByCategoryAndGsbm( String category, Integer gsbm );
	
	List<GdbaGd> getGdbaGdByGsbm( Integer gsbm );
	
	List<GdbaGd> getGdbaGdList( HashMap<String, Object> params );
	
	int insert( GdbaGd gdbaGd );

	void update( GdbaGd gdbaGd );

	void delete( Integer id );

}
