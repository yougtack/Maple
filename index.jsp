<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String section = request.getParameter("section");

	if(section==null){
		section = "c_index.jsp";
	}else{
		section += ".jsp";
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css.css">
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="nav.jsp"/>
<section>
	<jsp:include page="<%=section %>"/>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>