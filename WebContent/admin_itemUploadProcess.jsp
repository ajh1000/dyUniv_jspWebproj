<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="itemMgr" class="simpleBean.ItemMgr" />
<jsp:useBean id="itemBean" class="simpleBean.ItemBean"/>
<jsp:setProperty property="*" name="itemBean"/>
<body>
<%
	String platform=request.getParameter("main_category");
	if(platform.equals("1"))
	{
		String realImgUrl="img/ps4/"+request.getParameter("imgURL");
		itemBean.setImgURL(realImgUrl);
	}
	else if(platform.equals("2")){

		String realImgUrl="img/xboxone/"+request.getParameter("imgURL");
		itemBean.setImgURL(realImgUrl);
	}
	else if(platform.equals("3")){

		String realImgUrl="img/steam/"+request.getParameter("imgURL");
		itemBean.setImgURL(realImgUrl);
	}
	else if(platform.equals("4")){

		String realImgUrl="img/gift/"+request.getParameter("imgURL");
		itemBean.setImgURL(realImgUrl);
	}
	
	StringBuffer desc=new StringBuffer(request.getParameter("desc"));
int loc = (new String(desc)).indexOf('\n');
    while(loc > 0){
    	desc.replace(loc, loc+1, "<BR>");
        loc = (new String(desc)).indexOf('\n');
   }
	out.print(desc);
	itemBean.setDesc(desc.toString());
	

	itemBean.setIsDiscount(request.getParameter("IsDiscount"));

	itemBean.setIsHot(request.getParameter("IsHot"));
	

	out.print(itemBean.getIsDiscount());
	out.print(itemBean.getIsHot());
	out.print(itemMgr.insertItem(itemBean));
	response.sendRedirect("admin.jsp?page=itemUpload");
%>

</body>
</html>