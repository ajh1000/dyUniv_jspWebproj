<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
  <link rel="stylesheet" href="css/bootstrap.min.css">  
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
<style type="text/css">
.carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      height:600px;
      margin: auto;
  }

</style>
<script>

$(document).scroll(function(e){
    var scrollTop = $(document).scrollTop();
    if(scrollTop > 0){
        console.log(scrollTop);
        $('.navbar').removeClass('navbar-static-top').addClass('navbar-fixed-top');
        document.getElementById("top_main").style.marginTop=50+"px";
    } else {
        $('.navbar').removeClass('navbar-fixed-top').addClass('navbar-static-top');
        document.getElementById("top_main").style.marginTop=0+"px";

    }

});

</script>

<jsp:useBean id="memMgr" class="simpleBean.MemberMgr" />

<%

	
	String loginStatus=(String)session.getAttribute("login");
	if(loginStatus==null)
	{
		loginStatus="false";
	}
	
	String id=null;
	boolean admin=false;
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
		
		admin=memMgr.adminCheck(id);
	}
	
%>

<title>게임 쇼핑몰</title>
</head>
<body style="width: auto; height:1300px;/*for test scroll*/ background-color: grey;  ">
<header>
  <div class="container" style="padding-top: 20px; padding-bottom: 20px; ">
 <div class="row">
    <div class="col-sm-2">
      <a href="main.jsp"><img src="img/logogogo.png" style="width:130px;height:60px;"></a>
    </div>
    <div class="col-sm-7">
      <form class="form-inline" method="get" action="search.jsp">
          <div class="from-group" >         
         <input type="text" class="form-control" name="search" placeholder="Search..." style="height:40px;width:500px;" >
         <button type="submit" class="btn btn-default" style="height:40px;">
             <span class="glyphicon glyphicon glyphicon-menu-right" aria-hidden="true"></span>
         </button>
          </div>
        </form>
    </div>
    <div class="col-sm-3">
    <%
    	if(loginStatus.equals("false") )
    	{
    	
  	%>
 		  <a class="btn btn-default" href="login.jsp">로그인</a>

 	 	  <a class="btn btn-default" href="register.jsp">회원가입</a>
    <%
	
    	}
    	else if(admin==true)
    	{
    %>
    	
    <a class="btn btn-default" href="admin.jsp?page=memberUpdate">관리자 페이지</a>

    <a class="btn btn-default" href="logout.jsp">로그아웃</a>
    <%
    	}
    	else
    	{
    %>
    
    <a class="btn btn-default" href="mypage.jsp?curPage=info">마이페이지</a>

    <a class="btn btn-default" href="logout.jsp">로그아웃</a>
    <%
    	}
    %>

    </div>
  </div>
</div>
</header>

<nav class="navbar navbar-inverse navbar-static-top" style="margin-bottom: 0; opacity: 0.75; ">
  <div class="container">
    <div class="navbar-header" >
      <a class="navbar-brand" href="main.jsp">게임 쇼핑몰</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="main.jsp">메인 홈</a></li>
       <li><a href="Product.jsp?page=PS4">PS4</a></li>
       <li><a href="Product.jsp?page=XBOXONE">XBOX ONE</a></li>
       <li><a href="Product.jsp?page=STEAM">STEAM</a></li>
       <li><a href="Product.jsp?page=GIFT">악세사리</a></li>
       <li><a href="faq.jsp?page=notice">고객센터</a></li>

    </ul>
  </div>
</nav>
</body>
</html>