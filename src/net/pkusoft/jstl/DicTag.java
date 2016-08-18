package net.pkusoft.jstl;

import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import net.pkusoft.model.SysDicItem;
import net.pkusoft.utils.TagUtils;

import org.springframework.util.StringUtils;

public class DicTag extends BodyTagSupport {
	private static final long serialVersionUID = 1L;
	private String dicName;
	private String var;

	public String getDicName() {
		return dicName;
	}
	public void setDicName(String dicName) {
		this.dicName = dicName;
	}
	public String getVar() {
		return var;
	}
	public void setVar(String var) {
		this.var = var;
	}
	
	public int doStartTag() throws JspException {
		if(StringUtils.hasText(dicName) && StringUtils.hasText(var)){
			List<SysDicItem> list = TagUtils.getDicItemList(dicName);
			pageContext.setAttribute(var, list);
		}
		
		return EVAL_BODY_INCLUDE;
	}
	
	public int doEndTag() throws JspException {
		if(StringUtils.hasText(var)){
			pageContext.removeAttribute(var);
		}
		return EVAL_PAGE;
	}
}