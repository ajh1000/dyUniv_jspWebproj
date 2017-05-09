<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="simpleBean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<jsp:useBean id="memMgr" class="simpleBean.MemberMgr" />
</head>
<body>
<%
	String[] id=request.getParameterValues("ID");
	String[] pw=request.getParameterValues("PW");
	String[] name=request.getParameterValues("NAME");
	String[] tel=request.getParameterValues("TEL");
	String[] loc=request.getParameterValues("LOC");
	String[] email=request.getParameterValues("EMAIL");
	String[] admin=request.getParameterValues("ADMIN");
	

	for(int i=0;i<id.length;++i)
	{
		RegisterBean info=new RegisterBean();
		info.setID(id[i]);
		info.setPW(pw[i]);
		info.setNAME(name[i]);
		info.setTEL(tel[i]);
		info.setLOC(loc[i]);
		info.setEMAIL(email[i]);
		info.setADMIN(admin[i]);
		
		memMgr.memberUpdate(info);
		//out.println();
	}
	response.sendRedirect("admin.jsp?page=memberUpdate");
%>

</body>
</html>