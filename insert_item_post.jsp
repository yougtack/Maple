<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="dbconnect.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String pcode=request.getParameter("pcode");
	String pname = request.getParameter("pname");
	String type = request.getParameter("type");
	String price = request.getParameter("price");

	PreparedStatement pstmt = null;
	String sql = "insert into tbl_item_01 values (?, ?, ?, ?)";
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pcode);
		pstmt.setString(2, pname);
		pstmt.setString(3, type);
		pstmt.setString(4, price);

		pstmt.executeUpdate();
		
		response.sendRedirect("index.jsp?section=select_by_item");

	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn!=null) conn.close();
	}
%>