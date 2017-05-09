<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    
    <%@ page import="simpleBean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="jumbotron text-center" style="height:1500px;">
	<jsp:useBean id="memMgr" class="simpleBean.MemberMgr" />

<%
	Vector<RegisterBean> memList=memMgr.getMemberList();
	
	String index=request.getParameter("index");
	if(index==null)
	{
		index="0";
	}
	int idx=Integer.parseInt(index);
%>

<table class="table">
    <thead>
      <tr>
        <th>ID</th>
        <th>삭제</th>
      </tr>
    </thead>
	    <tbody>
	    <%
	    	for(int i=idx;i<memList.size() && i<idx+3;++i)
	    	{
	    %>
    <form method="post" action="admin_memberRemoveProcess.jsp">
	      <tr>
	      
	      	<td><input type="text" class="form-control" value="<%=memList.get(i).getID() %>" 
	      	name="ID" readonly style="width:100px; height:30px; "></td>
	      	<td><button type="submit" class="btn btn-default" style="height:50px;width:100px;">삭제</button>
	      	</td>
	
	      </tr>
	</form>
	      <%
	    	}
	      %>
	    </tbody>
  </table>
  <a href="admin.jsp?page=memberRemove&index=<%if(idx-3<0) {%><%=idx%><%}else{%><%=idx-3%><%} %>" 
	       class="btn btn-default" style="height:50px;"><h4>이전</h4></a>
  <a href="admin.jsp?page=memberRemove&index=<%if(idx+3>memList.size()-1){%><%=idx%><%}else{%><%=idx+3%><%}%>" 
	       class="btn btn-default" style="height:50px;"><h4>다음</h4></a>	

</div>
</body>
</html>