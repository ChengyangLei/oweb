package net.pkusoft.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import net.pkusoft.service.SysDicItemService;
import net.pkusoft.service.SysDicListService;
import net.pkusoft.service.impl.SysDicItemServiceImpl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller  
public class SysDicController {
	private Logger logger = Logger.getLogger( SysDicController.class );

	@Autowired
    private SysDicListService sysDicListService;
	@Autowired
	private SysDicItemService sysDicItemService;  
	
	@ResponseBody
	@RequestMapping("/getDicByName")
	public void getData(String dicName, HttpServletResponse response) {
		response.setContentType("application/xml");  
		try {
			response.getOutputStream().write( sysDicItemService.getSysDicBytesByDicName( dicName ) );
		} catch ( IOException e ) {
			logger.error( "获取字典失败" );
			e.printStackTrace();
		}
	}
	
	
}
