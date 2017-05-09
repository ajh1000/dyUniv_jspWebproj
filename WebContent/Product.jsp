<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<jsp:include page="top_module.jsp" flush="true"/>
<%


	String CurPageName=request.getParameter("page");
	String MainOrder=request.getParameter("MainOrder");
	String SubOrder=request.getParameter("SubOrder");

	if(MainOrder==null)
	{
		MainOrder="RECENT";
	}
	if(SubOrder==null)
	{
		SubOrder="all";
	}

	session.setAttribute("MainOrder", MainOrder);
	session.setAttribute("SubOrder", SubOrder);	
%>

<div class="container">
	<div class="row text-center" style="padding-top:30px;">
		<!-- LEFT MENU -->
		<div class="col-md-3">
			<jsp:include page="Product_left.jsp">
				<jsp:param name="page" value="<%=CurPageName %>"/>
			</jsp:include>
							
		</div>
		<!-- MAIN CONTENT -->
		<div class="col-md-9">
			<jsp:include page="Product_content.jsp">
				<jsp:param name="page" value="<%=CurPageName%>"/>
				<jsp:param name="MainOrder" value="<%=MainOrder %>"/>
				<jsp:param name="SubOrder" value="<%=SubOrder%>"/>
			</jsp:include>	
		</div>
		
		
			
	</div>

</div>

</body>
</html>