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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>상품 리스트</title>
</head>
<body>
<%@ include file="../include/topmenu.jsp" %>
<%
	String image_url = "D:\\sh_file\\shoppingmall\\" ;
/* 	image_url += ${top.image}; */

%>


<div>
	<div>
		<button onclick="location.href='productinsert.do'">상품추가</button>
	</div>
	 <!-- 반복문 -->
     <c:forEach var="result" items="${top}" varStatus="status">
     	<div>
     	<%-- <img src="<%= image_url%>${result.image}" id="index_main_image"/> --%>

     		${result.image}
     		<span>${result.name} </span>
     		<button>수정</button>
			<button>삭제</button>
     	</div>
     </c:forEach>
</div>
</body>
</html>