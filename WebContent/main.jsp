<%@page import="simpleBean.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import ="java.util.*" %>

<jsp:include page="top_module.jsp"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      height:600px;
      margin: auto;
  }

</style>
</head>
<body>
<jsp:useBean id="itemMgr" class="simpleBean.ItemMgr"/>


<section id="top_main" style="background-color: rgb(0,0,0); ">


	<div class="container" >

		<div class="row" >

	      <div class="col-md-12 " style=" padding-left: 0 ; padding-right: 0 ; margin-right:0; margin-left: 0; " >
	        <div id="myCarousel" class="carousel slide" data-ride="carousel" style="height:410px;">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox" style="height:410px;">
      <div class="item active">
        <a href="Product_ItemInfo.jsp?itemName=nice%20keyboard1"><img src="img/gift/keyboard1.jpg" width="350" height="410"></a>
      </div>

      <div class="item">
        <a href="Product_ItemInfo.jsp?itemName=the%20witcher%203"><img src="img/witcher3.jpg"  width="350" height="410"></a>
      </div>
    
      <div class="item">
        <a href="Product_ItemInfo.jsp?itemName=FINAL%20FANTASY%20XV"><img src="img/ps4/FFXV_Jacket-front_KR.jpg"  width="350" height="410">
        </a>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
	      </div>
	      <!-- 
	      <div class="row col-md-4 " style=" padding-left: 0 ; padding-right: 0 ; margin-right:0; margin-left: 0; ">
	        	<img src="img/event.jpg" alt="" class="img-responsive"  style="width: 100%; height: 410px;">
	        
	       
	      </div> -->
	    </div>
	</div>

</section>

<!-- 상품 미리보기 박스 -->
<div class="container" style="padding-top:50px;">
	<div class = "jumbotron" >
	  <ul class="nav nav-tabs" >
	    <li class="active"><a data-toggle="tab" href="#PS4" style="color:black;">PS4</a></li>
	    <li><a data-toggle="tab" href="#XBOXONE" style="color:black;">XBOX ONE</a></li>
	    <li><a data-toggle="tab" href="#STEAM" style="color:black;">STEAM</a></li>
	    <li><a data-toggle="tab" href="#GIFT" style="color:black;">GIFT</a></li>
	  </ul>
	<div class="tab-content">
   		 <div id="PS4" class="tab-pane fade in active"> 
   		 <%
   		
   	 		Vector<ItemBean> itemList=itemMgr.getItemList("null", "null", "PS4");
   		 
   	
   		 	for(int i=0;i<2;++i)
   		 	{
   		 %>
		    <div class="row text-center" style="padding-top:10px;">
			    <%for(int j=i*4;j<i*4+4 && j<itemList.size();++j){%>
			    <div class="col-md-3">
			    	<a href="Product_ItemInfo.jsp?itemName=<%=itemList.get(j).getName() %>">
			    	<img src="<%=itemList.get(j).getImgURL()%>" style="width:94px;height:100px;">
			    	</a>
			    	<br>NAME:<%=itemList.get(j).getName() %>
			    	<br>PRICE:<%=itemList.get(j).getPrice() %>
			    	<br>RELEASE:<%=itemList.get(j).getRelease() %>
			    </div>
			    <%
			     }
			     %>
			</div>
			<%} %>
 	 		
 	 		</div>
   
    <div id="XBOXONE" class="tab-pane fade"> 
		     <%
   		
   	 		itemList=itemMgr.getItemList("null", "null", "XBOXONE");
   		 
   	
   		 	for(int i=0;i<2;++i)
   		 	{
   		 %>
		    <div class="row text-center" style="padding-top:10px;">
			    <%for(int j=i*4;j<i*4+4 && j<itemList.size();++j){%>
			    <div class="col-md-3">
			    	<a href="Product_ItemInfo.jsp?itemName=<%=itemList.get(j).getName() %>">
			    	<img src="<%=itemList.get(j).getImgURL()%>" style="width:94px;height:100px;">
			    	</a>
			    	<br>NAME:<%=itemList.get(j).getName() %>
			    	<br>PRICE:<%=itemList.get(j).getPrice() %>
			    	<br>RELEASE:<%=itemList.get(j).getRelease() %>
			    </div>
			    <%
			     }
			     %>
			</div>
			<%} %>
 		</div>
    
    <div id="STEAM" class="tab-pane fade"> 
		     <%
   		
   	 		itemList=itemMgr.getItemList("null", "null", "STEAM");
   		 
   	
   		 	for(int i=0;i<2;++i)
   		 	{
   		 %>
		    <div class="row text-center" style="padding-top:10px;">
			    <%for(int j=i*4;j<i*4+4 && j<itemList.size();++j){%>
			    <div class="col-md-3">
			    	<a href="Product_ItemInfo.jsp?itemName=<%=itemList.get(j).getName() %>">
			    	<img src="<%=itemList.get(j).getImgURL()%>" style="width:94px;height:100px;">
			    	</a>
			    	<br>NAME:<%=itemList.get(j).getName() %>
			    	<br>PRICE:<%=itemList.get(j).getPrice() %>
			    	<br>RELEASE:<%=itemList.get(j).getRelease() %>
			    </div>
			    <%
			     }
			     %>
			</div>
			<%} %>
 		</div>
    
    <div id="GIFT" class="tab-pane fade"> 
		    <%
   		
   	 		itemList=itemMgr.getItemList("null", "null", "GIFT");
   		 
   	
   		 	for(int i=0;i<2;++i)
   		 	{
   		 %>
		    <div class="row text-center" style="padding-top:10px;">
			    <%for(int j=i*4;j<i*4+4 && j<itemList.size();++j){%>
			    <div class="col-md-3">
			    	<a href="Product_ItemInfo.jsp?itemName=<%=itemList.get(j).getName() %>">
			    	<img src="<%=itemList.get(j).getImgURL()%>" style="width:94px;height:100px;">
			    	</a>
			    	<br>NAME:<%=itemList.get(j).getName() %>
			    	<br>PRICE:<%=itemList.get(j).getPrice() %>
			    	<br>RELEASE:<%=itemList.get(j).getRelease() %>
			    </div>
			    <%
			     }
			     %>
			</div>
			<%} %>
 		</div>
	
 		</div>
	</div>
	</div>
</body>
</html>