package net.pkusoft.utils;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

import net.pkusoft.model.SysDicItem;
import net.pkusoft.model.SysDicList;
import net.pkusoft.service.SysDicItemService;
import net.pkusoft.service.SysDicListService;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.util.StringUtils;

/**
 * 字典文件工具类
 *
 */
public final class DicUtils {

	
	public static byte[] convertToDicXmlBytes(String dicName, List<SysDicItem> sysDicItemList ) throws IOException {

		Element root = DocumentHelper.createElement( "data" );
		Document document = DocumentHelper.createDocument( root );
		
		ByteArrayOutputStream memoryOs = new ByteArrayOutputStream();
		
		dicName += ".xml";
		

		// <row DIC_CODE="510000" DIC_TEXT="四川省" DIC_SPELL="scs"
		// DIC_ASPELL="sichuansheng" />

		// 给根节点添加孩子节点

		for ( int i = 0, len = sysDicItemList.size(); i < len; i++ ) {
			SysDicItem sysDicItem = sysDicItemList.get( i );
			Element row = root.addElement( "row" );

			String dicCode = sysDicItem.getItemCode();
			String dicText = sysDicItem.getItemValue();
			String dicSpell = sysDicItem.getItemSpell();
			String dicAspell = sysDicItem.getItemAspell();

			row.addAttribute( "DIC_CODE", dicCode );
			row.addAttribute( "DIC_TEXT", dicText );
			row.addAttribute( "DIC_SPELL", dicSpell );
			row.addAttribute( "DIC_ASPELL", dicAspell );
		}

		// 把生成的xml文档存放在硬盘上 true代表是否换行
		OutputFormat format = new OutputFormat( "    ", true );
		format.setEncoding( "UTF-8" );// 设置编码格式

		XMLWriter xmlWriter = new XMLWriter( memoryOs, format );

		xmlWriter.write( document );
		xmlWriter.close();
		
		
		return memoryOs.toByteArray();
	}
	
	public static String convertToDicJsonString(String dicName, List<SysDicItem> sysDicItemList ) throws IOException {
	
		String content = "[";
	
		for ( int i = 0, len = sysDicItemList.size(); i < len; i++ ) {
			SysDicItem sysDicItem = sysDicItemList.get( i );
	
			String dicCode = sysDicItem.getItemCode();
			String dicText = sysDicItem.getItemValue();
			//String dicSpell = sysDicItem.getItemSpell();
			String dicAspell = sysDicItem.getItemAspell();
			
			content += "[ '" + dicCode + "', '" + dicText + "', '" + dicAspell + "' ],";
		}
	
		content = content.replaceAll( ",$", "" );
		
		content += "]";
		
		return content;
	}

	public static boolean putDicXmlToBos( String dicName, List<SysDicItem> sysDicItemList ) throws IOException {

		if ( dicName.indexOf( ".xml" ) == -1 ) {
			dicName += ".xml";
		}
		
		if ( BosUtils.doesObjectExist( BosUtils.DEFAULT_BUCKET_NAME, dicName ) ) {
			return false;
		}
		
		byte[] byteArray = convertToDicXmlBytes( dicName, sysDicItemList );	
		
		// 上传到 BOS
		String fileTag = BosUtils.putObject( dicName, byteArray, "text/xml" );
		
		if ( ! StringUtils.hasText( fileTag ) ) {
			return false;
		}
		
		return true;
	}



	private static void putAllDicToBos() throws IOException {
		ApplicationContext ac = new ClassPathXmlApplicationContext( "config/spring-common.xml" );
		SysDicItemService sysDicItemService = ( SysDicItemService ) ac.getBean( SysDicItemService.class );
		SysDicListService sysDicListService = ( SysDicListService ) ac.getBean( SysDicListService.class );
		
		List<SysDicList> sysDicListList = sysDicListService.getSysDicListList();
		
		for ( SysDicList sysDicList : sysDicListList ) {
			
			String dicName = sysDicList.getDicName();
			List<SysDicItem>  sysDicItemList = sysDicItemService.getSysDicItemList( dicName );
			
			DicUtils.putDicXmlToBos( dicName, sysDicItemList );
		}
		
	}
	private static void putCodeDicJsonToBos() throws IOException {
		ApplicationContext ac = new ClassPathXmlApplicationContext( "config/spring-common.xml" );
		SysDicItemService sysDicItemService = ( SysDicItemService ) ac.getBean( SysDicItemService.class );
			
		String dicName = "DIC_CODE";
		List<SysDicItem>  sysDicItemList = sysDicItemService.getSysDicItemList( dicName );
		
		DicUtils.putDicJsonToBos( dicName, sysDicItemList );
		
	}
	
	public static boolean putDicJsonToBos( String dicName, List<SysDicItem> sysDicItemList ) throws IOException {

		if ( dicName.indexOf( ".json" ) == -1 ) {
			dicName += ".json";
		}
		
		if ( BosUtils.doesObjectExist( BosUtils.DEFAULT_BUCKET_NAME, dicName ) ) {
			return false;
		}
		
		String content = convertToDicJsonString( dicName, sysDicItemList );
		
		// 上传到 BOS
		String fileTag = BosUtils.putObject( dicName, content, "application/json" );
		
		if ( ! StringUtils.hasText( fileTag ) ) {
			return false;
		}
		
		return true;
	}
	public static void main( String[] args ) throws IOException {
		// putAllDicToBos();
		putCodeDicJsonToBos();
	}
}
