package net.pkusoft.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller  
public class TestController {

	@RequestMapping("/test/jquery")
	public String jquery() {
		return "/test/jquery";
	}
	
	@RequestMapping("/test/modal")
	public String modal() {
		return "/test/modal";
	}
	
	@RequestMapping("/test/tooltip")
	public String tooltip() {
		return "/test/tooltip";
	}
	
	@RequestMapping("/test/datepicker")
	public String datepicker() {
		return "/test/datepicker";
	}
	
	@RequestMapping("/test/select")
	public String select2() {
		return "/test/select";
	}
	
	
	@RequestMapping("/test/selectarea")
	public String selectarea() {
		return "/test/selectarea";
	}
	
	@RequestMapping("/test/chart")
	public String chart() {
		return "/test/chart";
	}
	
	@RequestMapping("/test/fv")
	public String fv() {
		return "/test/fv";
	}
	
	@RequestMapping("/test/upload")
	public String upload() {
		return "/test/upload";
	}
	@RequestMapping("/test/grid")
	public String grid() {
		return "/test/grid";
	}
	
}
