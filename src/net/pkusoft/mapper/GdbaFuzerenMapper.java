package net.pkusoft.mapper;

import java.util.HashMap;
import java.util.List;

import net.pkusoft.model.GdbaFuzeren;

public interface GdbaFuzerenMapper {

	int getTotalNum();
	
	GdbaFuzeren getGdbaFuzerenById( Integer fuzerenId );
	
	List<GdbaFuzeren> getGdbaFuzerenByUserId( Integer userId );
	
	List<GdbaFuzeren> getGdbaFuzerenList( HashMap<String, Object> params  );
	
	void insert( GdbaFuzeren gdbaFuzeren );
	
	void update( GdbaFuzeren gdbaFuzeren );
	
	void delete( Integer fuzerenId );
	
}
