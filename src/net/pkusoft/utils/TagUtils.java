package net.pkusoft.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.pkusoft.model.SysDicItem;

public final class TagUtils {

	public static String getDicValue( String dicName, String itemCode ) {
		PreparedStatement st = null;
		ResultSet rs = null;
		Connection conn = null;
		String iteValue = "";
		try {
			conn = DBUtils.getConnection();
			String sql = "select ITEM_VALUE from sys_dic_item where DIC_NAME = ? and ITEM_CODE = ?"; // 这里用问号
			st = conn.prepareStatement( sql );
			st.setString( 1, dicName ); // 这里将问号赋值
			st.setString( 2, itemCode ); // 这里将问号赋值
			rs = st.executeQuery();
			while ( rs.next() ) {
				iteValue = rs.getString( 1 );
			}
		} catch ( SQLException e ) {
			e.printStackTrace();
		} finally {
			DBUtils.free( rs, st, conn );
		}
		return iteValue;
	}

	public static List<SysDicItem> getDicItemList( String dicName ) {
		PreparedStatement st = null;
		ResultSet rs = null;
		Connection conn = null;
		List<SysDicItem> sysDicItemList = new ArrayList<SysDicItem>();
		try {
			conn = DBUtils.getConnection();
			String sql = "select ITEM_CODE, ITEM_VALUE from sys_dic_item where DIC_NAME = ?"; // 这里用问号
			st = conn.prepareStatement( sql );
			st.setString( 1, dicName ); // 这里将问号赋值
			rs = st.executeQuery();
			while ( rs.next() ) {
				SysDicItem sysDicItem = new SysDicItem();
				String itemCode = rs.getString( 1 ); 
				String itemValue = rs.getString( 2 ); 
				sysDicItem.setItemCode( itemCode );
				sysDicItem.setItemValue( itemValue );
				sysDicItemList.add( sysDicItem );
			}
		} catch ( SQLException e ) {
			e.printStackTrace();
		} finally {
			DBUtils.free( rs, st, conn );
		}
		return sysDicItemList;
	}

}
