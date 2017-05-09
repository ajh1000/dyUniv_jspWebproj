<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:useBean id="submitMgr" class="simpleBean.SubmitMgr" />
<jsp:useBean id="submitBean" class="simpleBean.SubmitBean"/>
<jsp:setProperty property="*" name="submitBean"/>
</head>
<body>
<%
StringBuffer content=new StringBuffer(request.getParameter("content"));
int loc = (new String(content)).indexOf('\n');
    while(loc > 0){
    	content.replace(loc, loc+1, "<BR>");
        loc = (new String(content)).indexOf('\n');
   }

	submitBean.setContent(content.toString());
	submitMgr.addSubmit(submitBean,1);
	response.sendRedirect("admin.jsp?page=notice");
	
%>
</body>
</html>