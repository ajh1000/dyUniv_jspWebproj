<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<jsp:include page="top_module.jsp"/>

<%
	String curPage="admin_"+request.getParameter("page")+".jsp";
%>
<body>


<div class="container">
	<div class="row text-center" style="padding-top:30px;">
		<!-- LEFT MENU -->
		<div class="col-md-3">
			<jsp:include page="admin_left.jsp"/>
		</div>
		<!-- MAIN CONTENT -->
		<div class="col-md-9">
			<jsp:include page="<%=curPage %>"/>
		</div>
	</div>
</div>

</body>
</html>