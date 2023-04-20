<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style>
	#topmenuDiv_top{
		background-color: #D8D8D8;
		width: 100%;
		height: 20px;
		margin-bottom: 10px;
	}
	#topmenuDiv{
		text-align:center;
		font-size:17px;
	}

	#topmenuDiv_left{
		float:left;
		font-size: 25px;
		font-weight: 1000;
	}

	#topmenuDiv_right{
		float:right;
		font-size: 15px;
	}
	#topMenu_logout{
		margin-left:15px;

	}
	#topMenu_table{
		margin-top : 60px;
		width: 100%;
	}
	#topMenu_table td{
		border: 1px solid ;
		padding: 10px 0px;
		width: 25%
	}
	#topmenudiv_bottom{
		margin:0px 8px;
	}


</style>
</head>

<%
	String USERID  = (String) session.getAttribute("SessionUserID");
	Object divide = session.getAttribute("Sessiondiv");
	int div ;
	String userdiv = "";

	if(divide != null){
		div = (int) divide;
		if(div == 0)
			userdiv ="관리자";
		else if(div ==1)
			userdiv = "사용자";
	}




%>
<div id="topmenuDiv">
	<div id="topmenuDiv_top"></div>
	<div id="topmenudiv_bottom">
		<div id="topmenuDiv_left"><a href="/shoppingmall/index.do"> shopping mall </a></div>
		<div id="topmenuDiv_right">
			<% if(USERID == null){ %>
					<a class="topMenuA" href="#"> 장바구니 </a>
					<a class="topMenuA" href="/shoppingmall/login.do">로그인</a>
				<% }else{ %>
					<label style="font-size:12px; color:#6E6E6E; margin-right:10px;"><%= userdiv %></label>
					<a class="topMenuA" href="#"> 장바구니 </a>
					<a class="topMenuA" id="topMenu_logout" href="/shoppingmall/logout.do"> 로그아웃</a>
				<%} %>
		</div>
	</div>

	<table id="topMenu_table">
		<tr>
			<% if(userdiv == "관리자"){ %>
				<td onclick="location.href='managerClothesTop.do?clothes=상의'">상의</td>
				<td  onclick="location.href='managerClothesTop.do?clothes=하의'">하의</td>
				<td onclick="location.href='managerClothesTop.do?clothes=원피스'">원피스</td>
				<td>상품문의</td>
			<% }else{ %>
				<td onclick="location.href='clothesTop.do?clothes=상의'">상의</td>
				<td onclick="location.href='clothesTop.do?clothes=하의'">하의</td>
				<td onclick="location.href='clothesTop.do?clothes=원피스'">원피스</td>
				<td>상품문의</td>
			<%} %>
		</tr>
	</table>

</div>

</body>
</html>