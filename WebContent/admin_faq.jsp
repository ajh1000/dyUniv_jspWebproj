<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="simpleBean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:useBean id="submitMgr" class="simpleBean.SubmitMgr" />
</head>
<body>
<div class="jumbotron text-center" style="height:1500px;">

<%
	Vector<SubmitBean> list=submitMgr.getSubmitList(0);

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
        <th>#</th>
        <th>제목</th>
        <th>내용</th>
      </tr>
    </thead>
	    <tbody>
	    <%
	    	for(int i=idx;i<list.size() && i<idx+3;++i)
	    	{
	    %>
	      <tr>
	      	<td><%=i+1%></td>
	      	<td><input type="text" class="form-control" value="<%=list.get(i).getTitle()%>" 
	      	name="ID" readonly style="width:100px; height:30px; "></td>
	      	<td>	 			 	  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal<%=i%>" style="height:50px;width:100px;"><h4>보기</h4></button>

  <!-- Modal -->
  <div class="modal fade" id="myModal<%=i%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><%=list.get(i).getTitle() %></h4>
        </div>
        <div class="modal-body">
          <p><%=list.get(i).getContent() %></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
	      	</td>
	
	      </tr>
	      <%
	    	}
	      %>
	    </tbody>
  </table>
  <a href="admin.jsp?page=faq&index=<%if(idx-3<0) {%><%=idx%><%}else{%><%=idx-3%><%} %>" 
	       class="btn btn-default" style="height:50px;"><h4>이전</h4></a>
  <a href="admin.jsp?page=faq&index=<%if(idx+3>list.size()-1){%><%=idx%><%}else{%><%=idx+3%><%}%>" 
	       class="btn btn-default" style="height:50px;"><h4>다음</h4></a>	

</div>
</body>
</html>