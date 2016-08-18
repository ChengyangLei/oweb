package net.pkusoft.mapper;

import java.util.HashMap;
import java.util.List;

import net.pkusoft.model.GdbaCompany;

public interface GdbaCompanyMapper {

	int getTotalNum();
	
	GdbaCompany getGdbaCompanyById(int gsbm);
	
	List<GdbaCompany> getGdbaCompanyList( HashMap<String, Object> params );
	
	int insert( GdbaCompany gdbaCompany );

	void update( GdbaCompany gdbaCompany );

	GdbaCompany getGdbaCompanyByUserId( Integer userId );
}
