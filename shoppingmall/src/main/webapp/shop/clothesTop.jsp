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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>상품 리스트</title>
</head>
<body>
<%@ include file="../include/topmenu.jsp" %>
	<div id="topListdiv">
		<div id="titlebtn">
		<h2>상품 목록</h2>
	 	</div>
	 	<div id="topLiatdiv__items">
			<c:forEach var="result" items="${top}" varStatus="status">
				<div class="topLiatdiv__items__item">
					<img src="imgLoad.do?fileName=${result.image }" class="topimage"/>
					<a href="productDetail.do?prodnum=${result.prodnum}"> ${ result.name } </a>
				</div>
			</c:forEach>
		</div>

		<div id="pagediv" style="margin-top:5px; text-align:center; margin-bottom: 30px;" >
			<c:forEach var="i" begin="1" end="${totalPage }">
				<a href="clothesTop.do?viewPage=${i }&kindint=${ kindint }">${i }</a>
			</c:forEach>
    	</div>
	</div>
</body>
</html>