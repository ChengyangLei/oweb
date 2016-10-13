package net.pkusoft.model;

public class GdbaFarenResume {
	private Integer resumeId;
	private Integer farenId;
	/** 公司名称 */
	private String gsmc; 
	/** 开始时间 */
	private String start; 
	/** 结束时间 */
	private String end; 
	/** 职位类别 */
	private String zwlb; 
	/** 职位名称 */
	private String zwmc;
	public Integer getResumeId() {
		return resumeId;
	}
	public void setResumeId( Integer resumeId ) {
		this.resumeId = resumeId;
	}
	public Integer getFarenId() {
		return farenId;
	}
	public void setFarenId( Integer farenId ) {
		this.farenId = farenId;
	}
	public String getGsmc() {
		return gsmc;
	}
	public void setGsmc( String gsmc ) {
		this.gsmc = gsmc;
	}
	public String getStart() {
		return start;
	}
	public void setStart( String start ) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd( String end ) {
		this.end = end;
	}
	public String getZwlb() {
		return zwlb;
	}
	public void setZwlb( String zwlb ) {
		this.zwlb = zwlb;
	}
	public String getZwmc() {
		return zwmc;
	}
	public void setZwmc( String zwmc ) {
		this.zwmc = zwmc;
	} 
	
	
}
