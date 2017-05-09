<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="memMgr" class="simpleBean.MemberMgr" />

<%
	String id=null;
	Cookie[] cookies=request.getCookies();
	
	for(int i = 0 ; i<cookies.length; i++)
	{             
		if(cookies[i].getName().equals("id"))
		{
			id=cookies[i].getValue();
		}
	}
	
	simpleBean.RegisterBean info=memMgr.getMember(id);
	
%>
<div class="jumbotron" style="height:1500px;">
			<br><br><br><br><br>
			<form method="post" action="mypage_infoProcess.jsp" >
				
				<!--  FORM  -->
				<div class="form-group" style="margin-left:-100px;">
					<div class="form-inline">
		   				 <label>ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		   				 <input type="text" class="form-control" readonly  name="ID" value="<%=info.getID() %>"  style="width:300px; height:50px;" required >
		 			</div>
		 			<br>
		 			<div class="form-inline">
		   				 <label>PW:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		   				 <input type="text" class="form-control" name="PW" value="<%=info.getPW() %>"style="width:300px; height:50px;"required >	 
		 			</div>
					<br>
		 			<div class="form-inline">
		   				 <label>이름:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		   				 <input type="text" class="form-control" name="NAME"value="<%=info.getNAME() %>" style="width:300px; height:50px;"required >	 
		 			</div>
					<br>
		 			<div class="form-inline">
		   				 <label>전화번호:&nbsp;&nbsp;</label>
		   				 <input type="text" class="form-control" name="TEL" value="<%=info.getTEL() %>"style="width:300px; height:50px;"required >	 
		 			</div>
					<br>
		 			<div class="form-inline">
		   				 <label>이메일:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		   				 <input type="text" class="form-control" name="EMAIL"value="<%=info.getEMAIL() %>" style="width:300px; height:50px;"required >	 
		 			</div><br>
		 			<div class="form-inline">
		   				 <label>주소:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		   				 <input type="text" class="form-control" name="LOC" value="<%=info.getLOC() %>"style="width:300px; height:50px;"required >	 
		 			</div><br>
					
	 				<button type="submit" class="btn btn-default" style="height:50px;width:120px;margin-left:50px;">회원정보 수정</button>
		 			
		 		</div>
		 		
			</form>
		</div>
</body>
</html>