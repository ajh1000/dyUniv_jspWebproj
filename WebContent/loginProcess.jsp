<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<jsp:useBean id="memMgr" class="simpleBean.MemberMgr" />

<%
	String id=request.getParameter("ID");
	String pw=request.getParameter("PW");
	simpleBean.RegisterBean memberInfo=memMgr.getMember(id);
	
	String check = request.getParameter("rememberID");
	
	out.println(check);
	//cookie
	if(check!= null && check.equals("rememberID"))
	{
		Cookie cookie=new Cookie("rememberID","true");
		cookie.setMaxAge(365*24*60*60); 
		response.addCookie(cookie);  

		Cookie cookie2=new Cookie("id",id);
		cookie2.setMaxAge(365*24*60*60); 
		response.addCookie(cookie2); 
	}
	else
	{

		Cookie cookie=new Cookie("rememberID","false");
		cookie.setMaxAge(365*24*60*60); 
		response.addCookie(cookie); 

		Cookie[] cookies = request.getCookies() ;
	     
	    if(cookies != null){
	        for(int i=0; i < cookies.length; i++)
	        {
	             
	        	if(cookies[i].getName().equals("id"))
	        	{
		            cookies[i].setMaxAge(0) ;
		            response.addCookie(cookies[i]) ;
	        	}

	        }
	    }
	}
	//member check
	if(memberInfo != null){
		if(id.equals(memberInfo.getID()) && pw.equals(memberInfo.getPW()))
		{

			Cookie cookie2=new Cookie("id",id);
			cookie2.setMaxAge(365*24*60*60); 
			response.addCookie(cookie2);  
			
			session.setAttribute("login", "true");
			response.sendRedirect("main.jsp");
		} 
		else
		{
			session.setAttribute("login", "false");
			response.sendRedirect("login.jsp");		
			
		}
	}
	else
	{
		
		session.setAttribute("login", "false");
		response.sendRedirect("login.jsp");		
	}
	

%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>