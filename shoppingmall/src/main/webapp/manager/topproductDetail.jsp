<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/shoppingmall/reset.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/shoppingmall/topList.css">
<title>Insert title here</title>
</head>
<style>
	#d_frm{

		margin:5% 20%;
	}
	#d_big{
		width : 100%;
		height:100%;

	}

	.d_div{
		display: inline-block;

	}
	#contentdiv{
		height: 100%;
		width: 100%;
	}

	.data{
		margin-bottom:15px;
	}

	.data2{
		margin-bottom:10px;
	}
</style>

<body>
<%@ include file="../include/topmenu.jsp" %>
	<form action="#" encType="multipart/form-data" method="post" id="d_frm">
		<div id="d_big">
			<div class="d_div" style=" width: 55%;">
				<img src="imgLoad.do?fileName=${topdetail.image }" style="width:100%; height:80% display: inline-block; padding-right: 60px;"/>
			</div>
			<div class="d_div"  style=" width: 35%;">
				<div id="contentdiv" style="margin-left:30px;">
					<h3>${topdetail.name } </h3>
					<p class="data">가격 : ${topdetail.price }</p>
					<p class="data">배송비 : 2500원</p>
					<p class="data2">옵션</p>
					<select class="data">
						<option>베이지</option>
						<option>블랙</option>
					</select>
					<p class="data2">구매수량</p>
					<select class="data">
						<option>1</option>
						<option>2</option>
					</select>
					<div>
						<button>장바구니</button>
						<button>구매</button>
					</div>

				</div>

			</div>
		</div>
	</form>

</body>
</html>