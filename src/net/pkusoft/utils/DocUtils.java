package net.pkusoft.utils;

import java.io.File;

import net.pkusoft.constant.BaiduCloud;

import com.baidubce.BceClientConfiguration;
import com.baidubce.auth.DefaultBceCredentials;
import com.baidubce.services.doc.DocClient;
import com.baidubce.services.doc.model.CreateDocumentResponse;
import com.baidubce.services.doc.model.GetDocumentResponse;
import com.baidubce.services.doc.model.ReadDocumentResponse;

public final class DocUtils {

	private static String ENDPOINT = "http://doc.baidubce.com";
	
	private static DocClient client;
	
	static {
		// 初始化一个DocClient
		BceClientConfiguration config = new BceClientConfiguration();
		
		config.setCredentials( new DefaultBceCredentials( BaiduCloud.ACCESS_KEY_ID, BaiduCloud.SECRET_ACCESS_KEY ) );
		config.setEndpoint(ENDPOINT);
		// 设置HTTP最大连接数为10
		config.setMaxConnections(10);

		// 设置TCP连接超时为5000毫秒
		//config.setConnectionTimeout(5000);

		// 设置Socket传输数据超时的时间为2000毫秒
		//config.setSocketTimeout(2000);
		
		client = new DocClient( config );
	}
	
	// 创建文档 -- 通过本地文档创建
	public static void createDocument(File file, String title) {
	    CreateDocumentResponse resp = client.createDocument(file, title);
	    System.out.println("documentId: " + resp.getDocumentId());
	}
	// 查询指定文档
	public static void getDocument(String documentId) {
	    GetDocumentResponse resp = client.getDocument( documentId );
	    System.out.println("documentId: " + resp.getDocumentId());
	    System.out.println("title: " + resp.getTitle());
	    System.out.println("format: " + resp.getFormat());
	    System.out.println("status: " + resp.getStatus()); 
	    if (resp.getStatus() == "PUBLISHED") {
	        System.out.println("pageCount: " + resp.getPublishInfo().getPageCount());
	        System.out.println("sizeInBytes: " + resp.getPublishInfo().getSizeInBytes());
	        System.out.println("coverUrl: " + resp.getPublishInfo().getCoverUrl());
	        System.out.println("publishTime: " + resp.getPublishInfo().getPublishTime());
	    }
	    if (resp.getStatus() == "UPLOADING") {
	        System.out.println("bucket: " + resp.getUploadInfo().getBucket());
	        System.out.println("object: " + resp.getUploadInfo().getObject());
	    }       
	    if (resp.getStatus() == "FAILED") {
	        System.out.println("errorCode: " + resp.getError().getCode());
	        System.out.println("errorMessage: " + resp.getError().getMessage());
	    }
	    System.out.println("notification: " + resp.getNotification());
	    System.out.println("createTime: " + resp.getCreateTime());
	}
	// 删除文档
	public static void deleteDocument(String documentId) {
	    client.deleteDocument(documentId);
	}
	// 阅读文档
	public static void readDocument( String documentId) {
	    ReadDocumentResponse resp = client.readDocument(documentId);
	    System.out.println("documentId: " + resp.getDocumentId());
	    System.out.println("host: " + resp.getHost());
	    System.out.println("token: " + resp.getToken());
	}
	
	public static void main( String[] args ) {
		// /Users/forwardNow/Downloads/201608/十亿消费者.pdf => documentId: doc-ghnm3tys9tzf6ft
		// File file = new File( "/Users/forwardNow/Downloads/201608/十亿消费者.pdf" );
		String documentId = "doc-ghnm3tys9tzf6ft";
		
		// createDocument( file, "十亿消费者.pdf" );
		
		// getDocument( documentId );
		
		readDocument( documentId );
		
		//System.out.println( client );
	}

}
