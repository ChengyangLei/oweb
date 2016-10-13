package junit.test;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;

import net.pkusoft.model.GdbaCompany;
import net.pkusoft.model.Photo;
import net.pkusoft.model.SysUser;
import net.pkusoft.service.DatagridService;
import net.pkusoft.service.GdbaCompanyService;
import net.pkusoft.service.PhotoService;
import net.pkusoft.service.SysDicItemService;
import net.pkusoft.service.SysDicListService;
import net.pkusoft.service.SysUserService;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestSpringAndMyBatis {

	private static ApplicationContext ac = null;
	
	@Before
	public void before() {
		ac = new ClassPathXmlApplicationContext( "config/spring-common.xml" );
	}

	@Test
	public void test_datagrid() {
		DatagridService datagridService = ( DatagridService ) ac.getBean( DatagridService.class );
		System.out.println( datagridService.getTotalNum() );
	}
	@Test
	public void test_gdbaCompany() {
		GdbaCompanyService gdbaCompanyService = ( GdbaCompanyService ) ac.getBean( GdbaCompanyService.class );
		System.out.println( gdbaCompanyService.getTotalNum() );
	}
	@Test
	public void test_sysDicList() {
		SysDicListService sysDicListService = ( SysDicListService ) ac.getBean( SysDicListService.class );
		System.out.println( sysDicListService.getTotalNum() );
		System.out.println( sysDicListService.getSysDicListById( "DIC_CODE" ).getDicDesc() );
		System.out.println( sysDicListService.getSysDicListList().get(0).getDicName() );
	}
	@Test
	public void test_sysDicItem() {
		SysDicItemService sysDicItemService = ( SysDicItemService ) ac.getBean( SysDicItemService.class );
		System.out.println( sysDicItemService.getTotalNum() );
		System.out.println( sysDicItemService.getSysDicItemById( 10 ).getDicName() );
		System.out.println( sysDicItemService.getSysDicItemList("DIC_CODE").get(0).getItemValue() );
	}
	@Test
	public void test_gdbaCompanyService() {
		GdbaCompanyService gdbaCompanyService = ( GdbaCompanyService ) ac.getBean( GdbaCompanyService.class );
		GdbaCompany gdbaCompany = new GdbaCompany();
		gdbaCompany.setGsmc("1");
		gdbaCompany.setGsxz("1");
		gdbaCompany.setGlrs(1);
		gdbaCompany.setZczj(1);
		gdbaCompany.setYyzz("1");
		gdbaCompany.setGsdzssxq("1");
		gdbaCompany.setGsdzxz("1");
		gdbaCompany.setGsxqpcs("1");
		gdbaCompany.setJyfw("1");
		
		GdbaCompany gdbaCompany2 = new GdbaCompany();
		gdbaCompany2.setGsbm(10);
		gdbaCompany2.setGsmc("公司");
		gdbaCompany2.setGsxz("性质");
		gdbaCompanyService.update( gdbaCompany2 );
		//gdbaCompanyService.insert( gdbaCompany );
		//System.out.println( gdbaCompany.getGsbm() ); 
	}
	@Test
	public void test_sysUserService() {
		SysUserService sysUserService = ac.getBean( SysUserService.class );
		SysUser sysUser = new SysUser( "zhangsan", "123", "张三", "1" );	
		sysUser = sysUserService.validateLogin( sysUser );
		System.out.println( sysUser.getUserId() );
	}
	@Test
	public void test_sysUserServiceUpdate() {
		SysUserService sysUserService = ac.getBean( SysUserService.class );
		SysUser sysUser = sysUserService.getSysUserById( 10 );
		sysUser.setStatus( "9" );
		sysUserService.update( sysUser );
	}
	@Test
	public void test_photoService() throws Exception {
		PhotoService photoService = ac.getBean( PhotoService.class );
		String path = "/Users/forwardNow/Downloads/201608/coin-yuan.png";
		String path2 = "/Users/forwardNow/Downloads/201608/coin-yuan2.png";
		File f = new File( path );
		byte[] buffer = new byte[ 1024 ];   // 1KB 
		int readLength = 0;
		FileInputStream fis = new FileInputStream( f );
		ByteArrayOutputStream memoryOs = new ByteArrayOutputStream();
		while ((readLength=fis.read(buffer))!=-1) {  //numberRead的目的在于防止最后一次读取的字节小于buffer长度，  
			memoryOs.write(buffer, 0, readLength);       //否则会自动被填充0  
        }  
		
		byte[] data = memoryOs.toByteArray() ;
		
		Photo photo = new Photo();
		photo.setName( f.getName() );
		photo.setSize( f.getTotalSpace() / 1024 );
		photo.setType( "jpg" );
		photo.setUserId( 0 );
		photo.setData( data );
		
		//photoService.insert( photo );
		
		
		Photo photoWithData = photoService.getPhotoDataById( 1 );
		FileOutputStream fos = new FileOutputStream( new File( path2 ) );
		fos.write( photoWithData.getData() );
		
		fis.close();
		fos.close();
	}
	@Test
	public void test_photoService_2() throws Exception {
		PhotoService photoService = ac.getBean( PhotoService.class );
		List<Photo> photoList = photoService.getPhotoListByUserIdAndCategory( 2, "01");
		for( Photo photo : photoList ) {
			System.out.println( photo.getName() );
		}
	}
	
}
