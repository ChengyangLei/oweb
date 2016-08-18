package net.pkusoft.service;

import java.util.List;

import net.pkusoft.model.SysUser;

public interface SysUserService {

	public int getTotalNum();

	public SysUser getSysUserById( Integer userId);

	public List<SysUser> getSysUserList();

	public int insert( SysUser sysUser );
	
	public void update( SysUser sysUser );

	public SysUser validateLogin( SysUser sysUser );

	public SysUser getSysUserByLoginName( String loginName );
	
}
