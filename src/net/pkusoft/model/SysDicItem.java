package net.pkusoft.model;

public class SysDicItem {

	/*
	`ITEM_ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '字典条目标识号',
    `DIC_NAME` VARCHAR(64) NOT NULL COMMENT '字典名称',
    `ITEM_CODE` VARCHAR(20) NOT NULL COMMENT '字典条目编码',
    `ITEM_VALUE` VARCHAR(128) NOT NULL COMMENT '字典条目值',
    `ITEM_SPELL` VARCHAR(64) NOT NULL COMMENT '字典条目拼音头',
    `ITEM_ASPELL` VARCHAR(200) NOT NULL COMMENT '字典条目全拼',

	 */
	private int itemId;
	private String dicName;
	private String itemCode;
	private String itemValue;
	private String itemSpell;
	private String itemAspell;
	
	
	public int getItemId() {
		return itemId;
	}
	public void setItemId( int itemId ) {
		this.itemId = itemId;
	}
	public String getDicName() {
		return dicName;
	}
	public void setDicName( String dicName ) {
		this.dicName = dicName;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode( String itemCode ) {
		this.itemCode = itemCode;
	}
	public String getItemValue() {
		return itemValue;
	}
	public void setItemValue( String itemValue ) {
		this.itemValue = itemValue;
	}
	public String getItemSpell() {
		return itemSpell;
	}
	public void setItemSpell( String itemSpell ) {
		this.itemSpell = itemSpell;
	}
	public String getItemAspell() {
		return itemAspell;
	}
	public void setItemAspell( String itemAspell ) {
		this.itemAspell = itemAspell;
	}
	
}
