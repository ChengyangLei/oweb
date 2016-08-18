package net.pkusoft.mapper;

import java.util.List;

import net.pkusoft.model.SysUser;

public interface SysUserMapper {

	int getTotalNum();
	
	SysUser getSysUserById(int userId);
	
	List<SysUser> getSysUserList();
	
	int insert( SysUser sysUser );
	
	void update( SysUser sysUser );

	SysUser getSysUserByLoginNameAndPassword( SysUser sysUser );

	SysUser getSysUserByLoginName( String loginName );
}
