package junit.test.codedic;

import java.io.BufferedReader;
import java.io.FileReader;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.collections.map.LinkedMap;


public class TestCodeDic {

	public static void main( String[] args ) throws Exception {

		String line = null;
		LinkedMap dataMap = new LinkedMap();
		int lineNum = 0;
		
		// 1. 读取文件
		BufferedReader br = new BufferedReader( new FileReader( "src/junit/test/codedic/DIC_CODE_SIMPLE_2.json" ) );
		
		while ( (line = br.readLine()) != null ) {
			String[] array = line.split( "," );
			String code = array[ 0 ].trim();
			String text = array[ 1 ].trim();
			dataMap.put( code, text );
			lineNum++;
		}
	
		// 省
		JSONArray provinceList = new JSONArray();
		
		for ( Object ky : dataMap.keySet() ) {
			String key = ( String ) ky;
			if ( key.lastIndexOf( "0000" ) != -1 ) { // 省	
				JSONObject province = new JSONObject();
				province.put( "code", key );
				province.put( "text", dataMap.get( key ) );
				
				provinceList.add( province );
			}
		}
		
		// 市
		for ( int i = 0; i < provinceList.size(); i++ ) {
			JSONObject province = ( JSONObject ) provinceList.get( i );
			JSONArray cityList = new JSONArray();
			
			String code = ( String ) province.get( "code" );
			String preCode = code.substring( 0, 2 );
			String reg = "^" + preCode + "[0-9]{2}00$";
			
			for ( Object ky : dataMap.keySet() ) { 
				String key = ( String ) ky;
				if ( key.matches( reg ) && key.lastIndexOf( "0000" ) == -1) { 
					JSONObject city = new JSONObject();
					city.put( "code", key );
					city.put( "text", dataMap.get( key ) );
					
					cityList.add( city );
				}
			}
			province.put( "cityList", cityList );
			
		}
		// 县/区
		
		for ( int i = 0; i < provinceList.size(); i++ ) {
			JSONObject province = ( JSONObject ) provinceList.get( i );
			JSONArray cityList = ( JSONArray ) province.get( "cityList" );
			for ( int j = 0; j < cityList.size(); j++ ) {
				JSONObject city = ( JSONObject ) cityList.get( j );
				JSONArray districtList = new JSONArray();
				
				String code = ( String ) city.get( "code" );
				String preCode = code.substring( 0, 4 );
				String reg = "^" + preCode + "[0-9]{2}";
				
				for ( Object ky : dataMap.keySet() ) { 
					String key = ( String ) ky;
					if ( key.matches( reg ) && key.lastIndexOf( "00" ) == -1) { 
						JSONObject district = new JSONObject();
						district.put( "code", key );
						district.put( "text", dataMap.get( key ) );
						
						districtList.add( district );
					}
				}
				city.put( "districtList", districtList );
				
			} 
		}
		
		
		System.out.println( provinceList );
		br.close();
	}
	
}
