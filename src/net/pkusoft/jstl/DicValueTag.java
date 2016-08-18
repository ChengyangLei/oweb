package net.pkusoft.jstl;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import net.pkusoft.utils.TagUtils;

import org.springframework.util.StringUtils;

public class DicValueTag extends BodyTagSupport {
	private static final long serialVersionUID = 1L;
	private String dicName;
	private String itemCode;
	private String itemValue;
	public String getDicName() {
		return dicName;
	}
	public void setDicName(String dicName) {
		this.dicName = dicName;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemValue() {
		return itemValue;
	}
	public void setItemValue(String itemValue) {
		this.itemValue = itemValue;
	}
	
	public int doStartTag() throws JspException {
		String outValue = "";
		
		if ( ! StringUtils.hasText( dicName ) ) {
			return SKIP_BODY;
		}
		if ( ! StringUtils.hasText( itemCode ) ) {
			return SKIP_BODY;
		}
		try {
			outValue = TagUtils.getDicValue( dicName, itemCode );
			pageContext.getOut().write(outValue);
		} catch ( IOException e ) {
			e.printStackTrace();
		}
		
		return SKIP_BODY;
	}
}