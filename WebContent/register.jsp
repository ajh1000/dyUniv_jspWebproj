<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="top_module.jsp"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="jumbotron" style="height:1500px;">
			<br><br><br><br><br><br><br><br><br>
			<form method="post" action="registerProcess.jsp" >
				
				<!--  FORM  -->
				<div class="form-group" style="margin-left:300px;">
					<div class="form-inline">
		   				 <label>ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		   				 <input type="text" class="form-control" name="ID" style="width:300px; height:50px;" required >
		 			</div>
		 			<br>
		 			<div class="form-inline">
		   				 <label>PW:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		   				 <input type="text" class="form-control" name="PW" style="width:300px; height:50px;"required >	 
		 			</div>
					<br>
		 			<div class="form-inline">
		   				 <label>이름:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		   				 <input type="text" class="form-control" name="NAME" style="width:300px; height:50px;"required >	 
		 			</div>
					<br>
		 			<div class="form-inline">
		   				 <label>전화번호:&nbsp;&nbsp;</label>
		   				 <input type="text" class="form-control" name="TEL" style="width:300px; height:50px;"required >	 
		 			</div>
					<br>
		 			<div class="form-inline">
		   				 <label>이메일:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		   				 <input type="text" class="form-control" name="EMAIL" style="width:300px; height:50px;"required >	 
		 			</div><br>
		 			<div class="form-inline">
		   				 <label>주소:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		   				 <input type="text" class="form-control" name="LOC" style="width:300px; height:50px;"required >	 
		 			</div><br>
					
	 				<button type="submit" class="btn btn-default" style="height:50px;width:100px;margin-left:150px;">회원가입</button>
		 			
		 		</div>
		 		
			</form>
		</div>
	</div>
</body>
</html>