package net.pkusoft.model;


public class GdbaCompany {
	/** 公司编码（pk） **/
	private Integer gsbm;
	private Integer userId;
	/** 公司名称 **/
	private String gsmc;
	/** 公司性质 **/
	private String gsxz;
	/** 管理人数（可以为空） **/
	private Integer glrs;
	/** 注册资金 **/
	private Integer zczj;
	/** 营业执照注册号 **/
	private String yyzz;
	/** 公司地址省市县(区) **/
	private String gsdzssxq;
	/** 公司详细地址 **/
	private String gsdzxz;
	/** 辖区派出所 **/
	private String gsxqpcs;
	/** 经营范围 **/
	private String jyfw;
	public Integer getGsbm() {
		return gsbm;
	}
	public void setGsbm( Integer gsbm ) {
		this.gsbm = gsbm;
	}
	public String getGsmc() {
		return gsmc;
	}
	public void setGsmc( String gsmc ) {
		this.gsmc = gsmc;
	}
	public String getGsxz() {
		return gsxz;
	}
	public void setGsxz( String gsxz ) {
		this.gsxz = gsxz;
	}
	public Integer getGlrs() {
		return glrs;
	}
	public void setGlrs( Integer glrs ) {
		this.glrs = glrs;
	}
	public Integer getZczj() {
		return zczj;
	}
	public void setZczj( Integer zczj ) {
		this.zczj = zczj;
	}
	public String getYyzz() {
		return yyzz;
	}
	public void setYyzz( String yyzz ) {
		this.yyzz = yyzz;
	}
	public String getGsdzssxq() {
		return gsdzssxq;
	}
	public void setGsdzssxq( String gsdzssxq ) {
		this.gsdzssxq = gsdzssxq;
	}
	public String getGsdzxz() {
		return gsdzxz;
	}
	public void setGsdzxz( String gsdzxz ) {
		this.gsdzxz = gsdzxz;
	}
	public String getGsxqpcs() {
		return gsxqpcs;
	}
	public void setGsxqpcs( String gsxqpcs ) {
		this.gsxqpcs = gsxqpcs;
	}
	public String getJyfw() {
		return jyfw;
	}
	public void setJyfw( String jyfw ) {
		this.jyfw = jyfw;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId( Integer userId ) {
		this.userId = userId;
	}
	
}
