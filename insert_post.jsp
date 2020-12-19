<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="dbconnect.jsp" %>
<%
	String saleno=request.getParameter("saleno");
	String saledate = request.getParameter("saledate");
	String pcode = request.getParameter("pcode");
	String scode = request.getParameter("scode");
	String amount = request.getParameter("amount");

	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = "insert into tbl_sample_01 values(?,?,?,?,?,'Y')";
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saleno);
		pstmt.setString(2, pcode);
		pstmt.setString(3, saledate);
		pstmt.setString(4, amount);
		pstmt.setString(5, scode);

		pstmt.executeUpdate();
		
		response.sendRedirect("index.jsp?section=insert");

	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(con!=null) con.close();
	}
%>