package net.pkusoft.servlet;

import javax.servlet.http.HttpServlet;

//@WebServlet( name = "Datagrid", urlPatterns = { "/Datagrid" } )
public class Datagrid extends HttpServlet {
//
//	private static final long serialVersionUID = 1L;
//	private JbxxCzrkDao jbxxCzrkDao = new JbxxCzrkDao();
//
//	@Override
//	protected void doPost( HttpServletRequest req, HttpServletResponse resp ) throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
//		resp.setCharacterEncoding("UTF-8");
//		
//		String _current = req.getParameter( "current" );
//		String _rowCount = req.getParameter( "rowCount" );
//		int current = 1;
//		int rowCount = 10;
//		int start = 0;
//		JsonResult jsonResult = new JsonResult();
//		PrintWriter out = resp.getWriter();  
//		
//		if ( ! "".endsWith( _current ) ) {
//			current = Integer.parseInt( _current );
//		}
//		if ( ! "".endsWith( _rowCount ) ) {
//			rowCount = Integer.parseInt( _rowCount );
//		}
//		
//		start = ( current - 1 ) * rowCount;
//		
//		List<JbxxCzrk> jbxxCzrkList = jbxxCzrkDao.getJbxxCzrkList( start, rowCount);
//		
//		jsonResult.setCurrent( current );
//		jsonResult.setRowCount( rowCount );
//		jsonResult.setTotal( jbxxCzrkDao.getTotalNum() );
//		jsonResult.setRows( jbxxCzrkList );
//		
////        out.write( JSONObject.fromObject( jsonResult ).toString() );
//		
//	}
}


