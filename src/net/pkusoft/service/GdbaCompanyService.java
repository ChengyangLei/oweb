package net.pkusoft.service;

import java.util.List;

import net.pkusoft.model.GdbaCompany;

public interface GdbaCompanyService {
	public int getTotalNum();

	public GdbaCompany getGdbaCompanyById( int gsbm );

	public List<GdbaCompany> getGdbaCompanyList( int start, int rowCount );
	
	public int insert(GdbaCompany gdbaCompany);

	public void update( GdbaCompany gdbaCompany );

	public GdbaCompany getGdbaCompanyByUserId( Integer userId );

}
