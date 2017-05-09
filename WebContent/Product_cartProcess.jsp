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
<jsp:useBean id="cartBean" class="simpleBean.CartBean"/>
</head>
<body>
<%
	String itemName=request.getParameter("itemName");
	String id=request.getParameter("ID");
	boolean state=false;
	
	Vector<OrderBean> orderList=orderMgr.getOrderList(id);

	Vector<CartBean> cartList=cartMgr.getCartList(id);
	
	for(int i=0;i<orderList.size();++i)
	{
		if(orderList.get(i).getName().equals(itemName))
		{
			state=true;
		}
	}
	for(int i=0;i<cartList.size();++i)
	{
		if(cartList.get(i).getName().equals(itemName))
		{
			state=true;
		}
	}
	

	if(state==false){

		cartBean.setID(id);
		cartBean.setName(itemName);
		
		out.println(cartMgr.addCart(cartBean));
		
		response.sendRedirect("Product_ItemInfo.jsp?itemName="+itemName);
			
	}
	else
	{
		response.sendRedirect("Product_ItemInfo.jsp?itemName="+itemName);
		
	}
%>

</body>
</html>