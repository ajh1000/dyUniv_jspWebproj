<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*" %>
    
    <%@ page import="simpleBean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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

    <form method="post" action="admin_memberUpdateProcess.jsp">
<table class="table">
    <thead>
      <tr>
        <th>ID</th>
        <th>PW</th>
   		<th>NAME</th>
        <th>TEL</th>
        <th>EMAIL</th>
        <th>LOC</th>
        <th>ADMIN</th>
      </tr>
    </thead>
	    <tbody>
	    <%
	    	for(int i=idx;i<memList.size() && i<idx+3;++i)
	    	{
	    %>
	      <tr>
	      	<td><input type="text" class="form-control" value="<%=memList.get(i).getID() %>" 
	      	name="ID" readonly style="width:100px; height:30px; "></td>
	        <td><input type="text" class="form-control" value="<%=memList.get(i).getPW() %>" 
	      	name="PW" required style="width:100px; height:30px; "></td>
	      	<td><input type="text" class="form-control" value="<%=memList.get(i).getNAME() %>" 
	      	name="NAME" required style="width:100px; height:30px; "></td>
	      	<td><input type="text" class="form-control" value="<%=memList.get(i).getTEL() %>" 
	      	name="TEL" required style="width:100px; height:30px; "></td>
	      	<td><input type="text" class="form-control" value="<%=memList.get(i).getEMAIL() %>" 
	      	name="EMAIL" required style="width:100px; height:30px; "></td>
	      	<td><input type="text" class="form-control" value="<%=memList.get(i).getLOC() %>" 
	      	name="LOC" required style="width:100px; height:30px; "></td>
	      	<td><input type="text" class="form-control" value="<%=memList.get(i).getADMIN() %>" 
	      	name="ADMIN" required style="width:100px; height:30px; "></td>
	      </tr>
	      <%
	    	}
	      %>
	    </tbody>
  </table>
 				<button type="submit" class="btn btn-default" style="height:50px;width:100px;">수정</button>
</form>
<br><br><br><br><br>
  <a href="admin.jsp?page=memberUpdate&index=<%if(idx-3<0) {%><%=idx%><%}else{%><%=idx-3%><%} %>" 
	       class="btn btn-default" style="height:50px;"><h4>이전</h4></a>
  <a href="admin.jsp?page=memberUpdate&index=<%if(idx+3>memList.size()-1){%><%=idx%><%}else{%><%=idx+3%><%}%>" 
	       class="btn btn-default" style="height:50px;"><h4>다음</h4></a>	

</div>
</body>
</html>