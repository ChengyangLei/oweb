package net.pkusoft.mapper;

import java.util.HashMap;
import java.util.List;

import net.pkusoft.model.GdbaFaren;

public interface GdbaFarenMapper {

	int getTotalNum();
	
	GdbaFaren getGdbaFarenById(int farenId);
	
	GdbaFaren getGdbaFarenByUserId( Integer userId );
	
	List<GdbaFaren> getGdbaFarenList( HashMap<String, Object> params );
	
	int insert( GdbaFaren gdbaFaren );

	void update( GdbaFaren gdbaFaren );

	void delete( Integer farenId );

}
