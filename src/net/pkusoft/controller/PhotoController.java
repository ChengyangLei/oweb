package net.pkusoft.controller;

import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.pkusoft.model.Photo;
import net.pkusoft.model.SysUser;
import net.pkusoft.service.PhotoService;
import net.pkusoft.utils.JsonResult;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PhotoController {
	private Logger logger = Logger.getLogger( PhotoController.class );

	@Autowired
	private PhotoService photoService;

	@RequestMapping( "/photo/index" )
	public ModelAndView loginIndex( ModelAndView modal, HttpSession session ) {
		SysUser user = ( SysUser ) session.getAttribute( "currentUser" );
		List<Photo> photoList = photoService.getPhotoListByUserId( user.getUserId() );
		modal.setViewName( "/photo/index" );
		modal.addObject( "photoList", photoList );
		return modal;
	}

	@ResponseBody
	@RequestMapping( "/photo/dataList" )
	public List<Photo> dataList( HttpSession session ) {
		SysUser user = ( SysUser ) session.getAttribute( "currentUser" );
		List<Photo> photoList = photoService.getPhotoListByUserId( user.getUserId() );
		return photoList;
	}
	
	/**
	 * 图片文件上传
	 */
	@ResponseBody
	@RequestMapping( value = "/photo/upload", method = RequestMethod.POST )
	public JsonResult photoUpload( MultipartFile file, String category, HttpSession session ) {
		JsonResult jsonResult;
		try {
			Assert.notNull( file );
			SysUser user = ( SysUser ) session.getAttribute( "currentUser" );
			jsonResult = new JsonResult( true );
			String type = null;// 文件类型
			String fileName = file.getOriginalFilename();// 文件原名称
			type = fileName.indexOf( "." ) != -1 ? fileName.substring( fileName.lastIndexOf( "." ) + 1, fileName.length() ) : null;

			Photo photo = new Photo( user.getUserId(), fileName, type, file.getSize(), file.getBytes() );
			photo.setCategory( category );
			photoService.insert( photo );
			return jsonResult;
		} catch ( Exception e ) {
			e.printStackTrace();
			jsonResult = new JsonResult( false );
			logger.error( "图片上传失败", e );
			return jsonResult;
		}
	}

	@RequestMapping( "/photo/getPhoto" )
	@ResponseBody
	public void jbxxXpImage( Integer photoId, HttpServletResponse response ) {
		try {
			Assert.notNull( photoId );
			byte[] data = photoService.getPhotoById( photoId ).getData();
			response.setContentType( "image/jpeg" );
			OutputStream os = response.getOutputStream();
			os.write( data );
			os.close();
		} catch ( Exception e ) {
			e.printStackTrace();
			logger.error( "显示相片出错", e );
		}
	}

}
