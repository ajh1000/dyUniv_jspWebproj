<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="simpleBean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="top_module.jsp" flush="true"/>
<jsp:useBean id="itemMgr" class="simpleBean.ItemMgr"/> 
</head>
<body>
<div class="container" style="padding-top:20px;">
	<div class="jumbotron text-center" style="height:1500px;">
			<%
				String searchName=request.getParameter("search");
				ItemBean itemBean=itemMgr.getItemInfo(searchName);
				if( itemBean != null)
				{
			%>
					<a href="Product_ItemInfo.jsp?itemName=<%=searchName%>"><img src="<%=itemBean.getImgURL()%>"></a>
					<br><h4>NAME:<%=itemBean.getName() %></h4>
		    	<br><h4>PRICE:<%=itemBean.getPrice() %></h4>
		    	<br><h4>Release:<%=itemBean.getRelease() %></h4>
			<%
				}
				else
				{
			%>
					<h4>찾으시는 아이템이 없습니다.</h4>
			<%
				}
				
			%>
	</div>
</div>


</body>
</html>