<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    
    <%@ page import="simpleBean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="top_module.jsp"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:useBean id="itemMgr" class="simpleBean.ItemMgr"/> 
</head>
<body>
<%
	String itemName=request.getParameter("itemName");
	ItemBean item= itemMgr.getItemInfo(itemName);	
	
	String loginStatus=(String)session.getAttribute("login");
	if(loginStatus==null)
	{
		loginStatus="false";
	}
	String id="null";
	
	if( loginStatus.equals("true"))
	{
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
	}
%>

<div class="container" style="padding-top:30px;">
	<div class="row">
		<div class="col-md-8">
			<img src="<%=item.getImgURL() %>" style="height:450px; width:750px;"><br><br>
			<div class="jumbotron" style="height:250px;">
				<%=item.getDesc() %>
			</div>
			
		</div>
		<div class="col-md-4" >
			<div class="jumbotron text-center" style="height:720px;">
				<%
					if(item.getIsDiscount().equals("1"))
					{
				%>
				
						<h3> <%=item.getPercentage() %>% 할인중 </h3>
				<%	
					}
				 %>
				
				<h3>상품 이름 :<%= item.getName()%></h3><br><br>
				<%
					if(item.getIsDiscount().equals("1"))
					{
						int price=Integer.parseInt(item.getPrice());
						float discount=(float)price*(float)(Float.parseFloat( item.getPercentage())*0.01f);
						price-=(int)discount;
				%>
						<h4>원 가격 :<%=item.getPrice() %></h4><br><br>
						<h3>할인 가격 :<%=price %></h3><br><br>
				<%
					}
					else
					{
				%>
						<h3>가격 :<%=item.getPrice() %></h3><br><br>
				<%
					}
				%>
				<h3>출시일 :<%= item.getRelease()%></h3><br><br>
				<h3>수량 :<%= item.getQuantity()%></h3><br><br><br><br><br>
				
				<%
					if(Integer.parseInt( item.getQuantity()) <=0)
					{
						
					
				%>
				<a href="Product_order.jsp?itemName=<%=item.getName() %>" class="btn btn-default " disabled="disabled"><h4>품절</h4></a>&nbsp;
				<%
					}
					else {
				%>
				<a href="Product_order.jsp?itemName=<%=item.getName() %>" class="btn btn-default " ><h4>구매하기</h4></a>&nbsp;
				<%
					}
				%>
					 	 <%
		 			 	 	if(loginStatus.equals("false"))
		 			 	 	{
		 			 	 %> 
		 			 	  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" style="height:50px;width:100px;"><h4>장바구니</h4></button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">에러</h4>
        </div>
        <div class="modal-body">
          <p>로그인이 필요한 서비스입니다</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
		 			 	 <%
		 			 	 	}
		 			 	 	else
		 			 	 	{
		 			 	 %>
		 			 	 
		 			 	 <a href="Product_cartProcess.jsp?itemName=<%=itemName %>&ID=<%=id %>" class="btn btn-default" style="height:50px;width:100px;"><h4>장바구니</h4> </a>
		 				<%
		 					}
		 				%>
			</div>
		</div>
		
	</div>
</div>

</body>
</html>