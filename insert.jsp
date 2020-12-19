<%@ page import="java.sql.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h3>판매 등록</h3>
<%@ include file = "dbconnect.jsp" %>
			<%
				String saleno = null;
				String sql = "SELECT TO_CHAR(seq_m.nextval,'999999') FROM DUAL";
				try{
					PreparedStatement pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					rs.next();
					saleno = rs.getString(1);
					
					Date today= new Date();
					SimpleDateFormat date= new SimpleDateFormat("YYYYMMdd");
					String saledate=date.format(today);
		
			%>
<form name="form1" action="insert_post.jsp" method="post">
	<table border="1">
		<tr>
			<td>판매번호(자동발생)</td>	
			<td><input type="text" name="saleno" value="<%=saleno %>" readonly></td>
		</tr>
		<tr>
			<td>제품등록일(자동발생)</td>
			<td><input type="text" name="saledate" value="<%=saledate %>" readonly></td>
		</tr>
		<tr>
			<td style="text-align:center;">제품코드</td>
			<td>
				<select name="pcode">
					<option value="0">선택</option>
				<%
				sql = "select pcode, pname from tbl_item_01";
				PreparedStatement pstmt2 = conn.prepareStatement(sql);
				ResultSet rs2 = pstmt2.executeQuery();
				while(rs2.next()){
				%>
					<option value="<%=rs2.getString(1) %>"><%=rs2.getString(2) %></option>
				<%
				}
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td style="text-align:center;">판매서버</td>
			<td>
				<select name="scode">
					<option value="0">선택</option>
				<%
				sql = "select scode, sname from tbl_server_01";
				PreparedStatement pstmt3 = conn.prepareStatement(sql);
				ResultSet rs3 = pstmt3.executeQuery();
				while(rs3.next()){
				%>
					<option value="<%=rs3.getString(1) %>"><%=rs3.getString(2) %></option>
				<%
				}
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td style="text-align:center;">판매수량</td>
			<td><input type="text" name="amount"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<input type="button" value="등록" onclick="fn_submit()">
				<input type="button" value="다시쓰기" onclick="fn_reset()">
			</td>
		</tr>
	</table>
</form>
<%
	}catch(Exception e){
					e.printStackTrace();
				}finally{
					conn.close();
				}
			%>
<script>
	function fn_submit(){
		if(form1.pcode.selectedIndex <1){
			alert("제품코드를 선택하지 않았습니다.");
			form1.pcode.focus();
			return false;
		}else if(form1.scode.selectedIndex <1){
			alert("판매서버를 선택하지 않았습니다.");
			form1.scode.focus();
			return false;
		}else if(form1.amount.value == ''){
			alert("판매수량을 입력하지 않았습니다.");
			form1.amount.focus();
			return false;
		}else{
			document.form1.submit();
			alert("판매등록 되었습니다");
		}
	}
	
	function fn_reset(){
		alert("입력값이 삭제되었습니다");
		document.form1.reset();
	}
</script>
</body>
</html>
