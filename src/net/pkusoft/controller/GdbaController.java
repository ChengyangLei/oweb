package net.pkusoft.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import net.pkusoft.model.GdbaCompany;
import net.pkusoft.model.GdbaFaren;
import net.pkusoft.model.GdbaFarenResume;
import net.pkusoft.model.GdbaFuzeren;
import net.pkusoft.model.GdbaGd;
import net.pkusoft.model.Photo;
import net.pkusoft.model.SysUser;
import net.pkusoft.service.GdbaCompanyService;
import net.pkusoft.service.GdbaFarenResumeService;
import net.pkusoft.service.GdbaFarenService;
import net.pkusoft.service.GdbaFuzerenService;
import net.pkusoft.service.GdbaGdService;
import net.pkusoft.service.PhotoService;
import net.pkusoft.service.SysUserService;
import net.pkusoft.utils.JsonResult;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GdbaController {

	private Logger logger = Logger.getLogger( GdbaController.class );

	@Autowired
	private GdbaCompanyService gdbaCompanyService;
	@Autowired
	private GdbaGdService gdbaGdService;
	@Autowired
	private GdbaFarenService gdbaFarenService;
	@Autowired
	private GdbaFuzerenService gdbaFuzerenService;
	@Autowired
	private GdbaFarenResumeService gdbaFarenResumeService;
	@Autowired
	private PhotoService photoService;
	@Autowired
    private SysUserService sysUserService;

	/**
	 * 同意页面 
	 */
	@RequestMapping( "/gdba/anno/reg/agreement" )
	public ModelAndView agreement( ModelAndView model ) {
		model.setViewName( "/gdba/reg/agreement" );
		return model;
	}
	/**
	 * 输入业务流水号页面 - index 
	 */
	@RequestMapping( "/gdba/anno/reg/bizcode" )
	public ModelAndView bizcode( ModelAndView model ) {
		model.setViewName( "/gdba/reg/bizcode" );
		return model;
	}
	
	/**
	 * 输入业务流水号页面 - 开始一个新的申请
	 */
	@RequestMapping("/gdba/anon/bizcode/start")
	public String startNew( HttpSession session ) {
		
		if ( session.getAttribute( "currentUser" ) != null ) {
			Subject subject = SecurityUtils.getSubject();
			if (subject.isAuthenticated()) {
				subject.logout(); // session 会销毁，在SessionListener监听session销毁，清理权限缓存
			}
		}
		
		SysUser sysUser = new SysUser();
		sysUser.setLoginName( ( new Date() ).getTime() + "" );
		sysUser.setUserName( "anno" );
		sysUser.setPassword( "a" );
		sysUserService.insert( sysUser );
		
		SysUser realSysUser = sysUserService.validateLogin( sysUser );
		if ( realSysUser.getUserId() == null ) {
			throw new RuntimeException();
		}
		SysUserController.processToken( sysUser );
		return "redirect:/gdba/reg/index";
	}
	
	/** 
	 * 输入业务流水号页面 - 未完成的业务 - 验证业务流水号的合法性
	 */
	@ResponseBody
	@RequestMapping("/gdba/anon/validate/bizcode")
	public net.pkusoft.model.JsonResult validateBizcode(SysUser sysUser) {
		net.pkusoft.model.JsonResult jsonResult = new net.pkusoft.model.JsonResult();
		try {
			Assert.notNull( sysUser );
			
			// 如果已经已经登陆，则注销。
			Subject subject = SecurityUtils.getSubject();
			if (subject.isAuthenticated()) {
				subject.logout(); // session 会销毁，在SessionListener监听session销毁，清理权限缓存
			}
			
			SysUser realSysUser = sysUserService.validateLogin( sysUser );
			if ( realSysUser.getUserId() == null ) {
				throw new RuntimeException();
			}
			if ( realSysUser.getStatus() != null ) { // status 为 null，说明业务未完成
				throw new RuntimeException();
			}
			
			SysUserController.processToken( sysUser );
			jsonResult.setSuccess( true );
			return jsonResult;
		} catch ( Exception e ) {
			logger.error( "登陆失败" );
			e.printStackTrace();
			jsonResult.setSuccess( false );
			jsonResult.setMessage( "非法的业务流水号" );
			return jsonResult;
		}
	}
	
	
	/**
	 *  业务提交-提交
	 */
	@RequestMapping( "/gdba/reg/biz/submit" )
	@ResponseBody
	public JsonResult submitBiz( Integer bizCode, HttpSession session) {
		JsonResult JsonResult = new JsonResult( true );
		SysUser sysUser = ( SysUser ) session.getAttribute( "currentUser" );
		try {
			// 更改状态
			sysUser.setStatus( "9" );
			sysUserService.update( sysUser );
		} catch ( Exception e ) {
			e.printStackTrace();
			logger.error( "业务提交出错" );
			JsonResult.setSuccess( false );
			return JsonResult;
		}
		return JsonResult;
	}
	
	/**
	 *  业务提交-成功
	 */
	@RequestMapping( "/gdba/reg/biz/success" )
	public ModelAndView submitBizSuccess( Integer bizCode, ModelAndView model ) {
		try {
			model.setViewName( "/gdba/reg/success" );
		} catch ( Exception e ) {
			e.printStackTrace();
			logger.error( "业务提交出错" );
		}
		return model;
	}
	
	
	/**
	 * index.jsp 主要作为框架，
	 * 根据当前用户，获取相关的 保安公司、法人、负责人 信息，
	 * 如果有相关信息，则包含详情页，否则包含编辑页
	 */
	@RequestMapping( "/gdba/reg/index" )
	public ModelAndView index( ModelAndView model, HttpSession session ) {
		GdbaCompany gdbaCompany = null;
		GdbaFaren gdbaFaren = null;
		Integer userId = null;
		List<GdbaFarenResume> gdbaFarenResumeList = null;
		List<GdbaFuzeren> gdbaFuzerenList = null;
		List<Photo> photoList = null;
		List<GdbaGd> gdbaGdList = null;
		
		
		gdbaCompany = this.getGdbaCompany( session );
		
		if ( gdbaCompany != null ) {
			gdbaGdList = this.getGdbaGd( session );
			gdbaFaren = this.getGdbaFaren( session );
			userId = gdbaCompany.getUserId();
		}
		
		if ( gdbaFaren != null && gdbaFaren.getFarenId() != null ) {
			gdbaFarenResumeList = gdbaFarenResumeService.getGdbaFarenResumeByFarenId( gdbaFaren.getFarenId() );
		}
		
		
		gdbaFuzerenList = gdbaFuzerenService.getGdbaFuzerenByUserId( userId );
		
		photoList = photoService.getPhotoListByUserId( userId );
		List<Photo> companyPhotoList01 = new ArrayList<Photo>();
		List<Photo> companyPhotoList02 = new ArrayList<Photo>();
		List<Photo> companyPhotoList03 = new ArrayList<Photo>();
		List<Photo> companyPhotoList04 = new ArrayList<Photo>();
		List<Photo> companyPhotoList05 = new ArrayList<Photo>();
		List<Photo> companyPhotoList06 = new ArrayList<Photo>();
		List<Photo> companyPhotoList07 = new ArrayList<Photo>();
		List<Photo> companyPhotoList08 = new ArrayList<Photo>();
		List<Photo> companyPhotoList09 = new ArrayList<Photo>();
		List<Photo> companyPhotoList10 = new ArrayList<Photo>();
		List<Photo> companyPhotoList11 = new ArrayList<Photo>();
		List<Photo> companyPhotoList12 = new ArrayList<Photo>();
		for ( Photo photo : photoList ) {
			if ( "01".equals( photo.getCategory() ) ) { companyPhotoList01.add( photo ); }
			if ( "02".equals( photo.getCategory() ) ) { companyPhotoList02.add( photo ); }
			if ( "03".equals( photo.getCategory() ) ) { companyPhotoList03.add( photo ); }
			if ( "04".equals( photo.getCategory() ) ) { companyPhotoList04.add( photo ); }
			if ( "05".equals( photo.getCategory() ) ) { companyPhotoList05.add( photo ); }
			if ( "06".equals( photo.getCategory() ) ) { companyPhotoList06.add( photo ); }
			if ( "07".equals( photo.getCategory() ) ) { companyPhotoList07.add( photo ); }
			if ( "08".equals( photo.getCategory() ) ) { companyPhotoList08.add( photo ); }
			if ( "09".equals( photo.getCategory() ) ) { companyPhotoList09.add( photo ); }
			if ( "10".equals( photo.getCategory() ) ) { companyPhotoList10.add( photo ); }
			if ( "11".equals( photo.getCategory() ) ) { companyPhotoList11.add( photo ); }
			if ( "12".equals( photo.getCategory() ) ) { companyPhotoList12.add( photo ); }
		}
		
		// 保安服务公司 - 基本信息
		model.addObject( "gdbaCompany", gdbaCompany );
		
		// 保安服务公司 - 股东信息
		model.addObject( "gdbaGdList", gdbaGdList );
		
		// 保安服务公司 - 附件
		model.addObject( "companyPhotoList01", companyPhotoList01 );
		model.addObject( "companyPhotoList02", companyPhotoList02 );
		model.addObject( "companyPhotoList03", companyPhotoList03 );
		model.addObject( "companyPhotoList04", companyPhotoList04 );
		
		// 法定代表人 - 基本信息
		model.addObject( "gdbaFaren", gdbaFaren );

		// 法定代表人 - 简历
		model.addObject( "gdbaFarenResumeList", gdbaFarenResumeList );

		// 法定代表人 - 附件
		model.addObject( "companyPhotoList05", companyPhotoList05 );
		model.addObject( "companyPhotoList06", companyPhotoList06 );
		model.addObject( "companyPhotoList07", companyPhotoList07 );
		model.addObject( "companyPhotoList08", companyPhotoList08 );
		
		// 主要负责人 - 基本信息
		model.addObject( "gdbaFuzerenList", gdbaFuzerenList );
		
		// 主要负责人 - 附件
		model.addObject( "companyPhotoList09", companyPhotoList09 );
		model.addObject( "companyPhotoList10", companyPhotoList10 );
		model.addObject( "companyPhotoList11", companyPhotoList11 );
		model.addObject( "companyPhotoList12", companyPhotoList12 );
		
		model.setViewName( "/gdba/reg/index" );
		return model;
	}
	
	/** 保安服务公司 - 基本信息
	 * @param type "edit" / "detail"
	 */
	@RequestMapping( "/gdba/reg/template/company_info" )
	public ModelAndView companyInfo( String type, ModelAndView model , HttpSession session ) {
		GdbaCompany gdbaCompany = this.getGdbaCompany( session );
		model.addObject( "gdbaCompany", gdbaCompany );
		model.setViewName( "/gdba/reg/template/company_info_" + type );
		return model;
	}

	/** 保安服务公司 - 股东信息
	 * @param type "edit" / "detail"
	 */
	@RequestMapping( "/gdba/reg/template/company/gd" )
	public ModelAndView companyGd( String type, String category, Integer id, ModelAndView model , HttpSession session ) {
		GdbaGd gdbaGd = new GdbaGd();
		if ( id != null ) {
			gdbaGd = gdbaGdService.getGdbaGdById( id );
		}
		model.addObject( "gdbaGd", gdbaGd );
		model.setViewName( "/gdba/reg/template/company_gd_" + category + "_" + type );
		return model;
	}

	
	/** 法定代表人 - 基本信息
	 * @param type "edit" / "detail"
	 */
	@RequestMapping( "/gdba/reg/template/faren_info" )
	public ModelAndView farenInfo( String type, ModelAndView model , HttpSession session ) {
		GdbaFaren gdbaFaren = this.getGdbaFaren( session );
		model.addObject( "gdbaFaren", gdbaFaren );
		model.setViewName( "/gdba/reg/template/faren_info_" + type );
		return model;
	}
	
	/**
	 *  删除：法定代表人 - 简历
	 */
	@RequestMapping( "/gdba/reg/faren/resume/delete" )
	@ResponseBody
	public JsonResult deleteFarenResume( Integer id ) {
		JsonResult JsonResult = new JsonResult( true );
		try {
			gdbaFarenResumeService.delete( id );
		} catch ( Exception e ) {
			e.printStackTrace();
			logger.error( "删除 gdbaFarenResume 出错" );
			JsonResult.setSuccess( false );
			return JsonResult;
		}
		return JsonResult;
	}
	
	/**
	 *  保存：法定代表人 - 简历
	 */
	@RequestMapping( "/gdba/reg/saveFarenResume" )
	@ResponseBody
	public JsonResult saveFarenResume( GdbaFarenResume gdbaFarenResume, HttpSession session) {
		JsonResult JsonResult = new JsonResult( true );
		Integer resumeId = gdbaFarenResume.getResumeId();
		GdbaFaren gdbaFaren = this.getGdbaFaren( session );
		gdbaFarenResume.setFarenId( gdbaFaren.getFarenId() );
		try {
			if ( resumeId == null ) { // insert 	
				gdbaFarenResumeService.insert( gdbaFarenResume );
			} else { // update
				gdbaFarenResumeService.update( gdbaFarenResume );
			}
			JsonResult.setData( gdbaFarenResume.getResumeId() + "" );	
		} catch ( Exception e ) {
			e.printStackTrace();
			logger.error( "插入 gdbaFarenResume 出错" );
			JsonResult.setSuccess( false );
			return JsonResult;
		}
		return JsonResult;
	}
	
	/**
	 *  保存：法定代表人 - 基本信息
	 */
	@RequestMapping( "/gdba/reg/saveFaren" )
	@ResponseBody
	public JsonResult saveFaren( GdbaFaren gdbaFaren, HttpSession session) {
		JsonResult JsonResult = new JsonResult( true );
		Integer farenId = gdbaFaren.getFarenId();
		SysUser user = ( SysUser ) session.getAttribute( "currentUser" );
		gdbaFaren.setUserId( user.getUserId() );
		try {
			if ( farenId == null ) { // insert 	
				gdbaFarenService.insert( gdbaFaren );
			} else { // update
				gdbaFarenService.update( gdbaFaren );
			}
			JsonResult.setData( gdbaFaren.getFarenId() + "" );	
		} catch ( Exception e ) {
			e.printStackTrace();
			logger.error( "插入 gdbaFaren 出错" );
			JsonResult.setSuccess( false );
			return JsonResult;
		}
		return JsonResult;
	}
	
	/**
	 *  保存：保安服务公司 - 基本信息
	 */
	@RequestMapping( "/gdba/reg/saveCompany" )
	@ResponseBody
	public JsonResult saveCompany( GdbaCompany gdbaCompany, HttpSession session) {
		JsonResult JsonResult = new JsonResult( true );
		Integer gsbm = gdbaCompany.getGsbm();
		SysUser user = ( SysUser ) session.getAttribute( "currentUser" );
		gdbaCompany.setUserId( user.getUserId() );
		try {
			if ( gsbm == null ) { // insert 	
				gdbaCompanyService.insert( gdbaCompany );
			} else { // update
				gdbaCompanyService.update( gdbaCompany );
			}
			JsonResult.setData( gdbaCompany.getGsbm() + "" );	
		} catch ( Exception e ) {
			e.printStackTrace();
			logger.error( "插入 gdbaCompany 出错" );
			JsonResult.setSuccess( false );
			return JsonResult;
		}
		return JsonResult;
	}
	
	/** 保安服务公司 - 股东信息
	 * @param type "edit" / "detail"
	 */
	@RequestMapping( "/gdba/reg/template/faren/resume" )
	public ModelAndView farenResume( String type, Integer id, ModelAndView model , HttpSession session ) {
		GdbaFarenResume gdbaFarenResume = new GdbaFarenResume();
		if ( id != null ) {
			gdbaFarenResume = gdbaFarenResumeService.getGdbaFarenResumeById( id );
		}
		model.addObject( "gdbaFarenResume", gdbaFarenResume );
		model.setViewName( "/gdba/reg/template/faren_resume_" + type );
		return model;
	}
	
	/**
	 *  保存：保安服务公司 - 股东信息
	 */
	@RequestMapping( "/gdba/reg/saveGd" )
	@ResponseBody
	public JsonResult saveCompanyGd( GdbaGd gdbaGd, HttpSession session) {
		JsonResult JsonResult = new JsonResult( true );
		Integer gdId = gdbaGd.getGdId();
		
		try {
			if ( gdId == null ) { // insert 	
				SysUser user = ( SysUser ) session.getAttribute( "currentUser" );
				Integer userId = user.getUserId();
				GdbaCompany gdbaCompany = gdbaCompanyService.getGdbaCompanyByUserId( userId );
				gdbaGd.setGsbm( gdbaCompany.getGsbm() );
				gdbaGdService.insert( gdbaGd );
			} else { // update
				gdbaGdService.update( gdbaGd );
			}
			JsonResult.setData( gdbaGd.getGdId() + "" );	
		} catch ( Exception e ) {
			e.printStackTrace();
			logger.error( "插入 gdbaGd 出错" );
			JsonResult.setSuccess( false );
			return JsonResult;
		}
		return JsonResult;
	}
	
	/**
	 *  删除：保安服务公司 - 股东信息
	 */
	@RequestMapping( "/gdba/reg/gd/delete" )
	@ResponseBody
	public JsonResult deleteCompanyGd( Integer id ) {
		JsonResult JsonResult = new JsonResult( true );
		try {
			gdbaGdService.delete( id );
		} catch ( Exception e ) {
			e.printStackTrace();
			logger.error( "删除 gdbaGd 出错" );
			JsonResult.setSuccess( false );
			return JsonResult;
		}
		return JsonResult;
	}
	
	/** 主要负责人 - 基本信息
	 * @param type "edit" / "detail"
	 */
	@RequestMapping( "/gdba/reg/template/fuzeren_info" )
	public ModelAndView fuzeren( String type, Integer id, ModelAndView model , HttpSession session ) {
		GdbaFuzeren gdbaFuzeren = new GdbaFuzeren();
		if ( id != null ) {
			gdbaFuzeren = gdbaFuzerenService.getGdbaFuzerenById( id );
		}
		model.addObject( "gdbaFuzeren", gdbaFuzeren );
		model.setViewName( "/gdba/reg/template/fuzeren_info_" + type );
		return model;
	}
	
	/**
	 *  保存：主要负责人 - 基本信息
	 */
	@RequestMapping( "/gdba/reg/saveFuzeren" )
	@ResponseBody
	public JsonResult saveFuzeren( GdbaFuzeren gdbaFuzeren, HttpSession session) {
		JsonResult JsonResult = new JsonResult( true );
		Integer fuzerenId = gdbaFuzeren.getFuzerenId();
		
		try {
			if ( fuzerenId == null ) { // insert 	
				SysUser user = ( SysUser ) session.getAttribute( "currentUser" );
				Integer userId = user.getUserId();
				gdbaFuzeren.setUserId( userId );
				gdbaFuzerenService.insert( gdbaFuzeren );
			} else { // update
				gdbaFuzerenService.update( gdbaFuzeren );
			}
			JsonResult.setData( gdbaFuzeren.getFuzerenId() + "" );	
		} catch ( Exception e ) {
			e.printStackTrace();
			logger.error( "插入 gdbaFuzeren 出错" );
			JsonResult.setSuccess( false );
			return JsonResult;
		}
		return JsonResult;
	}
	
	/**
	 *  删除：主要负责人 - 基本信息
	 */
	@RequestMapping( "/gdba/reg/fuzeren/delete" )
	@ResponseBody
	public JsonResult deleteGdbaFuzeren( Integer id ) {
		JsonResult JsonResult = new JsonResult( true );
		try {
			gdbaFuzerenService.delete( id );
		} catch ( Exception e ) {
			e.printStackTrace();
			logger.error( "删除 gdbaFuzeren 出错" );
			JsonResult.setSuccess( false );
			return JsonResult;
		}
		return JsonResult;
	}
	
	/**
	 * 验证业务数据的完整性 
	 */
	@RequestMapping( "/gdba/reg/info" )
	@ResponseBody
	public net.pkusoft.model.JsonResult getInfoCompleteness( HttpSession session ) {
		boolean item_0 = false,
				item_1 = false,
				item_2 = false, item_2_1 = false, item_2_2 = false, item_2_3 = false, item_2_4 = false,
				item_3 = false,
				item_4 = false,
				item_5 = false, item_5_1 = false, item_5_2 = false, item_5_3 = false, item_5_4 = false,
				item_6 = false,
				item_7 = false, item_7_1 = false, item_7_2 = false, item_7_3 = false, item_7_4 = false
				;
		
		net.pkusoft.model.JsonResult jsonResult = new net.pkusoft.model.JsonResult( true );
		Integer userId = null;
		GdbaCompany gdbaCompany = null;
		List<GdbaGd> gdbaGdList = null;
		List<Photo> photoList = null;
		GdbaFaren gdbaFaren = null;
		List<GdbaFarenResume> gdbaFarenResumeList = null;
		List<GdbaFuzeren> gdbaFuzerenList = null;
		try {
			userId = ( ( SysUser ) session.getAttribute( "currentUser" ) ).getUserId();
			gdbaCompany = gdbaCompanyService.getGdbaCompanyByUserId( userId );
			if ( gdbaCompany != null && gdbaCompany.getGsbm() != null ) {
				gdbaGdList = gdbaGdService.getGdbaGdByGsbm( gdbaCompany.getGsbm() );
			}
			photoList = photoService.getPhotoListByUserId( userId );
			
			for ( Photo photo : photoList ) {
				String category = photo.getCategory();
				switch( category ) {
					case "01": item_2_1 = true; break;
					case "02": item_2_2 = true; break;
					case "03": item_2_3 = true; break;
					case "04": item_2_4 = true; break;
					case "05": item_5_1 = true; break;
					case "06": item_5_2 = true; break;
					case "07": item_5_3 = true; break;
					case "08": item_5_4 = true; break;
					case "09": item_7_1 = true; break;
					case "10": item_7_2 = true; break;
					case "11": item_7_3 = true; break;
					case "12": item_7_4 = true; break;
				}
			}
			
			gdbaFaren = gdbaFarenService.getGdbaFarenByUserId( userId );
			
			if ( gdbaFaren != null ) {
				gdbaFarenResumeList = gdbaFarenResumeService.getGdbaFarenResumeByFarenId( gdbaFaren.getFarenId() ); 
			}
			
			gdbaFuzerenList = gdbaFuzerenService.getGdbaFuzerenByUserId( userId );
			
			// 0 - 保安服务公司 / 基本信息
			if ( gdbaCompany != null ) {
				item_0 = true;
			}
			
			// 1 - 保安服务公司 / 股东信息
			if ( gdbaGdList != null && gdbaGdList.size() > 0 ) {
				item_1 = true;
			} 
			
			// 2 - 保安服务公司 / 附件
			if ( item_2_1 && item_2_2 && item_2_3 && item_2_4) {
				item_2 = true;
			}
			
			// 3 - 法定代表人 / 基本信息
			if ( gdbaFaren != null ) {
				item_3 = true;
			}
			// 4 - 法定代表人 / 简历
			if ( gdbaFarenResumeList != null && gdbaFarenResumeList.size() > 0 ) {
				item_4 = true;
			}
			// 5 - 法定代表人 / 附件
			if ( item_5_1 && item_5_2 && item_5_3 && item_5_4) {
			    item_5 = true;
			}
			
			// 6 - 主要负责人 / 基本信息
			if ( gdbaFuzerenList != null && gdbaFuzerenList.size() > 0 ) {
				item_6 = true;
			}
			
			// 7 - 主要负责人 / 附件
			if ( item_7_1 && item_7_2 && item_7_3 && item_7_4) {
			    item_7 = true;
			}
			
			boolean[] data = { item_0, item_1, item_2, item_3, item_4, item_5, item_6, item_7 };
			
			jsonResult.setData( data );
		} catch ( Exception e ) {
			jsonResult.setSuccess( false );
			return jsonResult;
		}
		return jsonResult;
	}

	
	
	
	//---------
	
	private GdbaFaren getGdbaFaren( HttpSession session ) {
		SysUser user = ( SysUser ) session.getAttribute( "currentUser" );
		Integer userId = user.getUserId();
		GdbaFaren gdbaFaren = gdbaFarenService.getGdbaFarenByUserId( userId );
		return gdbaFaren;
	}

	private List<GdbaGd> getGdbaGd( HttpSession session ) {
		SysUser user = ( SysUser ) session.getAttribute( "currentUser" );
		Integer userId = user.getUserId();
		GdbaCompany gdbaCompany = gdbaCompanyService.getGdbaCompanyByUserId( userId );
		List<GdbaGd> gdbaGdList = gdbaGdService.getGdbaGdByGsbm( gdbaCompany.getGsbm() );
		return gdbaGdList;
	}

	private GdbaCompany getGdbaCompany( HttpSession session ) {
		SysUser user = ( SysUser ) session.getAttribute( "currentUser" );
		Integer userId = user.getUserId();
		GdbaCompany gdbaCompany = gdbaCompanyService.getGdbaCompanyByUserId( userId );
		return gdbaCompany;
	}
	
}
