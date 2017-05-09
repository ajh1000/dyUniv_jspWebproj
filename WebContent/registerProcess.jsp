<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:useBean id="memMgr" class="simpleBean.MemberMgr" />
<jsp:useBean id="regBean" class="simpleBean.RegisterBean"/>
<jsp:setProperty name="regBean" property="*" />
<%
    boolean flag = memMgr.memberInsert(regBean);
	Cookie cookie=new Cookie("id",regBean.getID());
	cookie.setMaxAge(365*24*60*60); 
	response.addCookie(cookie);  

	out.println(flag);
	session.setAttribute("login", "true");
	response.sendRedirect("main.jsp");
	


%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>




</body>
</html>