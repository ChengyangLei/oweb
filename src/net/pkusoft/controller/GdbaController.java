package net.pkusoft.controller;

import javax.servlet.http.HttpSession;

import net.pkusoft.model.GdbaCompany;
import net.pkusoft.model.SysUser;
import net.pkusoft.service.GdbaCompanyService;
import net.pkusoft.utils.JsonResult;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GdbaController {

	private Logger logger = Logger.getLogger( GdbaController.class );

	@Autowired
	private GdbaCompanyService gdbaCompanyService;

	/**
	 * index.jsp 主要作为框架，
	 * 根据当前用户，获取相关的 保安公司、法人、负责人 信息，
	 * 如果有相关信息，则包含详情页，否则包含编辑页
	 */
	@RequestMapping( "/gdba/reg/index" )
	public ModelAndView index( ModelAndView model, HttpSession session ) {
		String companyPage = "company_edit";
		SysUser user = ( SysUser ) session.getAttribute( "currentUser" );
		Integer userId = user.getUserId();
		
		GdbaCompany gdbaCompany = gdbaCompanyService.getGdbaCompanyByUserId( userId );
		
		if ( gdbaCompany != null && gdbaCompany.getGsbm() != null ) {
			companyPage = "company_detail";
		}
		
		model.addObject( "companyPage", companyPage );
		model.addObject( "gdbaCompany", gdbaCompany );

		model.setViewName( "/gdba/reg/index" );
		return model;
	}

	@RequestMapping( "/gdba/reg/company/fragement" )
	public ModelAndView editTemplate( String type, ModelAndView model , HttpSession session ) {
		SysUser user = ( SysUser ) session.getAttribute( "currentUser" );
		Integer userId = user.getUserId();
		GdbaCompany gdbaCompany = gdbaCompanyService.getGdbaCompanyByUserId( userId );
		model.addObject( "gdbaCompany", gdbaCompany );
		if ( "edit".equals( type ) ) {
			model.setViewName( "/gdba/reg/company_edit" );
		}
		if ( "detail".equals( type ) ) {
			model.setViewName( "/gdba/reg/company_detail" );
		}
		return model;
	}


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

}
