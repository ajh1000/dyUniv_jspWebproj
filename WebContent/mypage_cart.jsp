<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="simpleBean.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:useBean id="orderMgr" class="simpleBean.OrderMgr"/>
<jsp:useBean id="cartMgr" class="simpleBean.CartMgr"/>
</head>
<body>
<%
	String index=request.getParameter("index");
	if(index==null)
	{
		index="0";
	}
	int idx=Integer.parseInt(index);
	
	String id="null";
	Cookie[] cookies=request.getCookies();
	if(cookies!=null)
	{
	
		for(int i = 0 ; i<cookies.length; i++)
		{             
			if(cookies[i].getName().equals("id"))
			{
				id=cookies[i].getValue();
			}
		}
	}

	Vector<OrderBean> orderList=orderMgr.getOrderList(id);
	
	for(int i=0;i<orderList.size();++i)
	{
		cartMgr.removeCart(id,orderList.get(i).getName());
	}
	
	Vector<CartBean> cartList=cartMgr.getCartList(id);
%>

<div class="jumbotron text-center" style="height:1500px;">
	<table class="table">
	    <thead>
	      <tr>
	        <th>#</th>
	        <th>상품명</th>
	      </tr>
	    </thead>
		    <tbody>
		    <%
		    	for(int i=idx;i<cartList.size() && i<idx+3;++i)
		    	{
		    %>
	    
		      <tr>
		      	<td><%=i+1 %></td>
		      	<td><input type="text" class="form-control" value="<%=cartList.get(i).getName() %>" 
		      	 readonly style="width:100px; height:30px; "></td>
		
		      </tr>
		      <%
		    	}
		      %>
		    </tbody>
	  </table>
	  
	  <a href="mypage.jsp?curPage=cart&index=<%if(idx-3<0) {%><%=idx%><%}else{%><%=idx-3%><%} %>" 
	       class="btn btn-default" style="height:50px;"><h4>이전</h4></a>
  <a href="mypage.jsp?curPage=cart&index=<%if(idx+3>cartList.size()-1){%><%=idx%><%}else{%><%=idx+3%><%}%>" 
	       class="btn btn-default" style="height:50px;"><h4>다음</h4></a>	
</div>

</body>
</html>