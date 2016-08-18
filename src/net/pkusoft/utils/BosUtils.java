package net.pkusoft.utils;

import java.util.List;

import net.pkusoft.constant.BaiduCloud;

import org.springframework.util.Assert;

import com.baidubce.auth.DefaultBceCredentials;
import com.baidubce.services.bos.BosClient;
import com.baidubce.services.bos.BosClientConfiguration;
import com.baidubce.services.bos.model.BosObjectSummary;
import com.baidubce.services.bos.model.BucketSummary;
import com.baidubce.services.bos.model.ListObjectsRequest;
import com.baidubce.services.bos.model.ListObjectsResponse;
import com.baidubce.services.bos.model.ObjectMetadata;
import com.baidubce.services.bos.model.PutObjectResponse;

public final class BosUtils {

	// 必须指定，否则获取Object会报404，如果不是北京地区的
	public static final String ENDPOINT = "http://gz.bcebos.com"; 
	public static final String DEFAULT_BUCKET_NAME = "pkusoft";

	public static BosClient client;

	static {
		// 初始化一个BosClient
		BosClientConfiguration config = new BosClientConfiguration();
		config.setCredentials( new DefaultBceCredentials( BaiduCloud.ACCESS_KEY_ID, BaiduCloud.SECRET_ACCESS_KEY ) );
		config.setEndpoint( ENDPOINT );
		client = new BosClient( config );
	}

	public static void setClient() {
		// 初始化一个BosClient
		BosClientConfiguration config = new BosClientConfiguration();
		config.setCredentials( new DefaultBceCredentials( BaiduCloud.ACCESS_KEY_ID, BaiduCloud.SECRET_ACCESS_KEY ) );
		config.setEndpoint( ENDPOINT );
		client = new BosClient( config );
	}
	
	private static BucketSummary getBucketByName( String bucketName ) {

		Assert.hasText( bucketName );

		// 获取用户的Bucket列表
		List<BucketSummary> buckets = client.listBuckets().getBuckets();

		// 遍历Bucket
		for ( BucketSummary bucket : buckets ) {
			if ( bucketName.equals( bucket.getName() ) ) {
				return bucket;
			}
		}
		return null;
	}

	/**
	 * 上传文件
	 * 
	 * @param objectName
	 * @param byteArray
	 * @return 文件标识
	 */
	public static String putObject( String objectName, byte[] byteArray, String contentType ) {

		// 初始化上传输入流
		ObjectMetadata meta = new ObjectMetadata();

		// 设置ContentType
		meta.setContentType( contentType ); // "text/xml", "application/json" 
		
		// 以二进制串上传Object
		PutObjectResponse putObjectResponseFromByte = client.putObject( DEFAULT_BUCKET_NAME, objectName, byteArray, meta );

		return putObjectResponseFromByte.getETag();
	}
	public static String putObject( String objectName, String content, String contentType ) {
		
		// 初始化上传输入流
		ObjectMetadata meta = new ObjectMetadata();
		
		// 设置ContentType
		meta.setContentType( contentType ); // "text/xml", "application/json" 
		
		// 以二进制串上传Object
		PutObjectResponse putObjectResponseFromByte = client.putObject( DEFAULT_BUCKET_NAME, objectName, content, meta );
		
		return putObjectResponseFromByte.getETag();
	}

	// 判断Bucket是否存在
	public static boolean doesBucketExist( String bucketName ) {
		// 获取Bucket的存在信息
		return client.doesBucketExist( bucketName ); // 指定Bucket名称
	}

	// 判断Bucket是否存在
	public static boolean doesObjectExist( String bucketName, String objectName ) {
		// 获取指定Bucket下的所有Object信息
		ListObjectsResponse listing = client.listObjects( DEFAULT_BUCKET_NAME );

		// 遍历所有Object
		for ( BosObjectSummary objectSummary : listing.getContents() ) {
			if ( objectName.equals( objectSummary.getKey() ) ) {
				return true;
			}
		}
		return false; 
	}


	// 列出用户所有的Bucket
	public void listBuckets() {
		// 获取用户的Bucket列表
		List<BucketSummary> buckets = client.listBuckets().getBuckets();

		// 遍历Bucket
		for ( BucketSummary bucket : buckets ) {
			System.out.println( bucket.getName() );
		}
	}

	public void listObjects() {

		// 获取指定Bucket下的所有Object信息
		ListObjectsResponse listing = client.listObjects( DEFAULT_BUCKET_NAME );

		// 遍历所有Object
		for ( BosObjectSummary objectSummary : listing.getContents() ) {
			System.out.println( "ObjectKey: " + objectSummary.getKey() );
		}

	}

	public void listAllObjects() {
		// 构造ListObjectsRequest请求
		ListObjectsRequest listObjectsRequest = new ListObjectsRequest( DEFAULT_BUCKET_NAME );

		// List Objects
		ListObjectsResponse listing = client.listObjects( listObjectsRequest );

		// 遍历所有Object
		System.out.println( "Objects:" );
		for ( BosObjectSummary objectSummary : listing.getContents() ) {
			System.out.println( objectSummary.getKey() );
		}
	}

}
