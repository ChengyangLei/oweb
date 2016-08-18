package net.pkusoft.model;

public class Photo {
	private Integer photoId;
	private Integer userId;
	private String name;
	private String type;
	private Long size;
	private byte[] data;
	
	
	
	public Photo( Integer photoId, Integer userId, String name, String type, Long size, byte[] data ) {
		super();
		this.photoId = photoId;
		this.userId = userId;
		this.name = name;
		this.type = type;
		this.size = size;
		this.data = data;
	}
	
	public Photo( Integer userId, String name, String type, Long size, byte[] data ) {
		super();
		this.userId = userId;
		this.name = name;
		this.type = type;
		this.size = size;
		this.data = data;
	}

	public Photo() {
		super();
	}

	public Integer getPhotoId() {
		return photoId;
	}
	public void setPhotoId( Integer photoId ) {
		this.photoId = photoId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId( Integer userId ) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName( String name ) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType( String type ) {
		this.type = type;
	}
	public Long getSize() {
		return size;
	}
	public void setSize( Long size ) {
		this.size = size;
	}
	public byte[] getData() {
		return data;
	}
	public void setData( byte[] data ) {
		this.data = data;
	}
	
	
}
