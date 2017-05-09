<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="top_module.jsp"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%
String curPage="mypage_"+request.getParameter("curPage")+".jsp";
%>
</head>
<body>

<div class="container">

	<div class="row text-center" style="padding-top:30px;">
			<!-- LEFT MENU -->
			<div class="col-md-3">
				<jsp:include page="mypage_left.jsp"/>
			</div>
			<!-- MAIN CONTENT -->
			<div class="col-md-9">
				<jsp:include page="<%=curPage %>"/> 
			</div>
			
			
				
	</div>
		
</div>
</body>
</html>