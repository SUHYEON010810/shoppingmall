<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/shoppingmall/reset.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/shoppingmall/topdetail.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>상품 리스트</title>
</head>
<body>
<%@ include file="../include/topmenu.jsp" %>
<%
	String image_url = "./image/" ;
/* 	image_url += ${top.image}; */

%>


<div>

	 <!-- 반복문 -->
	 	<table>
	 	<div id="titlebtn">
			<h2>상의 리스트 </h2>
			<button onclick="location.href='productinsert.do'" class="bt_css" id="insertproductBTN">상품추가</button>
	 	</div>

	 		<tr>
	 			<th>상품명</th>
	 			<th>가격</th>
	 			<th>등록일</th>
	 		</tr>
	 		<c:forEach var="result" items="${top}" varStatus="status">
     			<tr>

     				<td><a href="topproductDetail.do?prodnum=${result.prodnum}"> ${ result.name } </a></td>
     				<td>${result.price}</td>
     				<td>${result.regdate}</td>
     			</tr>
     		</c:forEach>
	 	</table>
</div>
</body>
</html>