package net.pkusoft.service;

import java.util.List;

import net.pkusoft.model.JbxxCzrk;

public interface DatagridService {


	public int getTotalNum();

	public JbxxCzrk getJbxxCzrkById( int gsbm );

	public List<JbxxCzrk> getJbxxCzrkList( int start, int rowCount );

}
