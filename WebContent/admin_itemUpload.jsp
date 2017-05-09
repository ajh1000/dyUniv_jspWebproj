<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function changeSelectList()
	{
		var main=document.getElementById("main_category");
		var sub=document.getElementById("sub_category");

		
		if(main.selectedIndex==3)
		{
			sub.remove(0);
			sub.remove(1);
			sub.remove(1);
			sub.remove(1);
			sub.remove(1);
			sub.remove(1);
			sub.remove(1);
			sub.remove(1);
			sub.remove(1);
			sub.remove(0);

			var option = document.createElement("option");
			option.text = "headset";
			option.value="1"
			sub.add(option);
			option = document.createElement("option");
			option.text = "mouse";
			option.value="2"
			sub.add(option);
			option = document.createElement("option");
			option.text = "mousepad";
			option.value="3"
			sub.add(option);
			option = document.createElement("option");
			option.text = "moniter";
			option.value="4"
			sub.add(option);
			option = document.createElement("option");
			option.text = "keyboard";
			option.value="5"
			sub.add(option);
			option = document.createElement("option");
			option.text = "usb";
			option.value="6"
			sub.add(option);
			
		}
		else
		{
			sub.remove(1);
			sub.remove(1);
			sub.remove(1);
			sub.remove(1);
			sub.remove(1);
			sub.remove(1);
			sub.remove(1);
			sub.remove(1);
			sub.remove(0);

			var option = document.createElement("option");
			option.text = "fight";
			option.value="1"
			sub.add(option);
			option = document.createElement("option");
			option.text = "race";
			option.value="2"
			sub.add(option);
			option = document.createElement("option");
			option.text = "rpg";
			option.value="3"
			sub.add(option);
			option = document.createElement("option");
			option.text = "fps";
			option.value="4"
			sub.add(option);
			option = document.createElement("option");
			option.text = "action";
			option.value="5"
			sub.add(option);
			option = document.createElement("option");
			option.text = "simulation";
			option.value="6"
			sub.add(option);
			
		}
		
	}
</script>
</head>
<body>
<div class="jumbotron " style="height:1500px;">
			<form method="post" action="admin_itemUploadProcess.jsp" >
				
				<!--  FORM  -->
				<div class="form-group">
					<div class="form-inline">
		   				 <label>상품 이름:</label>
		   				 <input type="text" class="form-control" name="name" style="width:300px; height:50px;" required >
		 			</div>
		 			<br>
		 			<div class="form-inline">
		   				 <label>가격:</label>
		   				 <input type="text" class="form-control" name="price" style="width:300px; height:50px;"required >	 
		 			</div>
					<br>
		 			<div class="form-inline">
		   				 <label>출시일:</label>
		   				 <input type="date" class="form-control" name="release" style="width:300px; height:50px;"required >	 
		 			</div>
					<br>
		 			<div class="form-inline">
		   				 <label>플랫폼:</label>
		   				 <select class="form-control" id="main_category" name="main_category" style="width:300px; height:50px;" onchange="changeSelectList()">
						    <option value="1">PS4</option>
						    <option value="2">XBOXONE</option>
						    <option value="3">STEAM</option>
						    <option value="4">GIFT</option>
						  </select>
		 			</div>
					<br>
		 			<div class="form-inline">
		   				 <label>종류:</label>
		   				 <select class="form-control" id="sub_category" name="sub_category"style="width:300px; height:50px;">
						    <option value="1">fight</option>
						    <option value="2">race</option>
						    <option value="3">rpg</option>
						    
						    <option value="4">fps</option>
						    
						    <option value="5">action</option>
						    
						    <option value="6">simulation</option>
						  </select>	 
		 			</div><br>
					<div class="form-inline">
					    <label for="imgURL">File Input : </label>
					    <input class="form-control" type="file" name="imgURL" >
					</div><br>
					<div class="form-inline">
		   				 <label>할인중:</label>
		   				 <select class="form-control" id="IsDiscount" name="IsDiscount" style="width:300px; height:50px;">
						    <option value="0" selected>NO</option>
						    <option value="1">YES</option>
						  </select>	 
		 			</div><br>
					<div class="form-inline">
		   				 <label>할인 퍼센트:</label>
		   				 <input type="text" class="form-control" name="percentage" value="0" style="width:300px; height:50px;"
		   				  required >
		 			</div>
		 			<br>
		 			<div class="form-inline">
		   				 <label>인기 상품:</label>
		   				 <select class="form-control" id="IsHot" name="IsHot" style="width:300px; height:50px;">
						    <option value="0" selected>NO</option>
						    <option value="1">YES</option>
						  </select>	  
		 			</div><br>
		 			<div class="form-inline">
		   				 <label>수량:</label>
		   				 <input type="text" class="form-control" name="quantity" style="width:300px; height:50px;"required >	 
		 			</div><br>
		 			<div class="form-inline">
		   				 <label>설명:</label>
		   				 <textarea class="form-control" rows="15" name="desc" style="width:500px; height:200px;"></textarea> 
		 			</div><br>
	 				<button type="submit" class="btn btn-default" style="height:50px;width:100px;">상품 등록</button>
		 			
		 		</div>
		 		
			</form>
</div>

</body>
</html>