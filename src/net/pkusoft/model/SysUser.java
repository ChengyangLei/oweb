package net.pkusoft.model;

public class SysUser {

	private Integer userId;
	private String loginName;
	private String password;
	private String userName;
	private String status;
	
	
	
	public SysUser() {
		super();
	}
	
	
	public SysUser( String loginName, String password, String userName, String status ) {
		super();
		this.loginName = loginName;
		this.password = password;
		this.userName = userName;
		this.status = status;
	}


	public Integer getUserId() {
		return userId;
	}
	public void setUserId( Integer userId ) {
		this.userId = userId;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName( String loginName ) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword( String password ) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName( String userName ) {
		this.userName = userName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus( String status ) {
		this.status = status;
	}
	
	
	
}
