<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h3>아이템 등록</h3>
<%@ include file = "dbconnect.jsp" %>
			<%
				String pcode = null;
				String pname = null;
				String sql = "SELECT max(pcode) FROM tbl_item_01";
				try{
					PreparedStatement pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					rs.next();
					pcode = rs.getString(1);
					
					String sub= pcode.substring(2,4);
					int s=Integer.parseInt(sub);
					pcode = "AA"+ String.format("%02d",s+1);
					
					%>
<form name="form1" action="insert_item_post.jsp" method="post">
	<table border="1" style="text-align:left;">
		<tr>
			<td>제품코드(자동발생)</td>
			<td><input type="text" name="pcode" value="<%=pcode %>" readonly></td>
			</tr>
		<tr>
			<td>제품이름</td>
			<td><input type="text" name="pname"></td>
		</tr>
		<tr>
			<td>제품종류</td>
			<td>
				<select name="type">
					<option value="">선택</option>
					<option value="A">장비</option>
					<option value="B">소비</option>
					<option value="C">기타</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" name="price"></td>
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
		if(form1.pname.value == ''){
			alert("제품명을 입력하지 않았습니다.");
			form1.pname.focus();
			return false;
		}else if(form1.type.selectedIndex <1){
			alert("제품종류를 선택하지 않았습니다.");
			form1.type.focus();
			return false;
		}else if(form1.price.value == ''){
			alert("가격을 입력하지 않았습니다.");
			form1.price.focus();
			return false;
		}else{
			document.form1.submit();
			alert("아이템이 등록되었습니다");
		}
	}
	
	function fn_reset(){
		alert("입력값이 삭제되었습니다")
		form1.reset();
	}
</script>
</body>
</html>
