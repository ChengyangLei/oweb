package net.pkusoft.service.impl;

import java.util.List;

import net.pkusoft.mapper.SysUserMapper;
import net.pkusoft.model.SysUser;
import net.pkusoft.service.SysUserService;
import net.pkusoft.utils.BeanUtils;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class SysUserServiceImpl implements SysUserService {

	@Autowired
	private SysUserMapper sysUserMapper;

	public int getTotalNum() {
		return sysUserMapper.getTotalNum();
	}

	public SysUser getSysUserById( Integer userId) {
		return sysUserMapper.getSysUserById( userId );
	}

	public List<SysUser> getSysUserList() {
		return sysUserMapper.getSysUserList(  );
	}

	@Override
	public int insert( SysUser sysUser ) {
		return sysUserMapper.insert( sysUser );
	}

	@Override
	public void update( SysUser sysUser ) {
		SysUser oldSysUser = sysUserMapper.getSysUserById( sysUser.getUserId() );
		BeanUtils.copyPropertiesNotNull( oldSysUser, sysUser );
		sysUserMapper.update( oldSysUser );		
	}

	@Override
	public SysUser validateLogin( SysUser sysUser ) {
		String loginName = StringUtils.trim( sysUser.getLoginName() );
		sysUser.setLoginName( loginName );
		return sysUserMapper.getSysUserByLoginNameAndPassword( sysUser );
	}

	@Override
	public SysUser getSysUserByLoginName( String loginName ) {
		// TODO Auto-generated method stub
		return sysUserMapper.getSysUserByLoginName( loginName );
	}

}
