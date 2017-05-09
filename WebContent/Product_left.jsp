<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script>
<%
%>
function test()
{
		<%out.println("asd");%>
}


</script>
</head>
<body>
<%	
	String CurPageName=request.getParameter("page");
	String MainOrder=(String)session.getAttribute("MainOrder");
	String SubOrder=(String)session.getAttribute("SubOrder");
%>
	<div class="jumbotron" style="padding-left:0px;padding-right:0px;">
		<h2><%=CurPageName %></h2><br><br>
	
		<a href="Product.jsp?page=<%=CurPageName %>&MainOrder=HOT&SubOrder=<%=SubOrder %>" class="btn btn-info">인기</a>
		<a href="Product.jsp?page=<%=CurPageName %>&MainOrder=RECENT&SubOrder=<%=SubOrder %>" class="btn btn-info">최신</a>
		<a href="Product.jsp?page=<%=CurPageName %>&MainOrder=DISCOUNT&SubOrder=<%=SubOrder %>" class="btn btn-info">할인</a>
		
		<br><br><h2>장르</h2><br><br>
		<%
			if(CurPageName.equals("PS4") || 
					CurPageName.equals("XBOXONE") ||
					CurPageName.equals("STEAM"))
			{
				
		%>
		<a href="Product.jsp?page=<%=CurPageName %>&SubOrder=all&MainOrder=<%=MainOrder %>" class="btn btn-default" style="width:110px;">모든 장르</a>
		<br><br>
		<a href="Product.jsp?page=<%=CurPageName %>&SubOrder=fight&MainOrder=<%=MainOrder %>" class="btn btn-default" style="width:110px;">대전 격투</a>
		<br><br>
		<a href="Product.jsp?page=<%=CurPageName %>&SubOrder=race&MainOrder=<%=MainOrder %>" class="btn btn-default"style="width:110px;">레이싱</a><br><br>
		<a href="Product.jsp?page=<%=CurPageName %>&SubOrder=rpg&MainOrder=<%=MainOrder %>" class="btn btn-default"style="width:110px;">RPG</a><br><br>
		<a href="Product.jsp?page=<%=CurPageName %>&SubOrder=fps&MainOrder=<%=MainOrder %>" class="btn btn-default"style="width:110px;">FPS</a><br><br>
		<a href="Product.jsp?page=<%=CurPageName %>&SubOrder=action&MainOrder=<%=MainOrder %>" class="btn btn-default"style="width:110px;">액션</a><br><br>
		<a href="Product.jsp?page=<%=CurPageName %>&SubOrder=simulation&MainOrder=<%=MainOrder %>" class="btn btn-default"style="width:110px;">시뮬레이션</a><br><br>
		
		<%
			}
			else if(CurPageName.equals("GIFT"))
			{
		%>
		
		<a href="Product.jsp?page=<%=CurPageName %>&SubOrder=all&MainOrder=<%=MainOrder %>" class="btn btn-default" style="width:110px;">모든 제품</a>
		<br><br>
		<a href="Product.jsp?page=<%=CurPageName %>&SubOrder=headset&MainOrder=<%=MainOrder %>" class="btn btn-default" style="width:110px;">헤드셋</a>
		<br><br>
		<a href="Product.jsp?page=<%=CurPageName %>&SubOrder=mouse&MainOrder=<%=MainOrder %>" class="btn btn-default" style="width:110px;">마우스</a>
		<br><br>
		<a href="Product.jsp?page=<%=CurPageName %>&SubOrder=mousepad&MainOrder=<%=MainOrder %>" class="btn btn-default" style="width:110px;">마우스 패드</a>
		<br><br>
		<a href="Product.jsp?page=<%=CurPageName %>&SubOrder=moniter&MainOrder=<%=MainOrder %>" class="btn btn-default" style="width:110px;">모니터</a>
		<br><br>
		<a href="Product.jsp?page=<%=CurPageName %>&SubOrder=keyboard&MainOrder=<%=MainOrder %>" class="btn btn-default" style="width:110px;">키보드</a>
		<br><br>
		<a href="Product.jsp?page=<%=CurPageName %>&SubOrder=usb&MainOrder=<%=MainOrder %>" class="btn btn-default"style="width:110px;">USB</a>
		<br><br>
		<% 
			}
		%>
	</div>
	

</body>
</html>