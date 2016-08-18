package net.pkusoft.utils;


public class JsonResult {
	private boolean isSuccess;
	private String data;
	
	
	public JsonResult() {
		super();
	}
	
	public JsonResult( boolean isSuccess ) {
		super();
		this.isSuccess = isSuccess;
	}

	public JsonResult( boolean isSuccess, String data ) {
		super();
		this.isSuccess = isSuccess;
		this.data = data;
	}

	public boolean isSuccess() {
		return isSuccess;
	}
	public void setSuccess( boolean isSuccess ) {
		this.isSuccess = isSuccess;
	}
	public String getData() {
		return data;
	}
	public void setData( String data ) {
		this.data = data;
	}
	
}
