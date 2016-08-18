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

public final class BosExtUtils {

	private static final String ENDPOINT = "http://gz.bcebos.com"; 
	private static final String DEFAULT_BUCKET_NAME = "pkusoft";
	private static BosClient client;

	static {
		// 初始化一个BosClient
		BosClientConfiguration config = new BosClientConfiguration();
		config.setCredentials( new DefaultBceCredentials( BaiduCloud.ACCESS_KEY_ID, BaiduCloud.SECRET_ACCESS_KEY ) );
		config.setEndpoint( ENDPOINT );
		client = new BosClient( config );
	}
	
	public static void setBosClient( String endpoint ) {
		if ( endpoint == null ) {
			endpoint = DEFAULT_BUCKET_NAME;
		}
		BosClientConfiguration config = new BosClientConfiguration();
		config.setCredentials( new DefaultBceCredentials( BaiduCloud.ACCESS_KEY_ID, BaiduCloud.SECRET_ACCESS_KEY ) );
		config.setEndpoint( endpoint );
		client = new BosClient( config );
	}
	
	public boolean doesBucketExist (BosClient client, String bucketName) {
	    // 获取Bucket的存在信息
	    boolean exists = client.doesBucketExist( bucketName );                //指定Bucket名称

	    // 输出结果
	    if (exists) {
	        System.out.println("Bucket exists");
	    } else {
	        System.out.println("Bucket not exists");
	    }
	    return exists;
	}
	
	
	
}
