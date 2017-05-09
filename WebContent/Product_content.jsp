<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="simpleBean.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:useBean id="itemMgr" class="simpleBean.ItemMgr"/> 
</head>
<body>
<%	
	String CurPageName=request.getParameter("page");
	String MainOrder=request.getParameter("MainOrder");
	String SubOrder=request.getParameter("SubOrder");

	Vector<ItemBean> itemList=itemMgr.getItemList(MainOrder, SubOrder,CurPageName);
	
	String index=request.getParameter("index");
	if(index==null)
	{
		index="0";
	}
	int idx=Integer.parseInt(index);
	
	if(CurPageName.equals("PS4"))
	{
		
%>

<a href="Product_ItemInfo.jsp?itemName=FINAL%20FANTASY%20XV"><img src="img/ps4/FFXV_Jacket-front_KR.jpg" style="width:700px; height:300px; margin-bottom:10px;">
</a>	
<%
	}
	else if(CurPageName.equals("XBOXONE"))
	{
%>

<a href="Product_ItemInfo.jsp?itemName=Gears%20of%20War%204"><img src="img/xboxone/aaaa.png" style="width:700px; height:300px; margin-bottom:10px;">
</a>	

<%
	}
	else if(CurPageName.equals("STEAM"))
	{
%>
	
<a href="Product_ItemInfo.jsp?itemName=Battlerite"><img src="img/steam/b.jpg" style="width:700px; height:300px; margin-bottom:10px;">
</a>	
<%
	}

	else if(CurPageName.equals("GIFT"))
	{
		
%>
<a href="Product_ItemInfo.jsp?itemName=nice%20keyboard1">
<img src="img/gift/keyboard1.jpg" style="width:700px; height:300px; margin-bottom:10px;">
</a>	
<%
	}

%>
<div class="jumbotron">
		<%
		int to=itemList.size()/4;
		
		if(to==0)
			to+=1;
		
		if(itemList.size()%4==1)
			to+=1;

		if(itemList.size()%8==1)
			to-=1;


		for(int i=idx;i<idx+to ;++i ) {%>
		<div class="row text-center" style="padding-top:10px;">
		   	<%for(int j=i*4;j<i * 4 + 4 && j< itemList.size(); ++j){ %>
		    <div class="col-md-3">
		    	<a href="Product_ItemInfo.jsp?itemName=<%=itemList.get(j).getName()%>">
		    	<img src="<%=itemList.get(j).getImgURL()%>" style="height:100px;width:94px;"></a>
		    	<br>NAME:<%=itemList.get(j).getName() %>
		    	<br>PRICE:<%=itemList.get(j).getPrice() %>
		    	<br>Release:<%=itemList.get(j).getRelease() %>
		    </div>
		    <%} %>
 	 	</div>
 	 	<%} %>
 	 	<a href="Product.jsp?page=<%=CurPageName%>&index=<%if(idx-2<0) {%><%=idx%><%}else{%><%=idx-2%><%} %>" 
	       class="btn btn-default" style="height:50px;"><h4>이전</h4></a>
  		<a href="Product.jsp?page=<%=CurPageName%>&index=<%if(idx+8>itemList.size()-1){%><%=idx%><%}else{%><%=idx+2%><%}%>" 
	       class="btn btn-default" style="height:50px;"><h4>다음</h4></a>	
 	 	
</div>

	
</body>
</html>