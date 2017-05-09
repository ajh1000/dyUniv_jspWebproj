<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="top_module.jsp" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
	Cookie[] cookies = request.getCookies();
	String checkRemember=null;
	String id=null;
	
	if(cookies!=null)
	{

		for(int i = 0 ; i<cookies.length; i++)
		{                           
			if(cookies[i].getName().equals("rememberID"))
			{
				checkRemember=cookies[i].getValue();
				
			}
			if(cookies[i].getName().equals("id"))
			{
				id=cookies[i].getValue();
			}
		}
	}
	
%>
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<div class="jumbotron text-center" style="height:1500px;">
		<br><br><br><br><br><br><br><br><br>
		<form method="post" action="loginProcess.jsp">
			
			<div class="form-group">
				<div class="form-inline">
	   				 <label>ID:&nbsp;&nbsp;</label>
	   				 <input type="text" class="form-control" required name="ID" <%if(checkRemember!=null&& checkRemember.equals("true") && id!=null){ %> value="<%=id%>"<%} %> 
	   				 style="width:300px; height:50px;">
	 			</div>
	 			<br>
	 			<div class="form-inline">
	   				 <label>PW:  </label>
	   				 <input type="text" class="form-control" name="PW" required style="width:300px; height:50px;">	 
	 			</div>
	 			
	 			<div class="checkbox">
 					 <label><input type="checkbox" name="rememberID" value="rememberID"	 
					<%if(checkRemember != null && checkRemember.equals("true")){ %>checked <%} %>>remember me</label>
				</div>	
 				
 				<button type="submit" class="btn btn-default" style="height:50px;width:100px;">로그인</button>
	 			
	 		</div>
	 		
		</form>
	</div>
</div>

</body>
</html>