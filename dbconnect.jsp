<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<% /* 자바 DB 연동 프로그램 */ 
			  Class.forName("oracle.jdbc.OracleDriver");
			  Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
			   	
		%>