<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="dbconnect.jsp" %>
<%
	String del= request.getParameter("del");

	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = "delete from tbl_item_01 where pcode=?";
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, del);

		pstmt.executeUpdate();
		
		response.sendRedirect("index.jsp?section=select_by_item");

	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn!=null) conn.close();
	}
%>