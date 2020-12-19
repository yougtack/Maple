<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="dbconnect.jsp"%>
    <%
		String search = request.getParameter("search");    	
    	String order = request.getParameter("order");  
		String saleno = request.getParameter("saleno");
		String isBuy = request.getParameter("isBuy");
    	
    	search = (search == null)?"":search;
    	//order = (order == null)?"":order;
    	
    %>
<h3>재고현황</h3>

<input type="text" id="search_value" value=<%= search %>>
<input type="button" onclick="fn_search()" value="검색"><br>
(<a href="index.jsp?section=select_by_sample&order=ok">이름기준</a>)
<table border="1">
	<tr>
		<td>상품코드</td>
		<td>상품이름</td>
		<td>판매날짜</td>
		<td>서버이름</td>
		<td>갯수</td>
		<td>가격</td>
		<td>구매여부</td>
	</tr>
	<%
						
			try{
							
				if(isBuy != null){
					String sql2 = null;			
					if(isBuy.equals("Y"))
						sql2 = "update tbl_sample_01 set isBuy='N' where saleno=?";
					else
						sql2 = "update tbl_sample_01 set isBuy='Y' where saleno=?";
		
				PreparedStatement pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, saleno);
				pstmt2.executeUpdate();
				}
				
				String sql = "select saleno, pname, to_char(saledate,'YYYY-mm-DD'), sname, amount, to_char(price*amount,'999,999,999'), isbuy"+
					  	 " from tbl_sample_01 sl, tbl_server_01 s, tbl_item_01 i"+
						 " where sl.scode = s.scode and sl.pcode = i.pcode";
						
						if(search != null){
							sql += " and pname like '%"+search+"%'";
						}
						
						if(order != null){
							if(order.equals("ok"))
							sql += " order by pname";
						}
						else
							sql += "order by 1 asc";
				
						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();
						String a,b;	
						
				while(rs.next()){					
				%>
						<tr>	
							<td><%=rs.getString(1) %></td>
							<td><%=rs.getString(2) %></td>
							<td><%=rs.getString(3) %></td>
							<td><%=rs.getString(4) %></td>
							<td><%=rs.getString(5) %></td>
							<td><%=rs.getString(6)+"메소" %></td>
							<td><a href="#" onclick="fn_isBuy('<%=rs.getString(7)%>','<%=rs.getString(1)%>');"><%= rs.getString(7)%></a></td>
						</tr>				
				<%
				}	
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					if(conn!=null) conn.close();
				}
			%>
</table>
<script>
function fn_isBuy(isBuy,saleno){
		if(isBuy=="N"){
			var isb = confirm('사시겠습니까?');
			if(isb){
				alert('물건을 구입하였습니다.');
				location.href="index.jsp?section=select_by_sample&isBuy="+isBuy+"&saleno="+saleno;
			}
			else{
				alert('물건 구입을 취소하였습니다.');
			}
		}else{
			var iss= confirm('파시겠습니까?');
			if(iss){
				alert('물건을 팔았습니다.');
				location.href="index.jsp?section=select_by_sample&isBuy="+isBuy+"&saleno="+saleno;
			}else{
				alert('물건 팔기를 취소하였습니다.');
			}
		}
}
	
	function fn_search(){
		var search_value = document.getElementById("search_value").value;
		location.href="index.jsp?section=select_by_sample&search="+search_value;
	}
</script>