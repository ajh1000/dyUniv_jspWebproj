<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="simpleBean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<jsp:useBean id="itemMgr" class="simpleBean.ItemMgr"/>
<jsp:useBean id="orderMgr" class="simpleBean.OrderMgr"/>
<jsp:useBean id="orderBean" class="simpleBean.OrderBean"/>
</head>
<body>
<%
	String ID=request.getParameter("ID");
	String itemName=request.getParameter("itemName");
	String left= request.getParameter("left");
	String quantity=request.getParameter("quantity");
	String buyer=request.getParameter("buyer");


	orderBean.setID(ID);
	orderBean.setName(itemName);
	orderBean.setQuantity(quantity);
	orderBean.setBuyerName(buyer);
	
	out.println( itemMgr.updateQuantity(itemName,quantity));
	out.println( orderMgr.insertOrder(orderBean));
	
	response.sendRedirect("Product_ItemInfo.jsp?itemName="+itemName);
%>

</body>
</html>