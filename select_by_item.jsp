<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h3>아이템 현황</h3>
    <table border="1">
        <tr>
            <td>제품코드</td>
            <td>제품이름</td>
            <td>제품종류</td>
            <td>가격</td>
            <td>삭제</td>
        </tr>
<%@include file="dbconnect.jsp"%>

            <%
            	String kind= null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                String sql = "select * from tbl_item_01";
                try{
                    pstmt = conn.prepareStatement(sql);
                    rs = pstmt.executeQuery();
                    while(rs.next()){
                    	kind=rs.getString(3);
                    	switch(kind){
                    	case "A":
                    		 kind="장비";
                    		break;
                     	case "B":
	                   		 kind="소비";
                    		break;
                     	case "C":
	                   		 kind="기타";
                    		break;         		
                    	}
                    
            %>
                <tr>
                    <td><%=rs.getString(1) %></td>
                    <td><%=rs.getString(2) %></td>
                    <td><%=kind %></td>
                    <td><%=rs.getString(4) %></td>
                    <td><a href="delete.jsp?del=<%=rs.getString(1)%>">삭제</a></td>
                </tr>
            <%
                    }
                }catch(Exception e){
                    e.printStackTrace();
                }finally{
                    conn.close();
                }
            %>

    </table>
</body>
</html>