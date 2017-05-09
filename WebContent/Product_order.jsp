<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="simpleBean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<jsp:include page="top_module.jsp"/>
<jsp:useBean id="itemMgr" class="simpleBean.ItemMgr"/> 
</head>
<body>
<%
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
	
	ItemBean item=itemMgr.getItemInfo(request.getParameter("itemName"));
%>

<div class="container" style="padding-top:20px; ">
	<div class="jumbotron text-center" style="margin-bottom : 10px;">
		<div class="row">
			<div class="col-md-5">
				<%
					if(item.getIsDiscount().equals("1"))
					{
				%>
						<%=item.getPercentage() %>% 할인중<br>		
				<%
					}
				%>
				<img src="<%=item.getImgURL() %>" style="height:450px;width:300px;">
			</div>
			<div class="col-md-7">
			
				<h3>상품명: <%=item.getName() %></h3><br><br>
				<%
					if(item.getIsDiscount().equals("1"))
					{
						int price=Integer.parseInt(item.getPrice());
						float discount=(float)price*(float)(Float.parseFloat( item.getPercentage())*0.01f);
						price-=(int)discount;
				%>
						<h4>원 가격 :<%=item.getPrice() %></h4><br><br>
						<h3>할인 최종 가격 :<%=price %></h3><br><br>
				<%
					}
					else
					{
				%>
						<h3>최종 가격 :<%=item.getPrice() %></h3><br><br>
				<%
					}
				%>
				<h3>계좌주 명 : NAME123</h3><br><br>
				<h3>우리은행 계좌번호 : 1002-046-352520</h3>
				
			</div>
		</div>
	</div>
	<div class="jumbotron text-center">
		<form method="post" action="Product_orderProcess.jsp?itemName=<%=item.getName() %>&ID=<%=id %>" >
				
				<!--  FORM  -->
				<div class="form-group">
					<div class="form-inline">
		   				 <label>남은 수량 :</label>
		   				 <input type="text" class="form-control" name="left" value="<%=item.getQuantity() %>" style="width:100px; height:50px;" disabled >
		 			 
		 			 	 <label>&nbsp;&nbsp;&nbsp;&nbsp;수량 :</label>
		 			 	 <input type="text" class="form-control" name="quantity" style="width:100px; height:50px;"  required >
		 			 	 
		 			 	 <label>&nbsp;&nbsp;&nbsp;&nbsp;입금자 명 :</label>
		 			 	 <input type="text" class="form-control" name="buyer" style="width:100px; height:50px;" required >
		 			 	
		 			 	 <label>&nbsp;&nbsp;&nbsp;&nbsp;
		 			 	 &nbsp;&nbsp;&nbsp;&nbsp;
		 			 	 &nbsp;&nbsp;&nbsp;&nbsp;</label>
		 			 	 <%
		 			 	 	if(loginStatus.equals("false"))
		 			 	 	{
		 			 	 %>
		 			 	  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">구매 하기</button>

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
		 			 	 
		 			 	 <button type="submit" class="btn btn-default" style="height:50px;width:100px;">구매 하기</button>
		 				<%
		 					}
		 				%>
		 			</div>
		 		</div>
 		</form>
	</div>
	
</div>

</body>
</html>