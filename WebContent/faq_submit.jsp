<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="jumbotron text-center" style="height:1500px;">
	<form method="post" action="faq_submitProcess.jsp" >
				
				<!--  FORM  -->
				<div class="form-group">
					<div class="form-inline">
		   				 <label>제목:</label>
		   				 <input type="text" class="form-control" name="title" style="width:300px; height:50px;" required >
		 			</div>
		 		</div>
		 		<div class="form-inline">
		   				 <label>내용:</label>
		   				 <textarea class="form-control" rows="15" name="content" style="width:500px; height:200px;" required></textarea> 
		 			</div><br>
	 				<button type="submit" class="btn btn-default" style="height:50px;width:100px;">문의하기</button>
		 			
	</form>
</div>
</body>
</html>