<%@ page import="java.sql.*" %>
<%@ page import="dbpkg.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String saledate = request.getParameter("saledate");
	String pcode = request.getParameter("pcode");
	String scode = request.getParameter("scode");
	String amount = request.getParameter("amount");

	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = "insert into tbl_salelist_01 values(saleno_seq.nextval,?,?,?,?,'Y')";
	try{
		con = Util.getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, pcode);
		pstmt.setString(2, saledate);
		pstmt.setString(3, amount);
		pstmt.setString(4, scode);

		pstmt.executeUpdate();
		
		response.sendRedirect("index.jsp?section=insert");

	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(con!=null) con.close();
	}
%>