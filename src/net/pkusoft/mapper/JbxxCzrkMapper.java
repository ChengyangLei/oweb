package net.pkusoft.mapper;

import java.util.HashMap;
import java.util.List;

import net.pkusoft.model.JbxxCzrk;

public interface JbxxCzrkMapper {

	int getTotalNum();
	
	JbxxCzrk getJbxxCzrkById(int rkbm);
	
	List<JbxxCzrk> getJbxxCzrkList( HashMap<String, Object> params );
}
